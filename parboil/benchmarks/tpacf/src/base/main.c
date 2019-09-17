/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/
//#include "DECADES/DECADES.h"
#include <stdio.h>
#include <stdlib.h>
#include <strings.h>
#include <unistd.h>
#include <sys/time.h>
#include <math.h>

#include "args.h"
#include "model.h"

void _kernel_(struct cartesian *data1, int n1, struct cartesian *data2, 
	      int n2, int doSelf, long long *data_bins, 
	      int nbins, float *binb, int tid, int num_threads)
{
  int i, j, k;
  if (doSelf)
    {
      n2 = n1;
      data2 = data1;
    }
  
  for (i = tid; i < ((doSelf) ? n1-1 : n1); i+=num_threads)
    {
      const register float xi = data1[i].x;
      const register float yi = data1[i].y;
      const register float zi = data1[i].z;
      
      for (j = ((doSelf) ? i+1 : 0); j < n2; j++)
        {
	  register float dot = xi * data2[j].x + yi * data2[j].y + 
	    zi * data2[j].z;
	  
	  // run binary search
	  register int min = 0;
	  register int max = nbins;
	  register int k, indx;
	  
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
    
  // memory for input data
  data = (struct cartesian*)malloc
    (args.npoints* sizeof(struct cartesian));
  if (data == NULL)
    {
      fprintf(stderr, 
	      "Unable to allocate memory for % data points (#1)\n", 
	      args.npoints);
      return(0);
    }
    
  random = (struct cartesian*)malloc
    (args.npoints*sizeof(struct cartesian));
  if (random == NULL)
    {
      fprintf(stderr, 
	      "Unable to allocate memory for % data points (#2)\n", 
	      args.npoints);
      return(0);
    }

  printf("Min distance: %f arcmin\n", min_arcmin);
  printf("Max distance: %f arcmin\n", max_arcmin);
  printf("Bins per dec: %i\n", bins_per_dec);
  printf("Total bins  : %i\n", nbins);

  // read data file
  pb_SwitchToTimer( &timers, pb_TimerID_IO );
  npd = readdatafile(params->inpFiles[0], data, args.npoints);
  pb_SwitchToTimer( &timers, pb_TimerID_COMPUTE );
  if (npd != args.npoints)
    {
      fprintf(stderr, 
	      "Error: read %i data points out of %i\n", 
	      npd, args.npoints);
      return(0);
    }

  // compute DD
  _kernel_(data, npd, NULL, 0, 1, DD, nbins, binb, 0, 1);

  // loop through random data files
  for (rf = 0; rf < args.random_count; rf++)
    {
      // read random file
      pb_SwitchToTimer( &timers, pb_TimerID_IO );
      npr = readdatafile(params->inpFiles[rf+1], random, args.npoints);
      pb_SwitchToTimer( &timers, pb_TimerID_COMPUTE );
      if (npr != args.npoints)
        {
	  fprintf(stderr, 
		  "Error: read %i random points out of %i in file %s\n", 
		  npr, args.npoints, params->inpFiles[rf+1]);
	  return(0);
        }

      // compute RR
      doCompute(random, npr, NULL, 0, 1, RRS, nbins, binb);

      // compute DR
      doCompute(data, npd, random, npr, 0, DRS, nbins, binb);
    }

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
      fprintf(outfile, "%d\n%d\n%d\n", DD[k], DRS[k], RRS[k]);      
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

