/***************************************************************************
 *
 *            (C) Copyright 2010 The Board of Trustees of the
/***************************************************************************
 *
 *            (C) Copyright 2010 The Board of Trustees of the
 *                        University of Illinois
 *                         All Rights Reserved
 *
 ***************************************************************************/

#include <parboil.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "util.h"

#define MY_UINT8_MAX 255

/******************************************************************************
* Implementation: Reference
* Details:
* This implementations is a scalar, minimally optimized version. The only 
* optimization, which reduces the number of pointer chasing operations is the 
* use of a temporary pointer for each row.
******************************************************************************/

void _kernel_(unsigned char* histo, unsigned int histo_height, unsigned int histo_width, unsigned int* img, unsigned int img_height, unsigned int img_width, int numIterations, int tid, int num_threads) {
  int iter;
  //omp_set_dynamic(0);     // Explicitly disable dynamic teams
  //omp_set_num_threads(1);
  for (iter = tid; iter < numIterations; iter+=num_threads){
    memset(histo,0,histo_height*histo_width*sizeof(unsigned char));
    unsigned int i;
#pragma omp parallel for 
    for (i = 0; i < img_width*img_height; ++i) {
      const unsigned int value = img[i];
#pragma omp critical
      if (histo[value] < MY_UINT8_MAX) {
        ++histo[value];
      }
    }
  }
}

int main(int argc, char* argv[]) {
  struct pb_TimerSet timers;
  struct pb_Parameters *parameters;

  printf("OMP Base implementation of histogramming.\n");
  printf("Maintained by Nady Obeid <obeid1@ece.uiuc.edu>\n");

  parameters = pb_ReadParameters(&argc, argv);
  if (!parameters)
    return -1;

  if(!parameters->inpFiles[0]){
    fputs("Input file expected\n", stderr);
    return -1;
  }

  printf("%s\n",parameters->outFile);
  int numIterations = 16;
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
  unsigned char* histo = (unsigned char*) calloc (histo_width*histo_height, sizeof(unsigned char));
  
  pb_SwitchToSubTimer(&timers, "Input", pb_TimerID_IO);

  result = fread(img, sizeof(unsigned int), img_width*img_height, f);

  fclose(f);

  if (result != img_width*img_height){
    fputs("Error reading input array from file\n", stderr);
    return -1;
  }

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  _kernel_(histo, histo_height, histo_width, img, img_height, img_width, numIterations, 0, 1);

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

