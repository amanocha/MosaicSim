import argparse
import math
import os
import sys

# APPS
apps = ["bfs", "cutcp", "histo", "lbm", "mri-gridding", "mri-q", "sad", "sgemm", "spmv", "stencil", "tpacf"]

# CONFIGS
modes = ["db", "di"]
configs = ["IO", "OOO"]

def parse_args():
  parser = argparse.ArgumentParser()
  parser.add_argument("-a", "--app", type=str, help="Application to run")
  parser.add_argument("-x", "--experiment", type=int, help="Experiment to run (1 = cafe, 2 = pythia)")
  args = parser.parse_args()
  return args

def run(cmd, tmp_output, output):
  print(cmd)
  os.system(cmd)

  os.system("rm " + tmp_output + "memStats")
  os.system("cp -r " + tmp_output + " " + output)
  os.system("rm -r " + tmp_output)
  print("Done! Navigate to " + output + "measurements.txt to see the results!")

# Experiment 1
def run_one():
  exp_dir = "/home/ts20/share/results/ispass/characterization/"
  for app in apps:
    for i in range(6):
      threads = str(int(math.pow(2, i)))
      output = app + "_" + threads + "/"
      if not os.path.isdir(exp_dir + output):
        cmd_args = ["time python characterize.py", "-a", app, "-t", threads, "-o", tmp_output]
        cmd = " ".join(cmd_args)
        print(cmd)
        os.system(cmd)
        print("Done! Navigate to " + output + "perf.txt to see the results!")

# Experiment 2
def run_two():
  exp_dir = "/home/ts20/share/results/ispass/accuracy/"
  for app in apps:
    for i in range(6):
      threads = str(int(math.pow(2, i)))
      output = app + "_" + threads + "/"
      if not os.path.isdir(exp_dir + output):
        tmp_output = exp_dir + "tmp_" + output
        cmd_args = ["time python measure.py", "-a", app, "-t", threads, "-r", "1", "-o", tmp_output]
        cmd = " ".join(cmd_args)
        run(cmd, tmp_output, exp_dir + output)

# EXPERIMENTS
experiments = {
                1: run_one,
                2: run_two,
              }

def main():
  global apps

  args = parse_args()

  if args.app:
    apps = [args.app]
  if args.experiment:
    experiments[args.experiment]()
  else:
    run_one()
    run_two()

if __name__ == "__main__":
  main()
