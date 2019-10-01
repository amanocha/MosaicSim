/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/
/*
  Implementing Breadth first search on CUDA using algorithm given in DAC'10
  paper "An Effective GPU Implementation of Breadth-First Search"

  Copyright (c) 2010 University of Illinois at Urbana-Champaign. 
  All rights reserved.

  Permission to use, copy, modify and distribute this software and its documentation for 
  educational purpose is hereby granted without fee, provided that the above copyright 
  notice and this permission notice appear in all copies of this software and that you do 
  not sell the software.

  THE SOFTWARE IS PROVIDED "AS IS" AND WITHOUT WARRANTY OF ANY KIND,EXPRESS, IMPLIED OR 
  OTHERWISE.

  Author: Lijiuan Luo (lluo3@uiuc.edu)
*/
#include "DECADES/DECADES.h"
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <parboil.h>
#include <deque>
#include <iostream>

#define MAX_THREADS_PER_BLOCK 512
#define NUM_SM 30//the number of Streaming Multiprocessors; may change in the future archs 
#define NUM_SP 16//8//the number of Streaming processors within each SM; may change in the future 
	//architectures
#define EXP 4//3// EXP = log(NUM_SP), assuming NUM_SP is still power of 2 in the future architecture
	//using EXP and shifting can speed up division operation 
#define MOD_OP 8//7 // This variable is also related with NUM_SP; may change in the future architecture;
	//using MOD_OP and "bitwise and" can speed up mod operation
#define INF 2147483647//2^31-1

#define UP_LIMIT 16677216//2^24
#define WHITE 16677217
#define GRAY 16677218
#define GRAY0 16677219
#define GRAY1 16677220
#define BLACK 16677221
int no_of_nodes; //the number of nodes in the graph
int edge_list_size;//the number of edges in the graph
FILE *fp;

//typedef int2 Node;
//typedef int2 Edge;

struct Node{
    int x;
    int y;
};

struct Edge{
    int x;
    int y;
};
//Somehow "cudaMemset" does not work. So I use cudaMemcpy of constant variables for initialization
const int h_top = 1;
const int zero = 0;

void runCPU(int argc, char** argv);
void runGPU(int argc, char** argv);
////////////////////////////////////////////////////////////////////
//the cpu version of bfs for speed comparison
//the text book version ("Introduction to Algorithms")
////////////////////////////////////////////////////////////////////
void _kernel_(int * wavefront_in, int * wavefront_out, int * in_idx, int * out_idx, Node * h_graph_nodes, Edge * h_graph_edges, int * color, int * h_cost, int source, int tid, int num_threads) {
  //std::deque<int> wavefront;	
  //wavefront.push_back(source);
  //int index;
  //while(!wavefront.empty()) {  
    //index = wavefront.front();
    //wavefront.pop_front();

  // Initialization
  wavefront_in[*in_idx] = source;
  *in_idx = *in_idx + 1;
  color[source] = GRAY;

  // Iteration
  while(*in_idx > 0){
    for(int n = tid; n < *in_idx; n+=num_threads) {
      int node = wavefront_in[n];
      const int start = h_graph_nodes[node].x;
      const int end = h_graph_nodes[node].x + h_graph_nodes[node].y;
      for(int i = start; i < end; i++) {
        int id = h_graph_edges[i].x;
        int n_color = DECADES_COMPARE_AND_SWAP(&(color[id]), WHITE, GRAY); //color[id];
        int h_val = DECADES_COMPARE_AND_SWAP(&(h_cost[id]), INF, h_cost[node]+1);
        if(n_color == WHITE) {
          //color[id] = GRAY;
          //h_cost[id]=h_cost[node]+1;
          //wavefront.push_back(id);
          int index = DECADES_FETCH_ADD(out_idx, 1);
          wavefront_out[index] = id;
        }
      }
    }

    int *tmp = wavefront_out;
    wavefront_out = wavefront_in;
    wavefront_in = tmp;
    //color[node] = BLACK;		
    DECADES_BARRIER();
    if (tid == 0) {
      *in_idx = *out_idx;
      *out_idx = 0;
    }
    DECADES_BARRIER();
  }	
}

////////////////////////////////////////////////////////////////////////////////
// Main Program
////////////////////////////////////////////////////////////////////////////////
int main( int argc, char** argv) 
{
	no_of_nodes=0;
	edge_list_size=0;
	runCPU(argc,argv);
//	if( cutCheckCmdLineFlag(argc, (const char**)argv, "device") )
//		cutilDeviceInit(argc, argv);
//	else
		//cudaSetDevice( cutGetMaxGflopsDeviceId() );
//		cudaSetDevice( 1);


	//CUT_EXIT(argc, argv);
}
///////////////////////////////
//FUNCTION: only run CPU version 
////////////////////////////////////////////
void runCPU( int argc, char** argv) 
{

    struct pb_Parameters *params;
    struct pb_TimerSet timers;

    pb_InitializeTimerSet(&timers);
    params = pb_ReadParameters(&argc, argv);
    if ((params->inpFiles[0] == NULL) || (params->inpFiles[1] != NULL))
    {
        fprintf(stderr, "Expecting one input filename\n");
        exit(-1);
    }

    pb_SwitchToTimer(&timers, pb_TimerID_IO);
	//printf("Reading File\n");
	//Read in Graph from a file
	fp = fopen(params->inpFiles[0],"r");
	if(!fp)
	{
		printf("Error Reading graph file\n");
		return;
	}

	int source;

	fscanf(fp,"%d",&no_of_nodes);
	// allocate host memory
	Node* h_graph_nodes = (Node*) malloc(sizeof(Node)*no_of_nodes);
	int *color = (int*) malloc(sizeof(int)*no_of_nodes);
	int start, edgeno;   
	// initalize the memory
	for( unsigned int i = 0; i < no_of_nodes; i++) 
	{
		fscanf(fp,"%d %d",&start,&edgeno);
		h_graph_nodes[i].x = start;
		h_graph_nodes[i].y = edgeno;
		color[i]=WHITE;
	}
	//read the source node from the file
	fscanf(fp,"%d",&source);
	fscanf(fp,"%d",&edge_list_size);
	int id,cost;
	Edge* h_graph_edges = (Edge*) malloc(sizeof(Edge)*edge_list_size);
	for(int i=0; i < edge_list_size ; i++)
	{
		fscanf(fp,"%d",&id);
		fscanf(fp,"%d",&cost);
		h_graph_edges[i].x = id;
		h_graph_edges[i].y = cost;
	}
	if(fp)
		fclose(fp);    

	//printf("Read File\n");

	// allocate mem for the result on host side
	int* h_cost = (int*) malloc( sizeof(int)*no_of_nodes);
	for(int i = 0; i < no_of_nodes; i++){
		h_cost[i] = INF;
	}
	h_cost[source] = 0;

        int* wavefront_in = (int*) malloc( sizeof(int)*no_of_nodes);
        int* wavefront_out = (int*) malloc( sizeof(int)*no_of_nodes);
        int* in_idx = (int*) malloc( sizeof(int));
        int* out_idx = (int*) malloc( sizeof(int));
        *in_idx = 0;
        *out_idx = 0;
	//printf("start cpu version\n");
	unsigned int cpu_timer = 0;
        pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	_kernel_(wavefront_in, wavefront_out, in_idx, out_idx, h_graph_nodes, h_graph_edges, color, h_cost, source, 0, 1);
        pb_SwitchToTimer(&timers, pb_TimerID_IO);
    if(params->outFile!=NULL)
    {
        //printf("Result stored in %s\n", params->outFile);
        FILE *fp = fopen(params->outFile,"w");
        fprintf(fp,"%d\n", no_of_nodes);
    	for(int i=0;i<no_of_nodes;i++)
    		fprintf(fp,"%d %d\n",i,h_cost[i]);
    	fclose(fp);
    }


    pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	// cleanup memory
	free( h_graph_nodes);
	free( h_graph_edges);
	free( color);
	free( h_cost);
    pb_SwitchToTimer(&timers, pb_TimerID_NONE);
    pb_PrintTimerSet(&timers);
    pb_FreeParameters(params);
}
///////////////////////////////
//FUNCTION:only run GPU version 
////////////////////////////////////////////
