from go import *
import matplotlib.pyplot as plt
import numpy as np
import re

exp_dir = "/home/ts20/share/results/ispass/accuracy/"
outdir = "../results/accuracy/"
fill = 1e20

width = 0.9
scale = 1.5
num_apps = len(apps)
ind = np.arange(1, num_apps+1)

AXIS_FONTSIZE = 44
TICK_FONTSIZE = 40
INPUTS_FONTSIZE = 32

def create_apps_axis(ax1, ind, yticks, ylabel):
  ax2 = ax1.twinx()

  ax1.set_xlim([0.5, num_apps+0.5])
  ax1.set_xticks(ind)
  ax1.set_xticklabels(apps, fontsize=scale*INPUTS_FONTSIZE)
  ax1.set_ylim([0, yticks[len(yticks)-1]])
  ax1.set_yticks(yticks)
  ax1.set_yticklabels(yticks, fontsize=scale*TICK_FONTSIZE)
  ax1.set_ylabel(ylabel, fontsize=scale*AXIS_FONTSIZE)
  ax1.tick_params(direction='inout', length=20, width=1)

  ax2.set_ylim([0, yticks[len(yticks)-1]])
  ax2.set_yticks(yticks)
  ax2.set_yticklabels([])
  ax2.tick_params(direction='inout', length=20, width=1, labelleft=False, labelright=True)

def characterize(stats, metric):
  print("\nCREATING CHARACTERIZATION GRAPH FOR " + metric + "...\n----------")

  N = 2 # number of bars per application

  fig = plt.figure(figsize=(48.0,20.0))
  fig.subplots_adjust(bottom=0.1)
  ax1 = fig.add_subplot(111)

  colors = ['tab:blue', 'tab:orange'] #NEED TO CHANGE COLORS BASED ON N
  psbs = []
  legend_boxes = []
  legend = ['Pythia', 'x86']
  for i in range(N):
    if N % 2 == 0:
      pos = i-N/2+0.5
    else:
      pos = i-(N-1)/2
    psbs.append(ax1.bar(ind+pos*width/N, stats[i], width/N, color=colors[i], linewidth=1, edgecolor=['black']))
    legend_boxes.append(psbs[i][0])

  MAX = max(stats[0] + stats[1])
  if (MAX > 1):
    if (MAX > 10):
      yticks = np.arange(0, round(MAX)+1, math.floor(round(MAX)/10))
    else:
      yticks = np.arange(round(MAX)+1)
  else:
    yticks = np.round(np.arange(0, 1.2*MAX, 0.1), 2)

  ylabel = metric
  create_apps_axis(ax1, ind, yticks, ylabel)

  chartBox = ax1.get_position()
  #ax1.set_position([chartBox.x0, chartBox.y0, chartBox.width, chartBox.height*0.8])
  #ax1.legend(legend_boxes, legend, bbox_to_anchor=(0.,1.01,1.,0.101), ncol=N, mode="expand", fontsize=INPUTS_FONTSIZE)
  plt.legend(legend_boxes, legend, loc=2, fontsize=scale*TICK_FONTSIZE)
  #plt.show()
  plt.savefig(outdir + metric.replace(" ", "").lower() + ".pdf", bbox_inches='tight')
 
def scaling(stats, a):
  print("\nCREATING SCALING GRAPH FOR " + scaling_apps[a] + "...\n----------")
  
  fig = plt.figure(figsize=(32.0,8.0))
  fig.subplots_adjust(bottom=0.1)
  ax1 = fig.add_subplot(111)

  x = np.arange(num_threads)
  y1 = stats[a][0]
  y2 = stats[a][1]
  
  labels = []
  for i in x:
    label = str(int(math.pow(2,i)))
    labels.append(label)
  cap = math.ceil(max(y1+y2)+2)
  yticks = np.arange(cap)
  smallscale = 1

  ax1.plot(x, y1, linewidth=3, label='Pythia')
  ax1.plot(x, y2, linewidth=3, label='x86')
  ax1.set_xticks(x)
  ax1.set_xticklabels(labels, fontsize=smallscale*TICK_FONTSIZE)
  ax1.set_yticklabels(yticks, fontsize=smallscale*TICK_FONTSIZE)
  ax1.set_xlabel("Number of Threads", fontsize=smallscale*AXIS_FONTSIZE)
  ax1.set_ylabel("Performance Speedup", fontsize=smallscale*AXIS_FONTSIZE)
  ax1.set_ylim([0, yticks[len(yticks)-1]])
  plt.legend(loc=2, fontsize=smallscale*TICK_FONTSIZE)
  #plt.show()
  plt.savefig(outdir + scaling_apps[a] + "_scaling.pdf", bbox_inches='tight')

def parse_characterization():
  print("\nPARSING CHARACTERIZATION INFORMATION...\n----------")
  
  # L1, LLC, compute2mem, BW, IPC 
  characterization = []
  metrics = ["Calculated L1 Miss Rate", "Calculated LLC Miss Rate", "Calculated Compute to Memory Ratio", "Calculated IPC"]
  filenames = ["/measurements.txt", "/perf.txt"]

  exp_dir_characterization = exp_dir + "characterization/"
  for a in range(len(apps)):
    app = apps[a]
    if len(characterization) <= a:
      characterization.append([[],[]])
    for f in range(len(filenames)):    
      filename = exp_dir_characterization + app + filenames[f]
      if os.path.isfile(filename):
        print("READING: " + filename)
        measurements = open(filename)
        data = measurements.read()
        measurements.close()
        for m in range(len(metrics)):
          matches = re.findall("^" + metrics[m] + "\s*: .*$", data, re.MULTILINE)
          match = re.match(".+:\s*(\d+\.*\d+)", matches[0])
          value = float(match.group(1))
          characterization[a][f].append(value)
        if (f == 0):
          matches = re.findall("^cycles\s*: .*$", data, re.MULTILINE)
          match = re.match(".+:\s*(\d+\.*\d+)", matches[0])
          runtime = int(match.group(1))
        else:
          measurements = open(exp_dir_characterization + app + "/app_output_real.txt")
          data = measurements.read()
          measurements.close()
          matches = re.findall("^.*kernel computation time: .*$", data, re.MULTILINE)
          match = re.match(".+:\s*(\d+\.*\d+)", matches[0])
          runtime = round(float(match.group(1))*3.2e9)
        characterization[a][f].append(runtime)
      else:
        for m in range(len(metrics)):
          characterization[a][f].append(fill)
      
  for a in range(len(characterization)): #apps
    for c in range(len(characterization[a])): #configs
      print(apps[a], c, characterization[a][c])

  metrics = [m.replace("Calculated ", "") for m in metrics] 
  for m in range(len(metrics)):
    stats1 = [s[0][m] for s in characterization]
    stats2 = [s[1][m] for s in characterization]
    stats = [stats1, stats2]
    metric = metrics[m]
    characterize(stats, metric)

def parse_scaling():
  print("\nPARSING SCALING INFORMATION...\n----------")

  runtimes = []
  speedups = []
  averages = []

  # cycles
  exp_dir_scaling = exp_dir + "scaling/"
  for a in range(len(scaling_apps)):
    app = scaling_apps[a]
    for i in range(num_threads):
      threads = str(int(math.pow(2, i)))
      if len(runtimes) <= a:
        runtimes.append([[],[]])

      # pythia
      filename = exp_dir_scaling + app + "_" + threads + "/measurements.txt"
      if os.path.isfile(filename):
        print("READING: " + filename)
        measurements = open(filename)
        data = measurements.read()
        measurements.close()
        matches = re.findall("^cycles : .*$", data, re.MULTILINE)
        match = re.match(".+:\s*(\d+\.*\d+)", matches[0])
        runtime = float(match.group(1))
        runtimes[a][0].append(runtime)
      else:
        runtimes[a][0].append(fill)
 
      # raw execution time
      filename = exp_dir_scaling + app + "_" + threads + "/app_output_real.txt"
      if os.path.isfile(filename):
        print("READING: " + filename)
        measurements = open(filename)
        data = measurements.read()
        measurements.close()
        matches = re.findall("^.*kernel computation time: .*$", data, re.MULTILINE)
        print(matches)
        match = re.match(".+:\s*(\d+\.*\d+)", matches[0])
        runtime = float(match.group(1))
        runtimes[a][1].append(runtime)
      else:
        runtimes[a][1].append(fill)

  for a in range(len(runtimes)): #apps
    if len(speedups) <= a:
      speedups.append([[],[]])
    for c in range(len(runtimes[a])): #configs
      for t in range(len(runtimes[a][c])): #threads
        speedups[a][c].append(runtimes[a][c][0]/runtimes[a][c][t])

  print("\nCALCULATING SPEEDUPS...\n----------")
  for a in range(len(runtimes)): #apps
    for c in range(len(runtimes[a])): #configs
      print(scaling_apps[a], c, runtimes[a][c][0], speedups[a][c])
    print()

  print("\nCALCULATING AVERAGE SPEEDUPS...\n----------")
  for t in range(len(speedups[0][0])): #threads
    averages.append([1.0, 1.0, 1.0])
    for c in range(len(speedups[a])): #configs
      for a in range(len(speedups)): #apps
        averages[t][c] = averages[t][c] * speedups[a][c][t]
      averages[t][c] = averages[t][c] ** (1./len(speedups))
      print(int(math.pow(2,t)), averages[t][c])

  for a in range(len(scaling_apps)):
    scaling(speedups, a)

def main():  
  if not os.path.isdir(outdir):
    os.mkdir(outdir)
 
  #parse_characterization()
  parse_scaling()  

  print("\nDone!")

if __name__ == "__main__":
  main()
