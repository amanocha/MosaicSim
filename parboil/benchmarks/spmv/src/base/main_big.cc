/***************************************************************************
 *cr
 *cr            (C) Copyright 2010 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

#include "DECADES/DECADES.h"
#include <parboil.h>
#include <stdio.h>
#include <stdlib.h>
#include <chrono>

#include "file.h"
#include "convert-dataset/convert_dataset.h"

void _kernel_(int dim, int* h_nzcnt, int* h_ptr, int* h_indices, int* h_perm, float* h_data, float* h_x_vector, float* h_Ax_vector, int tid, int num_threads) {
  int p, i, k;
  for(p=0;p<2400;p++) {
    for (i = tid; i < dim; i+=num_threads) {
      float sum = 0.0f;
      //int  bound = h_nzcnt[i / 32];
      int  bound = h_nzcnt[i];
      for(k=0;k<bound;k++ ) {
        int j = h_ptr[k] + i;
	      int in = h_indices[j];

	      float d = h_data[j];
	      float t = h_x_vector[in];

	      sum += d*t;
      }
      h_Ax_vector[h_perm[i]] = sum;
    }
  }	
}

int main(int argc, char** argv) {
        int exec_kernel = atoi(argv[1]);

	struct pb_TimerSet timers;
	struct pb_Parameters *parameters;
	
	printf("CPU-based sparse matrix vector multiplication****\n");
	printf("Original version by Li-Wen Chang <lchang20@illinois.edu> and Shengzhao Wu<wu14@illinois.edu>\n");
	printf("This version maintained by Chris Rodrigues  ***********\n");
	parameters = pb_ReadParameters(&argc, argv);
	if ((parameters->inpFiles[0] == NULL) || (parameters->inpFiles[1] == NULL))
    {
      fprintf(stderr, "Expecting two input filenames\n");
      exit(-1);
    }
	
	pb_InitializeTimerSet(&timers);
	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	
	//parameters declaration
	int len;
	int depth;
	int dim;
	int pad=1;
	int nzcnt_len;
	
	//host memory allocation
	//matrix
	float *h_data;
	int *h_indices;
	int *h_ptr;
	int *h_perm;
	int *h_nzcnt;
	//vector
	float *h_Ax_vector;
    float *h_x_vector;
	
    //load matrix from files
	pb_SwitchToTimer(&timers, pb_TimerID_IO);
	//inputData(parameters->inpFiles[0], &len, &depth, &dim,&nzcnt_len,&pad,
	//    &h_data, &h_indices, &h_ptr,
	//    &h_perm, &h_nzcnt);
	int col_count;
	coo_to_jds(
		parameters->inpFiles[0], // bcsstk32.mtx, fidapm05.mtx, jgl009.mtx
		1, // row padding
		pad, // warp size
		1, // pack size
		1, // is mirrored?
		0, // binary matrix
		1, // debug level [0:2]
		&h_data, &h_ptr, &h_nzcnt, &h_indices, &h_perm,
		&col_count, &dim, &len, &nzcnt_len, &depth
	);		


  h_Ax_vector=(float*)malloc(sizeof(float)*dim);
  h_x_vector=(float*)malloc(sizeof(float)*dim);
  input_vec( parameters->inpFiles[1], h_x_vector,dim);
	
	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	
        auto start_time = std::chrono::system_clock::now();
        if (exec_kernel) {
          _kernel_(dim, h_nzcnt, h_ptr, h_indices, h_perm, h_data, h_x_vector, h_Ax_vector, 0, 1);
        }
        auto end_time = std::chrono::system_clock::now();
        std::chrono::duration<double> elapsed_seconds = end_time-start_time;
        printf("\nkernel computation time: %fs\n", elapsed_seconds.count());

	if (parameters->outFile) {
		pb_SwitchToTimer(&timers, pb_TimerID_IO);
		outputData(parameters->outFile,h_Ax_vector,dim);
		
	}
	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	
	free (h_data);
	free (h_indices);
	free (h_ptr);
	free (h_perm);
	free (h_nzcnt);
	free (h_Ax_vector);
	free (h_x_vector);
	pb_SwitchToTimer(&timers, pb_TimerID_NONE);

	pb_PrintTimerSet(&timers);
	pb_FreeParameters(parameters);

	return 0;

}
