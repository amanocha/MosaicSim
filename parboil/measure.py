import argparse
import numpy as np
import os
import re
import sys
import time

# EXPERIMENT INFO
output = ""
config = ""

# FILE INFO
source = ""
data = ""

# COMPILER INFO
filename = ""
mode = ""
compile_dir = ""
flags = ""
threads = 1

# EXECUTION INFO
app_name = ""
app_input = ""
new_dir = ""
epoch = -1
compute_nodes = -1

# METRICS
gen_metrics = ["Average BW", "cycles", "LD", "ST", "total_instructions", "global_energy", "global_avg_power"]
load_metrics = ["Total Mem Access Latency", "Avg Mem Access Latency", "Mean # DRAM Accesses Per 1024-cycle Epoch", "Median # DRAM Accesses Per 1024-cycle Epoch", "Max # DRAM Accesses Per 1024-cycle Epoch"]
decoupling_metrics = ["Total Recv Latency", "Avg Recv Latency", "Total Runahead Distance", "Number of Receive_Instructions", "Average Runahead Distance"]

L1_LATENCY = 10
L2_LATENCY = 100
CACHELINE_SIZE = 64

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-s", "--source", type=str, help="Path to source code file")
    parser.add_argument("-d", "--data", type=str, help="Path to data file")
    parser.add_argument("-e", "--epoch", type=int, default=-1, help="Epoch used for sampling")
    parser.add_argument("-n", "--compute_nodes", type=int, default=-1, help="Number of compute nodes to sample with")
    parser.add_argument("-c", "--config", type=str, default="IO", help="Core configuration (IO or OOO)")
    parser.add_argument("-t", "--num_threads", type=int, default=1, help="Number of threads")
    parser.add_argument("-m", "--mode", type=str, default="db", help="Compilation variant: decades_base (db) or decades_decoupled_implicit (di) or perfect cache (PC)")
    parser.add_argument("-o", "--output", type=str, help="Output path")
    parser.add_argument("-co", "--compile_only", type=int, default=0, help="Only compile and execute")
    args = parser.parse_args()
    return args

def compile():
    print("Compiling application...\n")
    #cmd_args = ["PDEC++", "-m", mode, "-t", str(threads), filename, ">", output + "compiler_output.txt"]
    if mode == "PC":
        compile_mode = "db"
    else:
        compile_mode = mode

    include = "../../../../common/include/"
    if app_name == "spmv":
      include = include + " ../../common_src/convert-dataset/"

    cmd_args = ["PDEC++", "-I", include, "-m", compile_mode, "-t", str(threads), "../../../../common/src/parboil.c", filename]

    if app_name == "cutcp":
      cmd_args += ["readatom.c", "output.c", "excl.c", "cutcpu.c"]
    elif app_name == "histo":
      cmd_args += ["util.c"]
    elif app_name == "lbm":
      cmd_args += ["lbm.c"]
    elif app_name == "mri-q":
      cmd_args += ["file.cc"]
    elif app_name == "sad":
      cmd_args += ["file.c", "image.c"]
    elif app_name == "sgemm":
      cmd_args += ["io.cc"]
    elif app_name == "spmv":
      cmd_args += ["file.c", "../../common_src/convert-dataset/convert-dataset.c", "../../common_src/convert-dataset/mmio.c"]
    elif app_name == "stencil":
      cmd_args += ["file.c"]

    #cmd_args += [">", output + "compiler_output.txt", "2>", output + "compiler_err.txt"]
    cmd = " ".join(cmd_args)
    print(cmd)
    os.system(cmd)

def execute():
    print("Executing application...")
    if app_name == "bfs":
      datafiles = ["graph_input.dat"]
    elif app_name == "cutcp":
      datafiles = ["watbox.sl40_mod.pqr"]
    elif app_name == "histo":
      datafiles = ["img.bin"]
    elif app_name == "lbm":
      datafiles = ["120_120_150_ldc.of"]
    elif app_name == "mri-gridding":
      datafiles = ["small.uks"]
    elif app_name == "mri-q":
      datafiles = ["32_32_32_dataset.bin"]
    elif app_name == "sad":
      datafiles = ["frame.bin", "reference.bin"]
    elif app_name == "sgemm":
      datafiles = ["matrix1.txt", "matrix2.txt", "matrix2t.txt"]
    elif app_name == "spmv":
      datafiles = ["1138_bus.mtx", "vector.bin"]
    elif app_name == "stencil":
      datafiles = ["128x128x32.bin"]

    input_path = ""
    for d in datafiles:
      input_path = input_path + data + d
      if d != datafiles[len(datafiles)-1]:
        input_path = input_path + ","

    #cmd = "./" + compile_dir + "/" + compile_dir + " -i " + input_path + " " + " > " + output + "app_output.txt"
    cmd = "./" + compile_dir + "/" + compile_dir + " -i " + input_path
    
    output_path = input_path.split("/")[0:7] + ["output"]
    output_path = "/".join(output_path)
    cmd += " -o " + output_path + "/result"
    
    print(cmd)
    os.system(cmd)
    #cmd1 = "export LD_LIBRARY_PATH=\"/opt/rh/llvm-toolset-7/root/usr/lib64/\"; echo $LD_LIBRARY_PATH"
    #cmd1 = cmd1 + "; " + cmd
    #print(cmd1)
    #os.system(cmd1)

def simulate():
    print("Simulating application...")
    files = os.listdir(compile_dir)
    out_files = [int(f.split("_")[2]) for f in files if "output_compute" in f]
    threads = max(out_files) + 1

    cmd_args = ["pythiarun", "-n", str(threads), flags, "."]
    cmd_sim = ["-sc", "sim_cafe", "-o", output]
    cmd_config = ["-cc", "core_cafe"]
    cmd = " ".join(cmd_args + cmd_sim + cmd_config)
    print(cmd)
    os.system("pwd")
    os.system(cmd)

def measure():
    print("Gathering measurements...")
    measurements = open(output + "measurements.txt", "w+")

    # Read genStats
    measurements.write("GENERAL STATS\n")
    measurements.write("-------------\n\n")
    gen_stats = open(output + "genStats.txt")
    data = gen_stats.read()
    gen_stats.close()
    for gen_metric in gen_metrics:
        metrics = re.findall("^" + gen_metric + " : .*$", data, re.MULTILINE)
        measurements.write(metrics[len(metrics)-1])
        measurements.write("\n")
        if gen_metric == "cycles":
            match = re.match("cycles\s*:\s*(\d+)", metrics[len(metrics)-1])
            cycles = int(match.group(1))
        elif gen_metric == "LD":
            match = re.match("LD\s*:\s*(\d+)", metrics[len(metrics)-1])
            LD = int(match.group(1))
        elif gen_metric == "ST":
            match = re.match("ST\s*:\s*(\d+)", metrics[len(metrics)-1])
            ST = int(match.group(1))
        elif gen_metric == "total_instructions":
            match = re.match("total_instructions\s*:\s*(\d+)", metrics[len(metrics)-1])
            total_instructions = int(match.group(1))
    measurements.write("\n")

    measurements.write("Total Number of Memory Instructions: " + str(round((LD+ST),3)) + "\n")
    measurements.write("Percent of Instructions Spent on Memory: " + str(round((LD+ST)*100.0/total_instructions,3)) + "\n")
    measurements.write("Percent of Instructions Spent on Loads: " + str(round(LD*100.0/total_instructions,3)) + "\n")
    measurements.write("Percent of Instructions Spent on Stores: " + str(round(ST*100.0/total_instructions,3)) + "\n")
    measurements.write("Percent of Memory Instructions Spent on Loads: " + str(round(LD*100.0/(LD+ST),3)) + "\n")
    measurements.write("Percent of Memory Instructions Spent on Stores: " + str(round(ST*100.0/(LD+ST),3)) + "\n")
    measurements.write("\n")

    # Read memStats
    measurements.write("MEMORY ACCESS STATS\n")
    measurements.write("-------------------\n\n")
    load_stats = open(output + "memStats")
    load_stats.readline()

    if threads == 1: #True:
        load_counts = {}
        address_counts = {}
        cacheline_counts = {}
        node_counts = {}
        reaccess_counts = {}
        node_reaccess_counts = {}
        max_id = ""
        max_load = 0
        l1_hit_rate = 0
        l2_hit_rate = 0
        l1_hits = 0
        l2_hits = 0
        num_accesses = 0
        outstring = ""

        for line in load_stats:
            num_accesses = num_accesses + 1
            match = re.match("(\w+)\s+(\d+)\s+(\d+)\s+(-?\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\w+)", line)
            if (match == None):
              data = ""
              for i in range(6):
                data = data + load_stats.readline()
              for load_metric in load_metrics:
                metrics = re.findall("^" + load_metric + ".*$", data, re.MULTILINE)
                outstring = outstring + metrics[0] + "\n"
                if load_metric == "Total Mem Access Latency":
                  match = re.match("Total Mem Access Latency.+:\s*(\d+)", metrics[0])
                  total_mem = int(match.group(1))
              outstring = outstring + "\n"
              break

            address = int(match.group(2))
            node_id = match.group(3)
            graph_node_id = match.group(4)
            return_cycle = int(match.group(6))
            load_latency = int(match.group(7))
            result = match.group(8)

            if address in address_counts:
              address_counts[address][0] = address_counts[address][0] + 1
            else:
              address_counts[address] = [1, return_cycle]

            cacheline = int(address/CACHELINE_SIZE) * CACHELINE_SIZE
            if cacheline in cacheline_counts:
              cacheline_counts[cacheline][0] = cacheline_counts[cacheline][0] + 1
            else:
              cacheline_counts[cacheline] = [1, return_cycle]
            
            if node_id in node_counts:
              node_counts[node_id] = node_counts[node_id] + 1
            else:
              node_counts[node_id] = 1

            if node_id in load_counts:
                load_counts[node_id][0] = load_counts[node_id][0] + 1
                if (load_latency < L1_LATENCY): # L1 and L2 hit
                    load_counts[node_id][1] = (load_counts[node_id][1]*(load_counts[node_id][0]-1)*1.0 + 1)/load_counts[node_id][0]
                    load_counts[node_id][2] = (load_counts[node_id][2]*(load_counts[node_id][0]-1)*1.0 + 1)/load_counts[node_id][0]
                    l1_hits = l1_hits + 1
                    l2_hits = l2_hits + 1
                    l1_hit_rate = (l1_hit_rate*(num_accesses-1)*1.0+1)/num_accesses
                    l2_hit_rate = (l2_hit_rate*(num_accesses-1)*1.0+1)/num_accesses
                elif (load_latency < L2_LATENCY): # L1 miss and L2 hit
                    load_counts[node_id][1] = load_counts[node_id][1]*(load_counts[node_id][0]-1)*1.0/load_counts[node_id][0]
                    load_counts[node_id][2] = (load_counts[node_id][2]*(load_counts[node_id][0]-1)*1.0 + 1)/load_counts[node_id][0]
                    l2_hits = l2_hits + 1
                    l1_hit_rate = l1_hit_rate*(num_accesses-1)*1.0/num_accesses
                    l2_hit_rate = (l2_hit_rate*(num_accesses-1)*1.0+1)/num_accesses
                else:
                    load_counts[node_id][1] = load_counts[node_id][1]*(load_counts[node_id][0]-1)*1.0/load_counts[node_id][0]
                    load_counts[node_id][2] = load_counts[node_id][2]*(load_counts[node_id][0]-1)*1.0/load_counts[node_id][0]
                    l1_hit_rate = l1_hit_rate*(num_accesses-1)*1.0/num_accesses
                    l2_hit_rate = l2_hit_rate*(num_accesses-1)*1.0/num_accesses
                load_counts[node_id][3] = load_counts[node_id][3] + load_latency
                load_counts[node_id][4] = load_counts[node_id][3]*1.0/load_counts[node_id][0]
            else:
                load_counts[node_id] = np.zeros(5)
                load_counts[node_id][0] = 1
                if (load_latency < L1_LATENCY): # L1 and L2 hit
                    load_counts[node_id][1] = 1
                    load_counts[node_id][2] = 1
                    l1_hits = l1_hits + 1
                    l2_hits = l2_hits + 1
                    l1_hit_rate = (l1_hit_rate*(num_accesses-1)*1.0+1)/num_accesses
                    l2_hit_rate = (l2_hit_rate*(num_accesses-1)*1.0+1)/num_accesses
                elif (load_latency < L2_LATENCY): # L1 miss and L2 hit
                    load_counts[node_id][1] = 0
                    load_counts[node_id][2] = 1
                    l2_hits = l2_hits + 1
                    l1_hit_rate = l1_hit_rate*(num_accesses-1)*1.0/num_accesses
                    l2_hit_rate = (l2_hit_rate*(num_accesses-1)*1.0+1)/num_accesses
                else:
                    load_counts[node_id][1] = 0
                    load_counts[node_id][2] = 0
                    l1_hit_rate = l1_hit_rate*(num_accesses-1)*1.0/num_accesses
                    l2_hit_rate = l2_hit_rate*(num_accesses-1)*1.0/num_accesses
                load_counts[node_id][3] = 1
                load_counts[node_id][4] = 1
            if load_counts[node_id][3] > max_load:
                max_id = node_id
                max_load = load_counts[node_id][3]

        measurements.write("Node ID\t\t# Executions\tL1 Hit Rate\tL2 Hit Rate\tTotal Mem Latency\tAverage Mem Latency\n")
        for node_id in load_counts:
            node_info = load_counts[node_id]
            measurements.write(node_id + "\t\t" + str(int(node_info[0])) + "\t\t" + str(round(node_info[1],3)) + "\t\t" + str(round(node_info[2],3)) + "\t\t" + str(int(node_info[3])) + "\t\t\t" + str(round(node_info[4],3)) + "\n")
        measurements.write("\n")

        measurements.write("Node ID of Long-Latency Access: " + max_id + "\n")
        measurements.write("Long-Latency Access (cycles): " + str(int(max_load)) + "\n")
        measurements.write("Long-Latency Access L2 Hit Rate: " + str(load_counts[max_id][2]) + "\n")
        measurements.write("\n")
        measurements.write("L1 Hit Rate: " + str(round(l1_hit_rate,3)) + "\n")
        measurements.write("L2 Hit Rate: " + str(round(l2_hit_rate,3)) + "\n")
        measurements.write("Total Accesses: " + str(round(num_accesses,3)) + "\n")
        measurements.write(outstring)
        measurements.write("Percent of Total Latency Spent on Memory: " + str(round(total_mem*100.0/cycles,3)) + "\n")
        measurements.write("Percent of Total Latency Spent on Long-Latency Access: " + str(round(max_load*100.0/cycles,3)) + "\n")
        measurements.write("Percent of Memory Latency Spent on Long-Latency Access: " + str(round(max_load*100.0/total_mem,3)) + "\n")
        measurements.write("\n")

    if mode == "di":
        measurements.write("DECOUPLING STATS\n")
        measurements.write("----------------\n\n")
        decoupling_stats = open(output + "decouplingStats")
        data = decoupling_stats.read()
        decoupling_stats.close()
        for decoupling_metric in decoupling_metrics:
            metrics = re.findall("^" + decoupling_metric + ".*:\s*.*$", data, re.MULTILINE)
            print(decoupling_metric, metrics)
            measurements.write(metrics[0])
            measurements.write("\n")

    load_stats.close()
    measurements.close()

def main():
    global source, data
    global config, output
    global filename, mode, compile_dir, flags, threads
    global app_name, app_input, new_dir, epoch, compute_nodes

    args = parse_args()

    if not os.path.isfile(args.source):
        print("Invalid source file path entered!\n")
    else:
        source = args.source
        filename = os.path.basename(source)
        new_dir = os.path.dirname(source)
        app_name = source.split("/")[1]
        data = "/home/ts20/share/datasets/" + app_name + "/default/input/"
        
        print("Application: " + app_name)

        # compiler args
        mode = args.mode
        threads = args.num_threads

        if mode == "di":
            compile_dir = "decades_decoupled_implicit"
            flags = flags + "-d"
        else:
            compile_dir = "decades_base"

        epoch = args.epoch
        compute_nodes = args.compute_nodes
        config = args.config

        if args.output:
            output = args.output
        else:
            output = "/home/ts20/share/results/ispass/test1/" + app_name + "_" + str(threads) + "/"

        if (not os.path.isdir(output)):
          os.mkdir(output)

        print("Output directory: " + output)

        print("------------------------------------------------------------\n")
        os.chdir(new_dir)
        compile()
        execute()
        one = time.time()
        #simulate()
        two = time.time()
        print("Simulation Time = " + str(round(two - one)) + " seconds.\n")
        #measure()
        three = time.time()
        print("Measurement Time = " + str(round(three - two)) + " seconds.\n")

if __name__ == "__main__":
    main()
