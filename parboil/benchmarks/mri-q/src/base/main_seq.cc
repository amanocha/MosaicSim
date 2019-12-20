/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

/* 
 * C code for creating the Q data structure for fast convolution-based 
 * Hessian multiplication for arbitrary k-space trajectories.
 *
 * Inputs:
 * kx - VECTOR of kx values, same length as ky and kz
 * ky - VECTOR of ky values, same length as kx and kz
 * kz - VECTOR of kz values, same length as kx and ky
 * x  - VECTOR of x values, same length as y and z
 * y  - VECTOR of y values, same length as x and z
 * z  - VECTOR of z values, same length as x and y
 * phi - VECTOR of the Fourier transform of the spatial basis 
 *      function, evaluated at [kx, ky, kz].  Same length as kx, ky, and kz.
 *
 * recommended g++ options:
 *  -O3 -lm -ffast-math -funroll-all-loops
 */

#include "DECADES/DECADES.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <malloc.h>
#include <chrono>

#include <parboil.h>

#include "file.h"

#define PI   3.1415926535897932384626433832795029f
#define PIx2 6.2831853071795864769252867665590058f

#define MIN(X,Y) ((X) < (Y) ? (X) : (Y))
#define K_ELEMS_PER_GRID 2048

void _kernel_(int numK, int numX, float * phiR, float * phiI, float * x, float * y, float * z, 
              float * kx, float * ky, float * kz, float * Qr, float * Qi, float ** QrK, float ** QiK, int tid, int num_threads) {

  for (int k = tid; k < numK; k+=num_threads) {
    float real = phiR[k];
    float imag = phiI[k];
    float expArg;
    float cosArg;
    float sinArg;

    float phi = real*real + imag*imag;
    
    for (int indexX = 0; indexX < numX; indexX++) {
      expArg = PIx2 * (kx[k] * x[indexX] +
                       ky[k] * y[indexX] +
                       kz[k] * z[indexX]);

      cosArg = cosf(expArg);
      sinArg = sinf(expArg);
      QrK[k][indexX] = phi * cosArg;
      QiK[k][indexX] = phi * sinArg;
    }
  }
}

void createDataStructsCPU(int numK, int numX,
	 float** Qr, float** Qi, float *** QrK, float *** QiK)
{
  *Qr = (float *) memalign(16, numX * sizeof (float));
  memset((void *)*Qr, 0, numX * sizeof(float));
  *Qi = (float *) memalign(16, numX * sizeof (float));
  memset((void *)*Qi, 0, numX * sizeof(float));

  *QrK = (float **)malloc(numK * sizeof(float *));
  *QiK = (float **)malloc(numK * sizeof(float *));
  for (int k = 0; k < numK; k++) {
    (*QrK)[k] = (float*) memalign(16, numX * sizeof (float));
    //memset((void *) (*QrK)[k], 0, numX * sizeof(float));
    (*QiK)[k] = (float*) memalign(16, numX * sizeof (float));
    //memset((void *) (*QiK)[k], 0, numX * sizeof(float));
  }
}
int
main (int argc, char *argv[]) {
  int exec_kernel = atoi(argv[1]);

  int numX, numK;		/* Number of X and K values */
  int original_numK;		/* Number of K values in input file */
  float *kx, *ky, *kz;		/* K trajectory (3D vectors) */
  float *x, *y, *z;		/* X coordinates (3D vectors) */
  float *phiR, *phiI;		/* Phi values (complex) */
  float *phiMag;		/* Magnitude of Phi */
  float *Qr, *Qi;		/* Q signal (complex) */
  float ** QrK, ** QiK;

  struct pb_Parameters *params;
  struct pb_TimerSet timers;

  pb_InitializeTimerSet(&timers);

  /* Read command line */
  params = pb_ReadParameters(&argc, argv);
  if ((params->inpFiles[0] == NULL) || (params->inpFiles[1] != NULL))
    {
      fprintf(stderr, "Expecting one input filename\n");
      exit(-1);
    }
  
  /* Read in data */
  pb_SwitchToTimer(&timers, pb_TimerID_IO);
  inputData(params->inpFiles[0],
	    &original_numK, &numX,
	    &kx, &ky, &kz,
	    &x, &y, &z,
	    &phiR, &phiI);

  /* Reduce the number of k-space samples if a number is given
   * on the command line */
/*
  if (argc < 2)
    numK = original_numK;
  else
    {
      int inputK;
      char *end;
      inputK = strtol(argv[1], &end, 10);
      if (end == argv[1])
    	{
    	  fprintf(stderr, "Expecting an integer parameter\n");
    	  exit(-1);
    	}

      numK = MIN(inputK, original_numK);
    }
*/
  // To make the memtrace less than 1G, original was 3200
  numK = 128;

  printf("%d pixels in output; %d samples in trajectory; using %d samples\n",
         numX, original_numK, numK);

  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  /* Create CPU data structures */
  createDataStructsCPU(numK, numX, &Qr, &Qi, &QrK, &QiK);
 
  // All threads run this
  auto start_time = std::chrono::system_clock::now();
  if (exec_kernel) {
    _kernel_(numK, numX, phiR, phiI, x, y, z, kx, ky, kz, Qr, Qi, QrK, QiK, 0, 1);
  }
  auto end_time = std::chrono::system_clock::now();
  std::chrono::duration<double> elapsed_seconds = end_time-start_time;
  printf("\nkernel computation time: %fs\n", elapsed_seconds.count());

  // Combine the results of different threads
  for (int indexX = 0; indexX < numX; indexX++) {
    for (int k = 0; k < numK; k++) {
      Qr[indexX] += QrK[k][indexX];
      Qi[indexX] += QiK[k][indexX];
    }
  }

  if (params->outFile)
    {
      /* Write Q to file */
      pb_SwitchToTimer(&timers, pb_TimerID_IO);
      outputData(params->outFile, Qr, Qi, numX);
      pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
    }

  free (kx);
  free (ky);
  free (kz);
  free (x);
  free (y);
  free (z);
  free (phiR);
  free (phiI);
  free (Qr);
  free (Qi);
  for (int k = 0; k < numK; k++) {
    free(QrK[k]);
    free(QiK[k]);
  }
  free(QrK);
  free(QiK); 
 
  pb_SwitchToTimer(&timers, pb_TimerID_NONE);
  pb_PrintTimerSet(&timers);
  pb_FreeParameters(params);

  return 0;
}
