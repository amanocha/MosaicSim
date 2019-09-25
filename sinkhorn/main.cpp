#include "DECADES/DECADES.h"
#include "stdio.h"
#include "stdlib.h"
#include "assert.h"
#include <iostream>
#include <string>
#include <fstream>
#include <chrono>
#include "DECADES_TensorFlow.h"
#define OUTPUT_RET
#define SEED 13
using namespace std;

// CSR sparse matrix
struct csr_sparse {
  unsigned int nodes;
  unsigned int size;  
  unsigned int *shape;
  unsigned int *indptr;
  unsigned int *indices;
  double       *data;
};


// CSC sparse matrix
struct csc_sparse {
  unsigned int nodes;
  unsigned int size;  
  unsigned int *shape;
  unsigned int *indptr;
  unsigned int *indices;
  double       *data;
};

// Dense matrix
struct dense {
  unsigned int size;  
  unsigned int *shape;
  double       *data;
};

csc_sparse csr_to_csc(csr_sparse A){
  int n_rows, n_cols, last;
  n_rows = A.shape[0];
  n_cols = A.shape[1];
  csc_sparse B;
  
  B.indptr = (unsigned float*) malloc(sizeof(int) * (n_cols+1));
  B.indices= (unsigned float*) malloc(sizeof(int) * A.size); 
  B.data = (unsigned float*) malloc(sizeof(float) * A.size); 

  // enter number of elements per column:                                                                                                                                                                                                            
  for (int i=0; i< A.size; i++){
    B.indptr[A.indices[i]+1] += 1;
  }
  // cumsum number of elements per column:                                                                                                                                                                                                           
  // >>>>
  for (int i = 1; i < A.shape[0]+1; i++) {
    B.indptr[i] += B.indptr[i-1];
  }

  // fill indices of rows into index array and                                                                                                                                                                                                       
  // fill columnwise stacked data into data array                                                                                                                                                                                                    
  int col, b_j, last;
  
  for (int row=0; row<n_rows; row++){
    for (int j=A.indptr[row]; j<A.indptr[row+1]; j++){
      col = A.indices[j];
      b_j = B.indptr[col];
      B.indices[b_j] = row;
      B.data[b_j] = A.data[j];
      B.indptr[col] += 1;
    }
  }

  for (int col=0; col<n_cols+1; col++){
    temp = B.indptr[col];
    B.indptr[col] = last;
    last = temp;
  }	    
  return B;
}

dense transpose(dense Q){
  dense ret;
  int i ,j;
  ret.size = Q.size;
  ret.shape = (unsigned int*) malloc(sizeof(unsigned int) * 2);
  ret.shape[0] = Q.shape[1];
  ret.shape[1] = Q.shape[0];
  ret.data = (unsigned float*) malloc(sizeof(float) * Q.size);
  for (int idx = 0 ; idx< Q.size; idx+=1){
    j = idx % Q.shape[1];
    i = floor(idx/Q.shape[1]);
    ret.data[j*Q.shape[0]+i] = Q[idx];
  }
  return ret;
}

dense invert(dense Q){
  dense ret;
  int i ,j;
  ret.size = Q.size;
  ret.shape = Q.shape;
  ret.data = (unsigned float*) malloc(sizeof(float) * Q.size);
  for (int idx = 0 ; idx< Q.size; idx+=1){
    ret.data[idx] = 1/ Q[idx];
  }
  return ret;
}



dense dot_dense_sparse(dense B, csr_sparse A){
  dense C;
  C.shape[0] = B.shape[0];
  C.shape[1] = A.shape[1];
  C.size = B.shape[0] * A.shape[1];
  C.data = (unsigned float*) malloc(sizeof(float) * C.size);
  int tmp;
  for (int i = 0; i < C.shape[0]; i++){
    for (int j = 0; j < C.shape[1]; j++){
      tmp = 0.0;
      for (int k=A.indptr[j]; k < A.indptr[j+1]; k++){
	tmp += B[i*B.shape[1]+A.indices[k]] * A.data[k];
	C.data[i*C.shape[1]+j] = tmp;	
      }
    }
  }
  return C;
}

csr_sparse elementwise_sparse_dense_div(csr_sparse A, dense B, int tid, int num_threads){
  csr_sparse C;
  
    for (int i = tid; i < C.shape[0]; i += num_threads) {
      int offset = A.indptr[i+1]-A.indptr[i];
      for (int j = 0; j < offset; j ++) {
        pointer = A.indptr[i] + j;
        col = A.indices[pointer];
        C.data[pointer] = A.data[pointer] / B.data[i*A.shape[1]+col];
        C.indices[pointer] = col;
      }
    }



csr_sparse parse_csr_sparse(char *fname) {

  csr_sparse ret;
  fstream reader(fname);
  string line;
  unsigned int m, n, s;
  unsigned int first, second;
  double third;
  ret.shape =  (unsigned int*) malloc(sizeof(unsigned int) * 2);

  auto start = chrono::system_clock::now();

  reader >> m >> n >> s;

  cout << "sparse: " << fname << "\nrows: " << m << "\ncolumns: " << n << "\nsize: " << s <<"\n\n";

  ret.shape[0] = m;  
  ret.shape[1] = n;
  ret.size = s;
  ret.indptr = (unsigned int*) malloc(sizeof(unsigned int) * (ret.shape[0] + 1));
  ret.indices = (unsigned int*) malloc(sizeof(unsigned int) * (ret.size));
  ret.data = (double*) malloc(sizeof(double) * (ret.size));
  
  ret.indptr[0] = 0;
  cout << "length of array:" << ret.size << "\n\n";
  
  for (unsigned int i = 0; i < ret.size; i++ ) {

    reader >> first >> second >> third;
    ret.indptr[first+1]++;
    ret.indices[i] = second;
    ret.data[i]=third;
  }
  for (unsigned int j =1; j< ret.shape[0]+1; j++) {
    ret.indptr[j] += ret.indptr[j-1];
  }
  
  printf("reading %% 100.00 finished\n");

  auto end = std::chrono::system_clock::now();
  chrono::duration<double> elapsed_seconds = end-start;
  cout << "Reading sparse matrix elapsed time: " << elapsed_seconds.count() << "s\n";
  
  return ret;
}



void _kernel_(csr_sparse G, double * M, csr_sparse result, int tid, int num_threads) {
  int col = 0;
  unsigned int pointer = 0;
  int outerloop = 0;
  dense inv_x;
  dense K_trans;

  while (outerloop < 10){
    outerloop++;

    inv_x = invert(x); 
    K_trans = transpose(K);
    decadesTF_matmul(K_trans.shape[0], K_trans.shape[1], inv_x.shape[0], inv_x.shape[1], K_trans, inv_x, u, tid. num_threads);

    v = elementwise_sparse_dense_div(c,u);
    
    inv_r = invert(r);
    y = inv_r * K; 
    v_csc = csr_to_csc(v);

    x = dot_dense_sparse(y, v_csc);
    
  }
  
  inv_x = invert(x); 
  K_trans = transpose(K);
  decadesTF_matmul(K_trans.shape[0], K_trans.shape[1], inv_x.shape[0], inv_x.shape[1], K_trans, inv_x, u, tid. num_threads);

  v = elementwise_sparse_dense_div(c,u);
  v_csc = csr_to_csc(v);
  KM  = elementwise_dense_dense(K,M);
  P = dot_dense_sparse(KM, v_csc);
  // there should be an accelerator for this:
  R = elementwise_dense_dense(inv_X,P);

  for (int i =0; i < inv_x.shape[1]; i++){
    scores[i]=0;
    for (int j = 0; j < inv_x.shape[0]; j++){ 
      scores[i] += R[i*inv_x.shape[1]+j];
    }
  }

}

int main(int argc, char** argv) {

  char *sparse_fname, *dense_fname;
  csr_sparse G;
  int m=100000;
  int n = 5000;
  
  // assert(argc == 3);
  assert(argc == 2);
  sparse_fname = argv[1];
  // dense_fname = argv[2];
  

  G = parse_csr_sparse(sparse_fname);
  //M = parse_dense_matrix(dense_fname);
  srand(SEED);
  double* M = (double*) malloc(sizeof(double) * m * n) ;
  
  for (unsigned int i = 0; i < m; i++) {
    for (unsigned int j = 0; j < n; j++) {
      M[i*n + j] = ((double) rand() / (RAND_MAX));
    }
  }

  
  csr_sparse result;
  result.shape = G.shape;  
  result.size = G.size;
  result.indptr = G.indptr;
  result.indices = (unsigned int*) malloc(sizeof(unsigned int) * (result.size));
  result.data = (double*) malloc(sizeof(double) * (result.size));
  result.indptr[0] = 0;


  printf("\n\nstarting kernel\n");
  auto start = chrono::system_clock::now();

  _kernel_(G, M, result, 0, 1);

  double res = 0;
  for (int i = 0; i < result.size; i ++){
    res += (result.data[i]*i);
      }
  
  cout << "RESULT HASH: " << res << "\n";

  printf("\nending kernel");
  auto end = std::chrono::system_clock::now();
  chrono::duration<double> elapsed_seconds = end-start;
  cout << "\nkernel computation time: " << elapsed_seconds.count() << "s\n";
  

  #if defined(OUTPUT_RET)
  ofstream outfile1;
  outfile1.open ("out_indptr.txt");
  for (int i = 0; i < result.shape[0]+1; i++) {
    outfile1 << result.indptr[i] << "\n";
  }
  outfile1.close();


  ofstream outfile2;
  outfile2.open ("out_indices.txt");
  for (int i = 0; i < result.size; i++) {
    outfile2 << result.indices[i] << "\n";
  }
  outfile2.close();

  ofstream outfile3;
  outfile3.open ("out_data.txt");
  for (int i = 0; i < result.size; i++) {
    outfile3 << result.data[i] << "\n";
  }
  outfile3.close();
  

  #endif
  delete M;
}
