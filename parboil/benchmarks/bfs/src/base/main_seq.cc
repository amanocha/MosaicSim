#include "DECADES/DECADES.h"
#include "stdio.h"
#include "stdlib.h"
#include "assert.h"
#include <iostream>
#include <string>
#include <fstream>
#include <chrono>
#include "graph.h"

using namespace std;

void _kernel_(int hop, int compute_nodes, csr_graph G, int * ret, int *in_wl, int* in_index, int *out_wl, int *out_index, int tid, int num_threads) {
  int to_compare = -1;

  for (int i = tid; i < compute_nodes; i += num_threads) {
    int node = in_wl[i];
    const int start = G.node_array[node];
    const int end = G.node_array[node+1];
    for (int e = start; e < end; e++) {	
      int edge_index = G.edge_array[e];
      int v = ret[edge_index];
      if (v == to_compare) {
        ret[edge_index] = hop;
        int index = *out_index;
        *out_index = *out_index + 1;
	out_wl[index] = edge_index;
      }
    }
  }    
  
  hop++;
    
  int *tmp = out_wl;
  out_wl = in_wl;
  in_wl = tmp;

  *in_index = *out_index;
  *out_index = 0;
}

void bfs(int exec_kernel, int epoch, int compute_nodes, csr_graph G, int * ret, int *in_wl, int* in_index, int *out_wl, int *out_index, int tid, int num_threads) {

  int* hop = (int*)malloc(sizeof(int));
  *hop = 1;

  while (*in_index > 0) {
    printf("-- epoch %d %d\n", *hop, *in_index);
    int init = tid;
    if (*hop == epoch) {
      if (compute_nodes == -1 || compute_nodes > *in_index) {
	compute_nodes = *in_index;
      }
      printf("----going into kernel! Computing %d nodes\n", compute_nodes);
      auto start = chrono::system_clock::now();
      if (exec_kernel) {
        _kernel_(*hop, compute_nodes, G, ret, in_wl, in_index, out_wl, out_index, tid, num_threads);
      }
      auto end = std::chrono::system_clock::now();
      chrono::duration<double> elapsed_seconds = end-start;
      cout << "\nkernel computation time: " << elapsed_seconds.count() << "s\n";
      printf("----finished kernel! doing %d nodes in x86\n", *in_index - compute_nodes);
      init = compute_nodes;
    }
    //else {
      for (int i = init; i < *in_index; i += num_threads) {
        int node = in_wl[i];
        //printf("nodes %d \n", node);
        for (int e = G.node_array[node]; e < G.node_array[node+1]; e++) {	
	  int edge_index = G.edge_array[e];
	  int v = ret[edge_index];
	  if (v == -1) {
	    ret[edge_index] = *hop;
	    int index = *out_index;
            *out_index = *out_index + 1;
	    out_wl[index] = edge_index;
	  }
        }
      }
      //}
    int *tmp = out_wl;
    out_wl = in_wl;
    in_wl = tmp;
    *hop = *hop + 1;
    *in_index = *out_index;
    *out_index = 0;
  }
  free(hop);
}

int main(int argc, char** argv) {

  char *graph_fname;
  csr_graph G;

  assert(argc >= 3);
  int exec_kernel = atoi(argv[1]);
  graph_fname = argv[2];
  int epoch = 3;
  int compute_nodes = -1;
  
  G = parse_csr_graph(graph_fname);
  int * ret = (int *) malloc(sizeof(int) * G.nodes);

  for (int i = 0; i < G.nodes; i++) {
    ret[i] = -1;
  }
  
  int * in_index = (int *) malloc(sizeof(int) * 1);
  *in_index = 0;
  int * out_index = (int *) malloc(sizeof(int) * 1);
  *out_index = 0;
  
  int * in_wl = (int *) malloc(sizeof(int) * G.nodes * 2);
  int * out_wl = (int *) malloc(sizeof(int) * G.nodes * 2);

  int start_seed = 0;
  for (int i = start_seed; i < start_seed + SEEDS; i++) {
    int index = *in_index;
    *in_index = index + 1;
    in_wl[index] = i;
    ret[i] = 0;
  }

  printf("\n\nstarting bfs\n");
  auto start = chrono::system_clock::now();
  bfs(exec_kernel, epoch, compute_nodes, G, ret, in_wl, in_index, out_wl, out_index, 0 , 1);
  printf("\nending bfs");
  auto end = std::chrono::system_clock::now();
  chrono::duration<double> elapsed_seconds = end-start;
  cout << "\nbfs computation time: " << elapsed_seconds.count() << "s\n";
  
#if defined(OUTPUT_RET)
  ofstream outfile;
  outfile.open ("VE_out.txt");
  for (int i = 0; i < G.nodes; i++) {
    outfile << ret[i] << "\n";
  }
  outfile.close();
  return 0;

#endif
  
  free(ret);
  free(in_index);
  free(out_index);
  free(in_wl);
  free(out_wl);
  clean_csr_graph(G);

  return 0;
}
