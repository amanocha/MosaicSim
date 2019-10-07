import argparse
import numpy as np
import os
import re
import sys
import time

# EXPERIMENT INFO
output = ""

# FILE INFO
app = ""
source = ""
data = ""

# COMPILER INFO
filename = ""
compile_dir = "decades_base"
threads = 1

# EXECUTION INFO
app_input = ""
new_dir = ""

# METRICS
gen_metrics = ["Average BW", "cycles", "ATOMIC_ADD", "ATOMIC_CAS", "ATOMIC_FADD", "ATOMIC_MIN", "LD", "ST", "total_instructions", "l1_load_hits", "l1_load_misses", "l2_load_hits", "l2_load_misses", "L1 Miss Rate", "L2 Miss Rate", "cache_access", "dram_accesses", "global_energy", "global_avg_power", "Average Global Simulation Speed"]
load_metrics = ["Total Mem Access Latency", "Avg Mem Access Latency", "Mean # DRAM Accesses Per 1024-cycle Epoch", "Median # DRAM Accesses Per 1024-cycle Epoch", "Max # DRAM Accesses Per 1024-cycle Epoch"]

L1_LATENCY = 10
L2_LATENCY = 100
CACHELINE_SIZE = 64

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-a", "--app", type=str, help="Name of benchmark")
    parser.add_argument("-s", "--source", type=str, default="", help="Path to source code file")
    parser.add_argument("-t", "--num_threads", type=int, default=1, help="Number of threads")
    parser.add_argument("-r", "--real", type=int, default=0, help="Run on real machine in addition to simulation")
    parser.add_argument("-x", "--scale", type=int, default=0, help="Run scaling version")
    parser.add_argument("-o", "--output", type=str, help="Output path")
    args = parser.parse_args()
    return args

def compile(real):
    print("Compiling application...\n")
    if real:
        compile_mode = "DEC++"
    else:
        compile_mode = "PDEC++"

    include = "../../../../common/include/"

    if app != "bfs":
      cmd_args = [compile_mode, "-I", include, "-t", str(threads), "../../../../common/src/parboil.c", filename]
    else:
      cmd_args = [compile_mode, "-t", str(threads), filename]

    if app == "cutcp":
      cmd_args += ["readatom.c", "output.c", "excl.c", "cutcpu.c"]
    elif app == "histo":
      cmd_args += ["util.c"]
    elif app == "lbm":
      cmd_args += ["lbm.c"]
    elif app == "mri-q":
      cmd_args += ["file.cc"]
    elif app == "sad":
      cmd_args += ["file.c", "image.c"]
    elif app == "spmv":
      cmd_args += ["file.c", "convert-dataset/convert_dataset.c", "convert-dataset/mmio.c"]
    elif app == "stencil":
      cmd_args += ["file.c"]
    elif app == "tpacf":
      cmd_args += ["args.c", "model_io.c"]

    #cmd_args += [">", output + "compiler_output.txt", "2>", output + "compiler_err.txt"]
    cmd = " ".join(cmd_args)
    print(cmd)
    os.system(cmd)

def execute(real):
    print("Executing application...")
    if app == "bfs":
      datafiles = ["Kronecker_24.el"] #["graph_input.dat"]
    elif app == "cutcp":
      datafiles = ["watbox.sl40_mod.pqr"]
    elif app == "histo":
      datafiles = ["img.bin"]
    elif app == "lbm":
      datafiles = ["120_120_150_ldc.of"]
    elif app == "mri-gridding":
      datafiles = ["small.uks"]
    elif app == "mri-q":
      datafiles = ["32_32_32_dataset.bin"]
    elif app == "sad":
      datafiles = ["frame.bin", "reference.bin"]
    elif app == "sgemm":
      datafiles = ["matrix1.txt", "matrix2.txt", "matrix2t.txt"]
    elif app == "spmv":
      datafiles = ["Dubcova3.mtx.bin", "vector.bin"]
    elif app == "stencil":
      datafiles = ["128x128x32.bin"]
    elif app == "tpacf":
      datafiles = ["Datapnts.1"]
      for i in range(100):
        datafiles.append("Randompnts." + str(i+1))

    input_path = ""
    for d in datafiles:
      input_path = input_path + data + d
      if d != datafiles[len(datafiles)-1]:
        input_path = input_path + ","

    if (real):
      output_name = "app_output_real.txt"
    else:
      output_name = "app_output.txt"

    if app != "bfs":
      cmd = "./" + compile_dir + "/" + compile_dir + " 1 -i " + input_path + " " + " > " + output + output_name
    else:
      cmd = "./" + compile_dir + "/" + compile_dir + " 1 " + input_path + " " + " > " + output + output_name

    #cmd = "./" + compile_dir + "/" + compile_dir + " 1 -i " + input_path
    
    output_path = input_path.split("/")[0:7] + ["output"]
    output_path = "/".join(output_path)
    cmd += " -o result"
    
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

    cmd_args = ["pythiarun", "-n", str(threads), "."]
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
        metrics = re.findall("^" + gen_metric + "\s*: .*$", data, re.MULTILINE)
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
        elif gen_metric == "ATOMIC_ADD":
            match = re.match("ATOMIC_ADD\s*:\s*(\d+)", metrics[len(metrics)-1])
            ATOMIC_ADD = int(match.group(1))
        elif gen_metric == "ATOMIC_CAS":
            match = re.match("ATOMIC_CAS\s*:\s*(\d+)", metrics[len(metrics)-1])
            ATOMIC_CAS = int(match.group(1))
        elif gen_metric == "ATOMIC_FADD":
            match = re.match("ATOMIC_FADD\s*:\s*(\d+)", metrics[len(metrics)-1])
            ATOMIC_FADD = int(match.group(1))
        elif gen_metric == "ATOMIC_MIN":
            match = re.match("ATOMIC_MIN\s*:\s*(\d+)", metrics[len(metrics)-1])
            ATOMIC_MIN = int(match.group(1))
        elif gen_metric == "total_instructions":
            match = re.match("total_instructions\s*:\s*(\d+)", metrics[len(metrics)-1])
            total_instructions = int(match.group(1))
        elif gen_metric == "l1_load_hits":
            match = re.match("l1_load_hits\s*:\s*(\d+)", metrics[len(metrics)-1])
            l1_load_hits = int(match.group(1))
        elif gen_metric == "l1_load_misses":
            match = re.match("l1_load_misses\s*:\s*(\d+)", metrics[len(metrics)-1])
            l1_load_misses = int(match.group(1))
        elif gen_metric == "l2_load_hits":
            match = re.match("l2_load_hits\s*:\s*(\d+)", metrics[len(metrics)-1])
            l2_load_hits = int(match.group(1))
        elif gen_metric == "l2_load_misses":
            match = re.match("l2_load_misses\s*:\s*(\d+)", metrics[len(metrics)-1])
            l2_load_misses = int(match.group(1))
        elif gen_metric == "dram_accesses":
            match = re.match("dram_accesses\s*:\s*(\d+)", metrics[len(metrics)-1])
            dram_accesses = int(match.group(1))

    measurements.write("\n")
    mem_ops = LD+ST+ATOMIC_ADD+ATOMIC_CAS+ATOMIC_FADD+ATOMIC_MIN
    compute_ops = total_instructions - mem_ops
    measurements.write("Total Number of Compute Instructions: " + str(compute_ops) + "\n")
    measurements.write("Total Number of Memory Instructions: " + str(mem_ops) + "\n")
    measurements.write("Percent of Instructions Spent on Memory: " + str(round((LD+ST)*100.0/total_instructions,3)) + "\n")
    measurements.write("Percent of Instructions Spent on Loads: " + str(round(LD*100.0/total_instructions,3)) + "\n")
    measurements.write("Percent of Instructions Spent on Stores: " + str(round(ST*100.0/total_instructions,3)) + "\n")
    measurements.write("Percent of Memory Instructions Spent on Loads: " + str(round(LD*100.0/(LD+ST),3)) + "\n")
    measurements.write("Percent of Memory Instructions Spent on Stores: " + str(round(ST*100.0/(LD+ST),3)) + "\n")
    measurements.write("\n")
    measurements.write("Calculated L1 Miss Rate: " + str(round(l1_load_misses*100.0/(l1_load_misses+l1_load_hits),3)) + "\n")
    measurements.write("Calculated LLC Miss Rate: " + str(round(l2_load_misses*100.0/(l1_load_misses+l1_load_hits),3)) + "\n")
    measurements.write("Calculated Compute to Memory Ratio: " + str(round(compute_ops/float(mem_ops),3)) + "\n")
    measurements.write("Calculated IPC: " + str(round(total_instructions/float(cycles),3)) + "\n")
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
            match = re.match("(\w+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\d+)\s+(\w+)", line)
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
            load_latency = int(match.group(6))
            result = match.group(7)

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

    load_stats.close()
    measurements.close()

def main():
    global source, data, output, real
    global filename, threads
    global app, app_input, new_dir

    args = parse_args()

    if not (os.path.isfile(args.source) or args.app):
        print("Please enter either a benchmark name or source file path!\n")
    else:
        real = args.real

        if (args.app):
          if (args.source != "" and args.source.split("/")[1] != args.app):
            print("Conflicting benchmark information entered: benchmark name does not match source file path!\n")
            sys.exit(1)
          else:
            app = args.app
            if (args.scale):
              if (args.real):
                main_name = "main_big.cc" # scaling on cafe
              else:
                main_name = "main.cc" # scaling on pythia
            else:
              main_name = "main_seq.cc" # sequential on cafe and pythia
            source = "benchmarks/" + app + "/src/base/" + main_name
            if not (os.path.isfile(source)):
              print("Benchmark name does not exist!\n")
              sys.exit(1)
        else:
          source = args.source
          app = source.split("/")[1]

        filename = os.path.basename(source)
        new_dir = os.path.dirname(source)
        data = "/home/ts20/share/datasets/" + app + "/default/input/"
        
        print("Application: " + app)

        # compiler args
        threads = args.num_threads

        if args.output:
            output = args.output
        else:
            output = "/home/ts20/share/results/ispass/accuracy/" + app + "_" + str(threads) + "/"

        if (not os.path.isdir(output)):
          os.mkdir(output)

        print("Output directory: " + output)

        print("------------------------------------------------------------\n")
        os.chdir(new_dir)
        if (real):
          compile(real)
          execute(real)
        else:
          compile(0)
          execute(0)
          one = time.time()
          simulate()
          two = time.time()
          print("Simulation Time = " + str(round(two - one)) + " seconds.\n")
          measure()
          three = time.time()
          print("Measurement Time = " + str(round(three - two)) + " seconds.\n")

if __name__ == "__main__":
    main()
