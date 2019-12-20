/***************************************************************************
 *cr
 *cr            (C) Copyright 2007 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/
#include <sys/time.h>
#include <string.h>
#include <math.h>
#include <stdio.h> 

#include "model.h"

int doCompute(struct cartesian *data1, int n1, struct cartesian *data2, 
	      int n2, int doSelf, long long *data_bins, 
	      int nbins, float *binb)
{
  int i, j, k;
  if (doSelf)
    {
      n2 = n1;
      data2 = data1;
    }
  
  printf("n1 = %d\n", n1);
  n1 = 20;
  for (i = 0; i < ((doSelf) ? n1-1 : n1); i++)
    {
      float xi = data1[i].x;
      float yi = data1[i].y;
      float zi = data1[i].z;
      
      for (j = ((doSelf) ? i+1 : 0); j < n2; j++)
        {
	  float dot = xi * data2[j].x + yi * data2[j].y + 
	    zi * data2[j].z;
	  
	  // run binary search
	  int min = 0;
	  int max = nbins;
	  int k, indx;
	  
	  while (max > min+1)
            {
	      k = (min + max) / 2;
              if (i == 16 && j == 22) {
                printf("k = %d, binb = %f, result = %d\n", k, binb[k], (dot >= binb[k]));
              }
	      if (dot >= binb[k]) 
		max = k;
	      else 
		min = k;
            };
	  
	  if (i == 16 && j == 22) {
            printf("dot = %f, min = %d, max = %d\n", dot, min, max);
          } 
	  if (dot >= binb[min]) 
	    {
              if (min == 2) {
                printf("aninda here1\n");
              }
	      data_bins[min] += 1; /*k = min;*/ 
	    }
	  else if (dot < binb[max]) 
	    { 
              if (max+1 == 2) {
                printf("aninda here2\n");
              }
	      data_bins[max+1] += 1; /*k = max+1;*/ 
	    }
	  else 
	    { 
              if (max == 2) {
                printf("aninda here3, i = %d, j = %d, dot = %f\n", i, j, dot);
              }
	      data_bins[max] += 1; /*k = max;*/ 
	    }
        }
    }
  
  return 0;
}

