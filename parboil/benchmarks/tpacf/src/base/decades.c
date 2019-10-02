/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/
#include "DECADES/DECADES.h"
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <sys/time.h>
#include <math.h>

#include "args.h"
#include "model.h"

int compute(struct cartesian *data1, int n1, struct cartesian *data2, int n2, int doSelf, long long *data_bins, int nbins, float *binb)
{
  int i, j, k;
  if (doSelf)
    {
      n2 = n1;
      data2 = data1;
    }
  
  for (i = 0; i < ((doSelf) ? n1-1 : n1); i++)
    {
      float xi = data1[i].x;
      float yi = data1[i].y;
      float zi = data1[i].z;

      for (j = ((doSelf) ? i+1 : 0); j < n2; j++)
        {
	  float dot = xi * data2[j].x + yi * data2[j].y + zi * data2[j].z;
	  
	  // run binary search
	  int min = 0;
	  int max = nbins;
	  int k, indx;
	  
	  while (max > min+1)
            {
	      k = (min + max) / 2;
	      if (dot >= binb[k]) 
		max = k;
	      else 
		min = k;
            };
	  
	  if (dot >= binb[min]) 
	    {
	      data_bins[min] += 1; /*k = min;*/ 
	    }
	  else if (dot < binb[max]) 
	    { 
	      data_bins[max+1] += 1; /*k = max+1;*/ 
	    }
	  else 
	    { 
	      data_bins[max] += 1; /*k = max;*/ 
	    }
        }
    }

    return 0;
}

void _kernel_(int npoints, int count, struct cartesian *all_data, int *nps, long long *DD, long long *RRS, long long *DRS, int nbins, float *binb, int tid, int num_threads) {
  // compute DD
  struct cartesian *data = &all_data[0];
  int npd = nps[0];

  if (tid == 0) {
    compute(data, npd, NULL, 0, 1, DD, nbins, binb);
    //printf("DD: %lld %lld %lld\n", DD[0], DD[1], DD[2]);
  }
  DECADES_BARRIER();

  int rf;
  for (rf = 1+tid; rf < count; rf += num_threads) {
    struct cartesian *random = &all_data[rf*npoints];

    // compute RR
    compute(random, nps[rf], NULL, 0, 1, RRS, nbins, binb);

    // compute DR
    compute(data, npd, random, nps[rf], 0, DRS, nbins, binb);
  }
}

int main( int argc, char **argv )
{
  struct pb_TimerSet timers;
  struct pb_Parameters *params;
  int rf, k, nbins, npd, npr;
  float *binb, w;
  long long *DD, *RRS, *DRS;
  size_t memsize;
  struct cartesian *data, *random;
  FILE *outfile;

  pb_InitializeTimerSet( &timers );
  params = pb_ReadParameters( &argc, argv );

  options args;
  parse_args( argc, argv, &args );
    
  pb_SwitchToTimer( &timers, pb_TimerID_COMPUTE );
  nbins = (int)floor(bins_per_dec * (log10(max_arcmin) - 
					 log10(min_arcmin)));
  memsize = (nbins+2)*sizeof(long long);
    
  // memory for bin boundaries
  binb = (float *)malloc((nbins+1)*sizeof(float));
  if (binb == NULL)
    {
      fprintf(stderr, "Unable to allocate memory\n");
      exit(-1);
    }
  for (k = 0; k < nbins+1; k++)
    {
      binb[k] = cos(pow(10, log10(min_arcmin) + 
			k*1.0/bins_per_dec) / 60.0*D2R);
      printf("%f\n", binb[k]);
    }
    
  // memory for DD
  DD = (long long*)malloc(memsize);
  if (DD == NULL)
    {
      fprintf(stderr, "Unable to allocate memory\n");
      exit(-1);
    }
  bzero(DD, memsize);
    
  // memory for RR
  RRS = (long long*)malloc(memsize);
  if (RRS == NULL)
    {
      fprintf(stderr, "Unable to allocate memory\n");
      exit(-1);
    }
  bzero(RRS, memsize);
    
  // memory for DR
  DRS = (long long*)malloc(memsize);
  if (DRS == NULL)
    {
      fprintf(stderr, "Unable to allocate memory\n");
      exit(-1);
    }
  bzero(DRS, memsize);
    
  // read data file
  pb_SwitchToTimer( &timers, pb_TimerID_IO );
  
  // memory for input data
  struct cartesian *all_data = (struct cartesian*) malloc((args.random_count+1)*args.npoints*sizeof(struct cartesian));
  int *nps = (int*) malloc((args.random_count+1)*sizeof(int));
  
  // loop through data and random files
  for (rf = 0; rf <= args.random_count; rf++) {
    // when rf > 0, read random file
    int index = rf * args.npoints;
    nps[rf] = readdatafile(params->inpFiles[rf], &all_data[index], args.npoints);
    // catch errors
    if (&all_data[index] == NULL) {
      fprintf(stderr, "Unable to allocate memory for % data points (#1)\n", args.npoints);
      return(0);
    }
    if (nps[rf] != args.npoints) {
      fprintf(stderr, "Error: read %i data points out of %i\n", nps[rf], args.npoints);
      return(0);
    }
  }

  printf("Min distance: %f arcmin\n", min_arcmin);
  printf("Max distance: %f arcmin\n", max_arcmin);
  printf("Bins per dec: %i\n", bins_per_dec);
  printf("Total bins  : %i\n", nbins);

  pb_SwitchToTimer( &timers, pb_TimerID_COMPUTE );

  // compute DD
  _kernel_(args.npoints, 1+args.random_count, all_data, nps, DD, RRS, DRS, nbins, binb, 0, 1);

  /*for (rf = 0; rf < args.random_count; rf++)
    {
      //npr = readdatafile(params->inpFiles[rf+1], random, args.npoints);
    }*/

  // compute and output results
  if ((outfile = fopen(params->outFile, "w")) == NULL)
    {
      fprintf(stderr, 
	      "Unable to open output file %s for writing, assuming stdout\n", 
	      params->outFile);
      outfile = stdout;
    }

  pb_SwitchToTimer( &timers, pb_TimerID_IO );
  for (k = 1; k < nbins+1; k++)
    {
      fprintf(outfile, "%lld\n%lld\n%lld\n", DD[k], DRS[k], RRS[k]);      
    }

  if(outfile != stdout)
    fclose(outfile);

  // free memory
  free(data);
  free(random);
  free(binb);
  free(DD);
  free(RRS);
  free(DRS);
  
  pb_SwitchToTimer( &timers, pb_TimerID_NONE );
  pb_PrintTimerSet( &timers );
  pb_FreeParameters( params );
}

