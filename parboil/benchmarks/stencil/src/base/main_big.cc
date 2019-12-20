
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
#include <string.h>
#include <chrono>

#include "file.h"
#include "common.h"


static int read_data(float *A0, int nx,int ny,int nz,FILE *fp) 
{	
	int s=0;
        int i, j, k;
	for(i=0;i<nz;i++)
	{
		for(j=0;j<ny;j++)
		{
			for(k=0;k<nx;k++)
			{
                                fread(A0+s,sizeof(float),1,fp);
				s++;
			}
		}
	}
	return 0;
}

void _kernel_(int iteration, float c0, float c1, float *h_A0, float *h_Anext, const int nx, const int ny, const int nz, int tid, int num_threads) {
  int t, i, j, k;
  float* tmp;
  for(t=0;t<iteration;t++) {
    for(i=1+tid;i<nx-1;i+=num_threads) {
      for(j=1;j<ny-1;j++) {
        for(k=1;k<nz-1;k++) {
          h_Anext[Index3D (nx, ny, i, j, k)] = (h_A0[Index3D (nx, ny, i, j, k + 1)] + h_A0[Index3D (nx, ny, i, j, k - 1)] + 
						h_A0[Index3D (nx, ny, i, j + 1, k)] + h_A0[Index3D (nx, ny, i, j - 1, k)] + 
						h_A0[Index3D (nx, ny, i + 1, j, k)] + h_A0[Index3D (nx, ny, i - 1, j, k)])*c1 - 
						h_A0[Index3D (nx, ny, i, j, k)]*c0;
        }
      }
    }

    tmp=h_A0;
    h_A0 = h_Anext;
    h_Anext = tmp;
  }

  tmp=h_A0;
  h_A0 = h_Anext;
  h_Anext = tmp;
}

int main(int argc, char** argv) {
        int exec_kernel = atoi(argv[1]);

	struct pb_TimerSet timers;
	struct pb_Parameters *parameters;
	

	
	printf("CPU-based 7 points stencil codes****\n");
	printf("Original version by Li-Wen Chang <lchang20@illinois.edu> and I-Jui Sung<sung10@illinois.edu>\n");
	printf("This version maintained by Chris Rodrigues  ***********\n");
	parameters = pb_ReadParameters(&argc, argv);

	pb_InitializeTimerSet(&timers);
	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
	
	//declaration
	int nx,ny,nz;
	int size;
  int iteration;
	float c0=1.0f/6.0f;
	float c1=1.0f/6.0f/6.0f;

/*	if (argc<5) 
    {
      printf("Usage: probe nx ny nz tx ty t\n"
	     "nx: the grid size x\n"
	     "ny: the grid size y\n"
	     "nz: the grid size z\n"
		  "t: the iteration time\n");
      return -1;
    }*/

        nx = 128;
        ny = 128;
        nz = 32;
        iteration = 16;

	/*nx = atoi(argv[1]);
	if (nx<1)
		return -1;
	ny = atoi(argv[2]);
	if (ny<1)
		return -1;
	nz = atoi(argv[3]);
	if (nz<1)
		return -1;
	iteration = atoi(argv[4]);
	if(iteration<1)
		return -1;*/

	
	//host data
	float *h_A0;
	float *h_Anext;

	size=nx*ny*nz;
	
	h_A0=(float*)malloc(sizeof(float)*size);
	h_Anext=(float*)malloc(sizeof(float)*size);
  FILE *fp = fopen(parameters->inpFiles[0], "rb");
	read_data(h_A0, nx,ny,nz,fp);
  fclose(fp);
  memcpy (h_Anext,h_A0 ,sizeof(float)*size);

  auto start_time = std::chrono::system_clock::now();
  if (exec_kernel) {
    _kernel_(iteration, c0, c1, h_A0, h_Anext, nx, ny, nz, 0, 1);
  }
  auto end_time = std::chrono::system_clock::now();
  std::chrono::duration<double> elapsed_seconds = end_time-start_time;
  printf("\nkernel computation time: %fs", elapsed_seconds.count());
  
	if (parameters->outFile) {
		 pb_SwitchToTimer(&timers, pb_TimerID_IO);
		outputData(parameters->outFile,h_Anext,nx,ny,nz);
		
	}
	pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);
		
	free (h_A0);
	free (h_Anext);
	pb_SwitchToTimer(&timers, pb_TimerID_NONE);

	pb_PrintTimerSet(&timers);
	pb_FreeParameters(parameters);

	return 0;

}
