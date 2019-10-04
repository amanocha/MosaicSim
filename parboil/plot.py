from go import *
import matplotlib.pyplot as plt
import numpy as np
import re

exp_dir = "/home/ts20/share/results/ispass/accuracy/"
outdir = "../results/accuracy/"

def create_apps_axis(ax1, ind, yticks, ylabel):
  num_apps = 11
  ind = np.arange(1, num_apps+1)

  ax2 = ax1.twinx()

  scale = 1.5

  ax1.set_xlim([0.5, num_apps+0.5])
  ax1.set_xticks(ind)
  ax1.set_xticklabels(apps, fontsize=scale*AXIS_FONTSIZE)
  ax1.set_ylim([0, yticks[len(yticks)-1]])
  ax1.set_yticks(yticks)
  ax1.set_yticklabels(yticks, fontsize=scale*TICK_FONTSIZE)
  ax1.set_ylabel(ylabel, fontsize=scale*AXIS_FONTSIZE)
  ax1.tick_params(direction='inout', length=20, width=1)

  ax2.set_ylim([0, yticks[len(yticks)-1]])
  ax2.set_yticks(yticks)
  ax2.set_yticklabels([])
  ax2.tick_params(direction='inout', length=20, width=1, labelleft=False, labelright=True)

def scaling(stats, a):
  print("\nCREATING SCALING GRAPH for " + apps[a] + "...\n----------")

  x = np.arange(6)
  y = stats[a][0]
  y1 = stats[a][1]
  y2 = stats[a][2]
  
  labels = []
  for i in x:
    label = str(int(math.pow(2,i)))
    labels.append(label)

  fig = plt.figure()
  ax1 = fig.add_subplot(111)
  ax1.plot(x, y, label='Pythia')
  #ax1.plot(x, y1, label='Perf')
  ax1.plot(x, y2, label='Kernel Timing')
  ax1.set_xticks(x)
  ax1.set_xticklabels(labels)
  ax1.set_xlabel("Number of Threads")
  ax1.set_ylabel("Performance Speedup")
  plt.legend(loc=2)
  #plt.show()
  plt.savefig(outdir + apps[a] + "_scaling.pdf", bbox_inches='tight')

def cacheline(stats, avgs, outdir):
  N = CL_MAX-2
  ind = np.arange(1, 4)

  fig = plt.figure(figsize=(36.0,24.0))
  fig.subplots_adjust(bottom=0.1)
  ax1 = fig.add_subplot(111)

  colors = ['black', 'dimgrey', 'grey', 'darkgray', 'darkgrey', 'silver', 'lightgrey', 'whitesmoke', 'white'] #NEED TO CHANGE COLORS BASED ON N
  psbs = []
  legend_boxes = []
  legend = []
  for i in range(N):
    if N % 2 == 0:
      pos = i-N/2+0.5
    else:
      pos = i-(N-1)/2
    psbs.append(ax1.bar(ind+pos*width/N, stats[0][i], width/N, color=colors[i], linewidth=1, edgecolor=['black']))
    legend_boxes.append(psbs[i][0])
    legend.append(str(int(math.pow(2, i+2))) + "B")

  yticks = np.round(np.arange(0, 1.5, 0.1), 2)
  ylabel = 'Speedup'
  create_apps_axis(ax1, ind, yticks, ylabel)

  chartBox = ax1.get_position()
  ax1.set_position([chartBox.x0, chartBox.y0, chartBox.width, chartBox.height*0.8])
  ax1.legend(legend_boxes, legend, bbox_to_anchor=(0.,1.01,1.,0.101), ncol=N, mode="expand", fontsize=INPUTS_FONTSIZE)
  #plt.show()
  plt.savefig(outdir + "performance.pdf", bbox_inches='tight')
  
def mm(y1, y2, y3, y4):
  N = 4

  fig = plt.figure(figsize=(40.0, 18.0))
  fig.subplots_adjust(bottom=0.1)
  ax1 = fig.add_subplot(111)

  c = 'gainsboro'
  c_avg = 'black'
  scale = 0.9

  psb1 = ax1.bar(ind-3*width/N/2, y1, scale*width/N, color=c, linewidth=1, edgecolor=['black'])
  psb2 = ax1.bar(ind-width/N/2, y2, scale*width/N, color=c, linewidth=1, edgecolor=['black'])
  psb3 = ax1.bar(ind+width/N/2, y3, scale*width/N, color=c, linewidth=1, edgecolor=['black'])
  psb4 = ax1.bar(ind+3*width/N/2, y4, scale*width/N, color=c, hatch='.', linewidth=1, edgecolor=['black'])

  yticks  = np.round(np.arange(0, 1.1, 0.1),1)
  ylabel = 'LLC Miss Rate'
  create_x_axis_avg(ax1, ind, yticks, ylabel)

  legend = ('LLC Miss Rate', 'LLC Miss Rate (Avg)')
  chartBox = ax1.get_position()
  ax1.set_position([chartBox.x0, chartBox.y0, chartBox.width, chartBox.height*0.8])
  ax1.legend((psb1[0], psb4[0]), legend, bbox_to_anchor=(0.,1.01,1.,0.101), ncol=3, mode="expand", fontsize=1.5*INPUTS_FONTSIZE)
  #plt.show()
  plt.savefig("../results/smart_cache/motivation_dram.pdf", bbox_inches='tight')

def parse_info():
  print("\nPARSING INFORMATION...\n----------")

  characterization = []
  runtimes = []
  speedups = []
  averages = []

  # cycles
  for a in range(len(apps)):
    app = apps[a]
    for i in range(6):
      threads = str(int(math.pow(2, i)))
      if len(runtimes) <= a:
        runtimes.append([[],[],[]])
      fill = 1e20

      # pythia
      filename = exp_dir + app + "_" + threads + "/measurements.txt"
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
 
      # perf
      filename = exp_dir + app + "_" + threads + "/perf.txt"
      if os.path.isfile(filename):
        print("READING: " + filename)
        measurements = open(filename)
        data = measurements.read()
        measurements.close()
        matches = re.findall("^cycles: .*$", data, re.MULTILINE)
        match = re.match(".+:\s*(\d+\.*\d+)", matches[0])
        runtime = float(match.group(1))
        runtimes[a][1].append(runtime)
      else:
        runtimes[a][1].append(fill)

      # raw execution time
      filename = exp_dir + app + "_" + threads + "/app_output_real.txt"
      if os.path.isfile(filename):
        print("READING: " + filename)
        measurements = open(filename)
        data = measurements.read()
        measurements.close()
        matches = re.findall("^.*kernel computation time: .*$", data, re.MULTILINE)
        print(matches)
        match = re.match(".+:\s*(\d+\.*\d+)", matches[0])
        runtime = float(match.group(1))
        runtimes[a][2].append(runtime)
      else:
        runtimes[a][2].append(fill)

  for a in range(len(runtimes)): #apps
    if len(speedups) <= a:
      speedups.append([[],[],[]])
    for c in range(len(runtimes[a])): #configs
      for t in range(len(runtimes[a][c])): #threads
        speedups[a][c].append(runtimes[a][c][0]/runtimes[a][c][t])

  print("\nCALCULATING SPEEDUPS...\n----------")
  for a in range(len(runtimes)): #apps
    for c in range(len(runtimes[a])): #configs
      print(apps[a], c, runtimes[a][c][0], speedups[a][c])
    print()

  print("\nCALCULATING AVERAGE SPEEDUPS...\n----------")
  for t in range(len(speedups[0][0])): #threads
    averages.append([1.0, 1.0, 1.0])
    for c in range(len(speedups[a])): #configs
      for a in range(len(speedups)): #apps
        averages[t][c] = averages[t][c] * speedups[a][c][t]
      averages[t][c] = averages[t][c] ** (1./len(speedups))
      print(int(math.pow(2,t)), averages[t][c])

  return characterization, speedups, averages

def main():  
  if not os.path.isdir(outdir):
    os.mkdir(outdir)
 
  characterization, speedups, averages = parse_info()
  
  for a in range(len(apps)):
    scaling(speedups, a)

  print("\nDone!")

if __name__ == "__main__":
  main()
