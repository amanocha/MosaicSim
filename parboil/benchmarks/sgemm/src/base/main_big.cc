/***************************************************************************
 *cr
 *cr            (C) Copyright 2010 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

/* 
 * Main entry of dense matrix-matrix multiplication kernel
 */

#include "DECADES/DECADES.h"
#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <string.h>
#include <sys/time.h>
#include <malloc.h>
#include <vector>
#include <parboil.h>
#include <iostream>
#include <fstream>
#include <chrono>
#include "assert.h"

bool readColMajorMatrixFile(const char *fn, int *nr_row, int *nr_col, std::vector<float>&v)
{
  std::cerr << "Opening file:"<< fn << std::endl;
  std::fstream f(fn, std::fstream::in);
  if ( !f.good() ) {
    return false;
  }

  // Read # of rows and cols
  f >> *nr_row;
  f >> *nr_col;

  float data;
  std::cerr << "Matrix dimension: " << *nr_row << "x" << *nr_col<< std::endl;
  while (f.good()) {
    f >> data;
    v.push_back(data);
  }
  v.pop_back(); // remove the duplicated last element
  return true;
}

bool writeColMajorMatrixFile(const char *fn, int *nr_row, int *nr_col, std::vector<float>&v)
{
  std::cerr << "Opening file:"<< fn << " for write." << std::endl;
  std::fstream f(fn, std::fstream::out);
  if ( !f.good() ) {
    return false;
  }

  // Read # of rows and cols
  f << *nr_row << " " << *nr_col << " ";

  float data;
  std::cerr << "Matrix dimension: " << *nr_row << "x" << *nr_col << std::endl;
  for (int i = 0; i < v.size(); ++i) {
    f << v[i] << ' ';
  }
  f << "\n";
  return true;
}

void _kernel_(int Arows, int Bcols, int Acols, float alpha, const float *A, const float *B, float beta, float *C, int tid, int num_threads)
{
  // m = A rows, n = B cols, k = A cols 
  for (int i = 0; i < 10000; i++) {
    for (int row = tid; row < Arows; row+=num_threads) {
      int curr_Arow = row * Acols;
      for (int bb = 0; bb < Bcols; bb++) {
        int curr_Brow = bb * Acols; 
        float c = 0.0f;
        for (int col = 0; col < Acols; col++) {
          float a = A[col + curr_Arow]; 
          float b = B[col + curr_Brow];
          c += a * b;
        }
        C[bb+row*Bcols] = C[bb+row*Bcols] * beta + alpha * c;
      }
    }
  }
}

int main (int argc, char *argv[]) {
  int exec_kernel = atoi(argv[1]);

  struct pb_Parameters *params;
  struct pb_TimerSet timers;

  int matArow = 300;
  int matAcol = 150;
  int matBrow = matAcol;
  int matBcol = 100;

  std::vector<float> matA(matArow * matAcol);
  std::vector<float> matBT(matBrow * matBcol);

  pb_InitializeTimerSet(&timers);

  /* Read command line. Expect 3 inputs: A, B and B^T 
     in column-major layout*/
  params = pb_ReadParameters(&argc, argv);
  if ((params->inpFiles[0] == NULL) 
      || (params->inpFiles[1] == NULL)
      || (params->inpFiles[2] == NULL)
      || (params->inpFiles[3] != NULL))
    {
      fprintf(stderr, "Expecting three input filenames\n");
      exit(-1);
    }

  /* Read in data */
  pb_SwitchToTimer(&timers, pb_TimerID_IO);

  // load A
  readColMajorMatrixFile(params->inpFiles[0], &matArow, &matAcol, matA);
  /*for (int row = 0; row < matArow; row++) {
    for (int col = 0; col < matAcol; col++) {
      matA[row*matAcol + col] = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
    }
  }*/
  std::cerr << "matArow " << matArow << std::endl;
  std::cerr << "matAcol " << matAcol << std::endl;

  // load B^T
  readColMajorMatrixFile(params->inpFiles[2], &matBcol, &matBrow, matBT);
  /*for (int row = 0; row < matBcol; row++) {
    for (int col = 0; col < matBrow; col++) {
      matBT[row*matBrow + col] = static_cast <float> (rand()) / static_cast <float> (RAND_MAX);
    }
  }*/
  std::cerr << "matBrow " << matBrow << std::endl;
  std::cerr << "matBcol " << matBcol << std::endl;

  pb_SwitchToTimer( &timers, pb_TimerID_COMPUTE );

  // allocate space for C
  std::vector<float> matC(matArow * matBcol);

  char transa = 'N';
  char transb = 'T';
  assert((transa == 'N' || transa == 'n') && (transb == 'T' || transb == 't'));

  // Use standard sgemm interface
  auto start_time = std::chrono::system_clock::now();
  if (exec_kernel) {
    _kernel_(matArow, matBcol, matAcol, 1.0f, &matA.front(), &matBT.front(), 0.0f, &matC.front(), 0, 1);
  }
  auto end_time = std::chrono::system_clock::now();
  std::chrono::duration<double> elapsed_seconds = end_time-start_time;
  std::cout << "\nkernel computation time: " << elapsed_seconds.count() << "s\n";

  if (params->outFile) {
    /* Write C to file */
    pb_SwitchToTimer(&timers, pb_TimerID_IO);
    writeColMajorMatrixFile(params->outFile, &matArow, &matBcol, matC); 
  }

  pb_SwitchToTimer(&timers, pb_TimerID_NONE);

  double CPUtime = pb_GetElapsedTime(&(timers.timers[pb_TimerID_COMPUTE]));
  std::cout<< "GFLOPs = " << 2.* matArow * matBcol * matAcol/CPUtime/1e9 << std::endl;
  pb_PrintTimerSet(&timers);
  pb_FreeParameters(params);
  return 0;
}
