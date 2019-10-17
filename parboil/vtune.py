import argparse
import numpy as np
import os
import re
import shutil
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

metrics = {}

def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("-a", "--app", type=str, help="Name of benchmark")
    parser.add_argument("-s", "--source", type=str, default="", help="Path to source code file")
    parser.add_argument("-t", "--num_threads", type=int, default=0, help="Number of threads")
    parser.add_argument("-x", "--scale", type=int, default=0, help="Run scaling version")
    parser.add_argument("-o", "--output", type=str, help="Output path")
    args = parser.parse_args()
    return args

def compile():
    print("Compiling application...\n")
    
    include = "../../../../common/include/"

    if (app != "bfs"):
      cmd_args = ["DEC++", "-I", include, "-g", "1", "-t", str(threads), "../../../../common/src/parboil.c", filename]
    else:
      cmd_args = ["DEC++", "-g", "1", "-t", str(threads), filename]

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

def execute(thread_str):
    print("Executing application...")
    if app == "bfs":
      datafiles = ["Kronecker_21.el"] #["graph_input.dat"]
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

    dirname = "vtune" + thread_str
    if os.path.isdir(dirname):
      shutil.rmtree(dirname)

    cmd = "amplxe-cl -r " + dirname + " -collect general-exploration -knob sampling-interval=0.1 "
    if (app != "bfs"):
      cmd = cmd + "./" + compile_dir + "/" + compile_dir + " 1 -i " + input_path + " > " + output + "vtune.txt"
    else:
      cmd = cmd + "./" + compile_dir + "/" + compile_dir + " 1 " + input_path + " > " + output + "vtune.txt"

    output_path = input_path.split("/")[0:7] + ["output"]
    output_path = "/".join(output_path)
    
    print(cmd)
    os.system(cmd)

def main():
    global source, data, output
    global filename, threads
    global app, app_input, new_dir

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
              main_name = "main_big.cc"
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

        if args.output:
            output = args.output
        else:
            output = "/home/ts20/share/results/ispass/accuracy/characterization/" + app + "/"

        if (not os.path.isdir(output)):
          os.mkdir(output)

        print("Output directory: " + output)

        print("------------------------------------------------------------\n")
        os.chdir(new_dir)
        compile()
        one = time.time()
        if args.num_threads != 0:
          threads = args.num_threads
          execute(str(threads))
        else:
          execute("")
        two = time.time()
        print("Measurement Time = " + str(round(two-one)) + " seconds.\n")

if __name__ == "__main__":
    main()
