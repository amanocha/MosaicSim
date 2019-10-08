import argparse
import math
import os
import sys

# APPS
apps = ["cutcp", "histo", "lbm", "mri-gridding", "mri-q", "sad", "sgemm", "spmv", "stencil", "tpacf"]
scaling_apps = ["bfs", "sgemm", "spmv"]

# CONFIGS
modes = ["db", "di"]
configs = ["IO", "OOO"]
num_threads = 4

def parse_args():
  parser = argparse.ArgumentParser()
  parser.add_argument("-a", "--app", type=str, help="Application to run")
  parser.add_argument("-x", "--experiment", type=int, help="Experiment to run (1 = cafe characterization, 2 = pythia characterization, 3 = cafe scaling, 4 = pythia characterization)")
  args = parser.parse_args()
  return args

def run(cmd, tmp_output, output):
  print(cmd)
  os.system(cmd)

  os.system("rm " + tmp_output + "memStats")
  if (os.path.isdir(output)):
    os.system("mv " + tmp_output + "/* " + output)
  else:
    os.system("cp -r " + tmp_output + " " + output)
  os.system("rm -r " + tmp_output)
  print("Done! Navigate to " + output + "measurements.txt to see the results!")

# Experiment 0
def run_zero():
  exp_dir = "/home/ts20/share/results/ispass/accuracy/characterization/"
  for app in apps:
    output = exp_dir + app + "/"
    if not os.path.isfile(output + "app_output_real.txt"):
      cmd_args = ["time python measure.py", "-a", app, "-r", "1", "-o", output]
      cmd = " ".join(cmd_args)
      print(cmd)
      os.system(cmd)
      print("Done! Navigate to " + output + "app_output_real.txt to see the results!")

# Experiment 1
def run_one():
  exp_dir = "/home/ts20/share/results/ispass/accuracy/characterization/"
  for app in apps:
    output = exp_dir + app + "/"
    if not os.path.isfile(output + "perf.txt"):
      cmd_args = ["time python characterize.py", "-a", app, "-o", output]
      cmd = " ".join(cmd_args)
      print(cmd)
      os.system(cmd)
      print("Done! Navigate to " + output + "perf.txt to see the results!")

# Experiment 2
def run_two():
  exp_dir = "/home/ts20/share/results/ispass/accuracy/characterization/"
  for app in apps:
    output = app + "/"
    if not os.path.isfile(exp_dir + output + "measurements.txt"):
      tmp_output = exp_dir + "tmp_" + output
      cmd_args = ["time python measure.py", "-a", app, "-o", tmp_output]
      cmd = " ".join(cmd_args)
      run(cmd, tmp_output, exp_dir + output)

# Experiment 3
def run_three():
  exp_dir = "/home/ts20/share/results/ispass/accuracy/scaling/"
  for app in scaling_apps:
    for i in range(num_threads):
      threads = str(int(math.pow(2, i)))
      output = exp_dir + app + "_" + threads + "/"
      if not os.path.isfile(output + "app_output_real.txt"):
        cmd_args = ["time python measure.py", "-a", app, "-t", threads, "-r", "1", "-x", "1", "-o", output]
        cmd = " ".join(cmd_args)
        print(cmd)
        os.system(cmd)
        print("Done! Navigate to " + output + "app_output_real.txt to see the results!")

# Experiment 4
def run_four():
  exp_dir = "/home/ts20/share/results/ispass/accuracy/scaling/"
  for app in scaling_apps:
    for i in range(num_threads):
      threads = str(int(math.pow(2, i)))
      output = app + "_" + threads + "/"
      if not os.path.isfile(exp_dir + output + "measurements.txt"):
        tmp_output = exp_dir + "tmp_" + output
        cmd_args = ["time python measure.py", "-a", app, "-t", threads, "-x", "1", "-o", tmp_output]
        cmd = " ".join(cmd_args)
        run(cmd, tmp_output, exp_dir + output)

# EXPERIMENTS
experiments = {
                0: run_zero,
                1: run_one,
                2: run_two,
                3: run_three,
                4: run_four
              }

def main():
  global apps, scaling_apps

  args = parse_args()

  if args.app:
    apps = [args.app]
    scaling_apps = [args.app]

  if args.experiment != None:
    experiments[args.experiment]()
  '''
  else:
    run_zero()
    run_one()
    run_two()
    run_three()
    run_four()
  '''

if __name__ == "__main__":
  main()
