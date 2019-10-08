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
num_samples = 10

metrics = {}

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-a", "--app", type=str, help="Name of benchmark")
    parser.add_argument("-s", "--source", type=str, default="", help="Path to source code file")
    parser.add_argument("-t", "--num_threads", type=int, default=1, help="Number of threads")
    parser.add_argument("-n", "--num_samples", type=int, default=5, help="Number of sample points to average")
    parser.add_argument("-x", "--scale", type=int, default=0, help="Run scaling version")
    parser.add_argument("-o", "--output", type=str, help="Output path")
    args = parser.parse_args()
    return args

def compile():
    print("Compiling application...\n")
    
    include = "../../../../common/include/"

    if (app != "bfs"):
      cmd_args = ["DEC++", "-I", include, "-t", str(threads), "../../../../common/src/parboil.c", filename]
    else:
      cmd_args = ["DEC++", "-t", str(threads), filename]

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

def execute(exec_kernel):
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

    cmd = "perf stat -B -d -v -e cache-references,cache-misses,cycles,instructions,L1-dcache-stores,node-loads,node-stores -o "
    if (exec_kernel):
      if (app != "bfs"):
        cmd = cmd + output + "perf1.txt ./" + compile_dir + "/" + compile_dir + " 1 -i " + input_path + " " + " > " + output + "app_output1.txt"
      else:
        cmd = cmd + output + "perf1.txt ./" + compile_dir + "/" + compile_dir + " 1 " + input_path + " " + " > " + output + "app_output1.txt"
    else:
      if (app != "bfs"):
        cmd = cmd + output + "perf2.txt ./" + compile_dir + "/" + compile_dir + " -i " + input_path + " " + " > " + output + "app_output2.txt"
      else:
        cmd = cmd + output + "perf2.txt ./" + compile_dir + "/" + compile_dir + " " + input_path + " " + " > " + output + "app_output2.txt"

    output_path = input_path.split("/")[0:7] + ["output"]
    output_path = "/".join(output_path)
    cmd += " -o result"
    
    print(cmd)
    os.system(cmd)

def measure():
    print("Gathering measurements...")
    with_kernel = open(output + "perf1.txt", "r+")
    without_kernel = open(output + "perf2.txt", "r+")

    L1misses, L1references, LLCmisses, LLCreferences = 0, 0, 0, 0
    for line1 in with_kernel:
      line1 = line1.replace(",","").replace("-", "")
      line2 = without_kernel.readline().replace(",","").replace("-", "")
      match1 = re.match("\s*(\d+)\s+(\w+)", line1)
      match2 = re.match("\s*(\d+)\s+(\w+)", line2)
      if match1 != None:
        value1 = int(match1.group(1))
        metric1 = match1.group(2)
      else:
        metric1 = ""
        value1 = 0
      if match2 != None:
        value2 = int(match2.group(1))
        metric2 = match2.group(2)
      else:
        metric2 = metric1
        value2 = 0

      if metric1 == metric2 and metric1 != "":
        value = value1 - value2
        if metric1 in metrics:
          metrics[metric1] = metrics[metric1] + value
        else:
          metrics[metric1] = value

    with_kernel.close()
    without_kernel.close()

def avg():
    measurements = open(output + "perf.txt", "w+")
    
    for metric in metrics:
      metrics[metric] = round(metrics[metric]/10.0)
      measurements.write(metric + ": " + str(metrics[metric]) + "\n")
      print(metric, metrics[metric])
    measurements.write("\nRESULTS:\n")
    measurements.write("----------\n")

    L1misses = metrics["L1dcacheloadmisses"]
    L1references = metrics["L1dcacheloads"]
    LLCmisses = metrics["LLCloadmisses"]
    cycles = metrics["cycles"]
    instructions = metrics["instructions"]
    memory_ops = L1references + metrics["L1dcachestores"]
    compute_ops = instructions - memory_ops
    
    L1miss_rate = L1misses*100.0/L1references
    LLCmiss_rate = LLCmisses*100.0/L1references
    ratio = compute_ops/memory_ops
    avg_bw = LLCmisses*64*4/(1024*1024*1024)/(cycles/3.2e9)
    ipc = float(instructions)/cycles

    measurements.write("Calculated L1 Miss Rate: " + str(L1miss_rate) + "\n")
    measurements.write("Calculated LLC Miss Rate: " + str(LLCmiss_rate) + "\n")
    measurements.write("Calculated Compute to Memory Ratio: " + str(ratio) + "\n")
    measurements.write("Average BW: " + str(avg_bw) + "\n")
    measurements.write("Calculated IPC: " + str(ipc) + "\n")

    measurements.close()

def main():
    global source, data, output
    global filename, threads
    global app, app_input, new_dir
    global num_samples

    args = parse_args()

    if not (os.path.isfile(args.source) or args.app):
        print("Please enter either a benchmark name or source file path!\n")
    else:
        if (args.app):
          if (args.source != "" and args.source.split("/")[1] != args.app):
            print("Conflicting benchmark information entered: benchmark name does not match source file path!\n")
            sys.exit(1)
          else:
            app = args.app
            if (args.scale):
              main_name = "main.cc"
            else:
              main_name = "main_seq.cc"
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
            output = "/home/ts20/share/results/ispass/accuracy/characterization/" + app + "/"

        if (not os.path.isdir(output)):
          os.mkdir(output)

        print("Output directory: " + output)

        num_samples = args.num_samples

        print("------------------------------------------------------------\n")
        os.chdir(new_dir)
        compile()
        one = time.time()
        for i in range(num_samples):
          execute(1)
          execute(0)
          measure()
        avg()
        two = time.time()
        print("Measurement Time = " + str(round(two-one)) + " seconds.\n")

if __name__ == "__main__":
    main()
