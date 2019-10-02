/***************************************************************************
 *cr
 *cr            (C) Copyright 2008-2010 The Board of Trustees of the
 *cr                        University of Illinois
 *cr                         All Rights Reserved
 *cr
 ***************************************************************************/

#include "DECADES/DECADES.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "parboil.h"
#include "atom.h"
#include "output.h"

#define ERRTOL 1e-4f

#define NOKERNELS             0
#define CUTOFF1               1
#define CUTOFF6              32
#define CUTOFF6OVERLAP       64
#define CUTOFFCPU         16384
#define CHECK_CYLINDER_CPU
#define CELLEN      4.f
#define INV_CELLEN  (1.f/CELLEN)

int appenddata(const char *filename, int size, double time) {
  FILE *fp;
  fp=fopen(filename, "a");
  if (fp == NULL) {
    printf("error appending to file %s..\n", filename);
    return -1;
  }
  fprintf(fp, "%d  %.3f\n", size, time);
  fclose(fp);
  return 0;
}

LatticeDim
lattice_from_bounding_box(Vec3 lo, Vec3 hi, float h)
{
  LatticeDim ret;

  ret.nx = (int) floorf((hi.x-lo.x)/h) + 1;
  ret.ny = (int) floorf((hi.y-lo.y)/h) + 1;
  ret.nz = (int) floorf((hi.z-lo.z)/h) + 1;
  ret.lo = lo;
  ret.h = h;

  return ret;
}

Lattice *
create_lattice(LatticeDim dim)
{
  int size;
  Lattice *lat = (Lattice *)malloc(sizeof(Lattice));

  if (lat == NULL) {
    fprintf(stderr, "Out of memory\n");
    exit(1);
  }

  lat->dim = dim;

  /* Round up the allocated size to a multiple of 8 */
  size = ((dim.nx * dim.ny * dim.nz) + 7) & ~7;
  lat->lattice = (float *)calloc(size, sizeof(float));

  if (lat->lattice == NULL) {
    fprintf(stderr, "Out of memory\n");
    exit(1);
  }

  return lat;
}


void
destroy_lattice(Lattice *lat)
{
  if (lat) {
    free(lat->lattice);
    free(lat);
  }
}

void _kernel_(Lattice* lattice, float **private_lattice, float cutoff, float exclcutoff, Atoms* atoms, int *first, int *next, int ncell, int tid, int num_threads) {
  
  int nx = lattice->dim.nx;
  int ny = lattice->dim.ny;
  int nz = lattice->dim.nz;
  float xlo = lattice->dim.lo.x;
  float ylo = lattice->dim.lo.y;
  float zlo = lattice->dim.lo.z;
  float gridspacing = lattice->dim.h;
  int natoms = atoms->size;
  Atom *atom = atoms->atoms;

  const float a2 = cutoff * cutoff;
  const float inv_a2 = 1.f / a2;
  float s;
  const float inv_gridspacing = 1.f / gridspacing;
  const int radius = (int) ceilf(cutoff * inv_gridspacing) - 1;
    /* lattice point radius about each atom */

  int n;
  int i, j, k;
  int ia, ib, ic;
  int ja, jb, jc;
  int ka, kb, kc;
  int index;
  int koff, jkoff;

  float x, y, z, q;
  float dx, dy, dz;
  float dz2, dydz2, r2;
  float e;
  float xstart, ystart;

  float *pg;
  float *plattice;
  int gindex;
  int size = ((nx * ny * nz) + 7) & ~7;
  if (tid == 0){
    plattice = (float *)calloc(num_threads*size, sizeof(float));
    *private_lattice = plattice;
  }
  DECADES_BARRIER();

  /* traverse the grid cells */
  for (gindex = tid;  gindex < ncell;  gindex+=num_threads) {
    for (n = first[gindex];  n != -1;  n = next[n]) {
      x = atom[n].x - xlo;
      y = atom[n].y - ylo;
      z = atom[n].z - zlo;
      q = atom[n].q;

      /* find closest grid point with position less than or equal to atom */
      ic = (int) (x * inv_gridspacing);
      jc = (int) (y * inv_gridspacing);
      kc = (int) (z * inv_gridspacing);

      /* find extent of surrounding box of grid points */
      ia = ic - radius;
      ib = ic + radius + 1;
      ja = jc - radius;
      jb = jc + radius + 1;
      ka = kc - radius;
      kb = kc + radius + 1;

      /* trim box edges so that they are within grid point lattice */
      if (ia < 0)   ia = 0;
      if (ib >= nx) ib = nx-1;
      if (ja < 0)   ja = 0;
      if (jb >= ny) jb = ny-1;
      if (ka < 0)   ka = 0;
      if (kb >= nz) kb = nz-1;

      /* loop over surrounding grid points */
      xstart = ia*gridspacing - x;
      ystart = ja*gridspacing - y;
      dz = ka*gridspacing - z;
      for (k = ka;  k <= kb;  k++, dz += gridspacing) {
        koff = k*ny;
        dz2 = dz*dz;
        dy = ystart;
        for (j = ja;  j <= jb;  j++, dy += gridspacing) {
          jkoff = (koff + j)*nx;
          dydz2 = dy*dy + dz2;
#ifdef CHECK_CYLINDER_CPU
          if (dydz2 >= a2) continue;
#endif

          dx = xstart;
          index = jkoff + ia;
          pg = lattice->lattice + index;

#if defined(__INTEL_COMPILER) //NO
          for (i = ia;  i <= ib;  i++, index++, dx += gridspacing) {
            r2 = dx*dx + dydz2;
            s = (1.f - r2 * inv_a2) * (1.f - r2 * inv_a2);
            e = q * (1/sqrtf(r2)) * s;

	          (*private_lattice)[tid*size+index] += e;
          }
#else //YES
          for (i = ia;  i <= ib;  i++, index++, dx += gridspacing) {
            r2 = dx*dx + dydz2;
            if (r2 >= a2)
		{
		  continue;
		}
            s = (1.f - r2 * inv_a2);
            e = q * (1/sqrtf(r2)) * s * s;
	          (*private_lattice)[tid*size+index] += e;
          }
#endif
        }
      } /* end loop over surrounding grid points */

    } /* end loop over atoms in a gridcell */
  } /* end loop over gridcells */

  DECADES_BARRIER();

  for(j=tid; j<size; j+=num_threads) {
    for(i=0; i<num_threads; i++) {
      lattice->lattice[j] += (*private_lattice)[i*size+j];
    }
  }

  DECADES_BARRIER();
  if (tid == 0){ 
    free(plattice);
  }
  /*
   * Zero the lattice points that are too close to an atom.  This is
   * necessary for numerical stability.
   */
  if (remove_exclusions(lattice, exclcutoff, atoms, tid, num_threads)) {
    //fprintf(stderr, "remove_exclusions() failed for cpu lattice\n");
    exit(1);
  }
}

int main(int argc, char *argv[]) {
  Atoms *atoms;

  LatticeDim lattice_dim;
  Lattice *cpu_lattice;
  Vec3 min_ext, max_ext;	/* Bounding box of atoms */
  Vec3 lo, hi;			/* Bounding box with padding  */

  float h = 0.5f;		/* Lattice spacing */
  float cutoff = 12.f;		/* Cutoff radius */
  float exclcutoff = 1.f;	/* Radius for exclusion */
  float padding = 0.5f;		/* Bounding box padding distance */

  int n;

  struct pb_Parameters *parameters;
  struct pb_TimerSet timers;

  /* Read input parameters */
  parameters = pb_ReadParameters(&argc, argv);
  if (parameters == NULL) {
    exit(1);
  }

  /* Expect one input file */
  if (pb_Parameters_CountInputs(parameters) != 1) {
    fprintf(stderr, "Expecting one input file\n");
    exit(1);
  }

  pb_InitializeTimerSet(&timers);
  pb_SwitchToTimer(&timers, pb_TimerID_IO);

  {
    const char *pqrfilename = parameters->inpFiles[0];

    if (!(atoms = read_atom_file(pqrfilename))) {
      fprintf(stderr, "read_atom_file() failed\n");
      exit(1);
    }
    printf("read %d atoms from file '%s'\n", atoms->size, pqrfilename);
  }

  // timer counting
  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  /* find extent of domain */
  get_atom_extent(&min_ext, &max_ext, atoms);
  printf("extent of domain is:\n");
  printf("  minimum %g %g %g\n", min_ext.x, min_ext.y, min_ext.z);
  printf("  maximum %g %g %g\n", max_ext.x, max_ext.y, max_ext.z);

  printf("padding domain by %g Angstroms\n", padding);
  lo = (Vec3) {min_ext.x - padding, min_ext.y - padding, min_ext.z - padding};
  hi = (Vec3) {max_ext.x + padding, max_ext.y + padding, max_ext.z + padding};
  printf("domain lengths are %g by %g by %g\n", hi.x-lo.x, hi.y-lo.y, hi.z-lo.z);

  lattice_dim = lattice_from_bounding_box(lo, hi, h);
  cpu_lattice = create_lattice(lattice_dim);
  printf("\n");

  ////// INIT/////////
  float inv_cellen = INV_CELLEN;
  int gindex;
  int natoms = atoms->size;
  int ncell, nxcell, nycell, nzcell;
  int *first, *next;
  Atom *atom = atoms->atoms;
  /* geometric hashing */
  int i,j,k;
 
 /* number of cells in each dimension */
  nxcell = (int) floorf((max_ext.x-min_ext.x) * inv_cellen) + 1;
  nycell = (int) floorf((max_ext.y-min_ext.y) * inv_cellen) + 1;
  nzcell = (int) floorf((max_ext.z-min_ext.z) * inv_cellen) + 1;
  ncell = nxcell * nycell * nzcell;

  /* allocate for cursor link list implementation */
  first = (int *) malloc(ncell * sizeof(int));
  for (gindex = 0;  gindex < ncell;  gindex++) {
    first[gindex] = -1;
  }
  next = (int *) malloc(natoms * sizeof(int));
  for (n = 0;  n < natoms;  n++) {
    next[n] = -1;
  }

  for (n = 0;  n < natoms;  n++) {
    if (0==atom[n].q) continue;  /* skip any non-contributing atoms */
    i = (int) floorf((atom[n].x - min_ext.x) * inv_cellen);
    j = (int) floorf((atom[n].y - min_ext.y) * inv_cellen);
    k = (int) floorf((atom[n].z - min_ext.z) * inv_cellen);
    gindex = (k*nycell + j)*nxcell + i;
    next[n] = first[gindex];
    first[gindex] = n;
  }

  float ** private_lattice = (float **)calloc(1, sizeof(float*));

  _kernel_(cpu_lattice, private_lattice, cutoff, exclcutoff, atoms, first, next, ncell, 0, 1);

  /* Print output */
  pb_SwitchToTimer(&timers, pb_TimerID_IO);
  
/* free memory */
  free(next);
  free(first);
  free(private_lattice);

  if (parameters->outFile) {
    write_lattice_summary(parameters->outFile, cpu_lattice);
  }
  pb_SwitchToTimer(&timers, pb_TimerID_COMPUTE);

  /* Cleanup */
  destroy_lattice(cpu_lattice);
  free_atom(atoms);

  pb_SwitchToTimer(&timers, pb_TimerID_NONE);
  pb_PrintTimerSet(&timers);
  pb_FreeParameters(parameters);

  return 0;
}

