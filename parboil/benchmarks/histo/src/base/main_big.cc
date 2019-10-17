/***************************************************************************
 *
 *            (C) Copyright 2010 The Board of Trustees of the
 *                        University of Illinois
 *                         All Rights Reserved
 *
 ***************************************************************************/

#include "DECADES/DECADES.h"
#include <parboil.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <chrono>

#include "util.h"

#define MY_UINT8_MAX 255

/******************************************************************************
* Implementation: Reference
* Details:
* This implementations is a scalar, minimally optimized version. The only 
* optimization, which reduces the number of pointer chasing operations is the 
* use of a temporary pointer for each row.
******************************************************************************/

void _kernel_(int* histo, unsigned int histo_height, unsigned int histo_width, unsigned int* img, unsigned int img_height, unsigned int img_width, int numIterations, int tid, int num_threads) {
  int iter;

  // Chunks of work to do the job
  int total_img = img_width*img_height;
  int per_th_img = total_img / num_threads;
  int init_img = tid*per_th_img;
  int last_img = (tid < num_threads-1) ? (tid+1)*per_th_img : total_img;

  // Chunks of work to initialize the histo mem
  int total_hist = histo_width*histo_height;
  int per_th_hist = total_hist / num_threads;
  int init_hist = tid*per_th_hist;
  int last_hist = (tid < num_threads-1) ? (tid+1)*per_th_hist : total_hist;

  for (iter = 0; iter < numIterations; iter++){
    DECADES_BARRIER();

    // If we make each thread to initialize a part
    memset(histo+init_hist,0,(last_hist-init_hist)*sizeof(int));
    // If we want to do it by a single thread
    //if (tid  == 0){ memset(histo,0,total_hist*sizeof(int));}
    DECADES_BARRIER();

    unsigned int i;
    for (i = init_img; i < last_img; ++i) {
      const unsigned int value = img[i];
      wrapper_FETCH_ADD_MAX(&histo[value],MY_UINT8_MAX);
    }
  }
}

int main(int argc, char* argv[]) {
  int exec_kernel = atoi(argv[1]);

  struct pb_TimerSet timers;
  struct pb_Parameters *parameters;

  printf("Base implementation of histogramming.\n");
  printf("Maintained by Nady Obeid <obeid1@ece.uiuc.edu>\n");

  parameters = pb_ReadParameters(&argc, argv);
  if (!parameters)
    return -1;

  if(!parameters->inpFiles[0]){
    fputs("Input file expected\n", stderr);
    return -1;
  }
  printf("%s\n",parameters->outFile);
  int numIterations = 160;
  /*if (argc >= 2){
    numIterations = atoi(argv[1]);
  } else {
    fputs("Expected at least one command line argument\n", stderr);
    return -1;
  }*/

  pb_InitializeTimerSet(&timers);
  
  char *inputStr = "Input";
  char *outputStr = "Output";
  
  pb_AddSubTimer(&timers, inputStr, pb_TimerID_IO);
  pb_AddSubTimer(&timers, outputStr, pb_TimerID_IO);
  
  pb_SwitchToSubTimer(&timers, inputStr, pb_TimerID_IO);  

  unsigned int img_width, img_height;
  unsigned int histo_width, histo_height;

  FILE* f = fopen(parameters->inpFiles[0],"rb");
  int result = 0;

  result += fread(&img_width,    sizeof(unsigned int), 1, f);
  result += fread(&img_height,   sizeof(unsigned int), 1, f);
  result += fread(&histo_width,  sizeof(unsigned int), 1, f);
  result += fread(&histo_height, sizeof(unsigned int), 1, f);

  if (result != 4){
    fputs("Error reading input and output dimensions from file\n", stderr);
    return -1;
  }

  unsigned int* img = (unsigned int*) malloc (img_width*img_height*sizeof(unsigned int));
  int* histo = (int*) calloc (histo_width*histo_height, sizeof(int));
  
  pb_SwitchToSubTimer(&timers, "Input", pb_TimerID_IO);

  result = fread(img, sizeof(unsigned int), img_width*img_height, f);

  fclose(f);

  if (result != img_width*img_height){
    fputs("Error reading input array from file\n", stderr);
    return -1;
  }

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  auto start_time = std::chrono::system_clock::now();
  if(exec_kernel) {
    _kernel_(histo, histo_height, histo_width, img, img_height, img_width, numIterations, 0, 1);
  }
  auto end_time = std::chrono::system_clock::now();
  std::chrono::duration<double> elapsed_seconds = end_time-start_time;
  printf("\nkernel computation time: %fs\n", elapsed_seconds.count());

//  pb_SwitchToTimer(&timers, pb_TimerID_IO);
  pb_SwitchToSubTimer(&timers, outputStr, pb_TimerID_IO);

  if (parameters->outFile) {
    dump_histo_img(histo, histo_height, histo_width, parameters->outFile);
  }

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  free(img);
  free(histo);

  pb_SwitchToTimer(&timers, pb_TimerID_NONE);

  printf("\n");
  pb_PrintTimerSet(&timers);
  pb_FreeParameters(parameters);

  return 0;
}
