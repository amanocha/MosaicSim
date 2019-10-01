#include "DECADES/DECADES.h"
#include "stdio.h"
#include "stdlib.h"
#include <math.h>
#include "assert.h"
#include <iostream>
#include <string>
#include <sstream>
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

// Parsing a dense matrix                                                                                                                                                                                                                            
dense parse_dense_matrix(char *fname) {
  fstream in(fname);
  unsigned int m, n;

  if (!in) {
    cout << "Cannot open file.\n";
  }

  auto start = chrono::system_clock::now();
  in >> m >> n;

  cout << "dense matrix: " << fname << "\nrows: " << m << "\ncolumns: " << n << "\n\n";

  dense dense_matrix;
  dense_matrix.data = (double*) malloc(sizeof(double) * m * n) ;
  dense_matrix.size = m * n;
  dense_matrix.shape[0] = m;
  dense_matrix.shape[1] = n;
  
  //double dense_matrix[m * n];
  
  for (unsigned int i = 0; i < m; i++) {
    for (unsigned int j = 0; j < n; j++) {
      in >> dense_matrix[i*n + j];
      if ((i*n +j) % 100000 ==0){
        cout << "reading element " << i*n + j << ":" << dense_matrix[i*n + j]  << "\n\n";
      }
    }
  }

  in.close();

  printf("reading %% 100.00 finished\n");

  auto end = std::chrono::system_clock::now();
  chrono::duration<double> elapsed_seconds = end-start;
  cout << "Reading dense matrix elapsed time: " << elapsed_seconds.count() << "s\n";

  return dense_matrix;
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



void dot_dense_sparse(dense B, csr_sparse A, dense C, int tid, int num_threads){
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
}

elementwise_sparse_dense_div(csr_sparse A, dense B, csr_sparse C, int tid, int num_threads){
  C.shape = A.shape;
  C.size = A.size;
  C.data = (double*) malloc(sizeof(double) * (C.size));
  for (int i = tid; i < C.shape[0]; i += num_threads) {
    int offset = A.indptr[i+1]-A.indptr[i];
    for (int j = 0; j < offset; j ++) {
      pointer = A.indptr[i] + j;
      col = A.indices[pointer];
      C.data[pointer] = A.data[pointer] / B.data[i*A.shape[1]+col];
      C.indices[pointer] = col;
    }
  }
}




//   _kernel_(M, K, KM, P, S, x, inv_x, u, inv_r, v, z, scores, max_iter, 0, 1);
void _kernel_(dense M, csr_sparse G, dense K, dense KM,
	      dense P, dense S, dense x, dense inv_x,
	      dense u, dense inv_r, csr_sparse v, dense Z,
	      float * scores, int max_iter, int tid, int num_threads) {

  int col = 0;
  unsigned int pointer = 0;
  int outerloop = 0;
  dense K_trans;
  
  while (outerloop < max_iter){
    outerloop++;

    inv_x = invert(x); 
    K_trans = transpose(K);
    decadesTF_matmul(K_trans.shape[0], K_trans.shape[1],
		     inv_x.shape[0], inv_x.shape[1],
		     1, K_trans.data, inv_x.data,
		     u.data, tid, num_threads);

    v = elementwise_sparse_dense_div(G, u, tid, num_threads);
    v_csc = csr_to_csc(v);
    
    for (int i = 0; i< K.shape[0]; i++){
      decadesTF_mul(inv_r.size, K.shape[1], inv_r,
		    K.data + i*K.shape[1], Z.data + i*K.shape[1],
		    tid, num_threads);
    }
    x = dot_dense_sparse(Z, v_csc, tid, num_threads);
    
  }
  
  inv_x = invert(x); 
  K_trans = transpose(K);
  decadesTF_matmul(K_trans.shape[0], K_trans.shape[1],
		   inv_x.shape[0], inv_x.shape[1],
		   1, K_trans.data, inv_x.data,
		   u.data, tid, num_threads);

  elementwise_sparse_dense_div(G, u, v, tid, num_threads);
  v_csc = csr_to_csc(v);
  decadesTF_mul(K.data, M.data, KM.data);
  dot_dense_sparse(KM, v_csc, P, tid, num_threads);
  decadesTF_mul(inv_X.data, P.data, S.data);

  for (int i =0; i < inv_x.shape[1]; i++){
    scores[i]=0;
    for (int j = 0; j < inv_x.shape[0]; j++){ 
      scores[i] += S.data[i*inv_x.shape[1]+j];
    }
  }
}

dense densify_vector(float * r, int * cols, int l, int m){
  assert(m>l);
  dense dense_r;
  dense_r.shape[0] = m;
  dense_r.shape[1] = 1;
  dense_r.size = m;
  dense_r.data = (unsigned float*) malloc(sizeof(float) * dense_r.size);
  for (int i=0; i<l; i++){
    dense_r.data[cols[i]] = r.data[i];
  }
  return dense_r;
}
  

csr_sparse slice_sparse(csr_sparse A, dense idx){
  //row-wise slices the matrix)
  int new_size = 0;
  for (i=0; i< idx.size; i++){
    new_size += A.indptr[idx.data[i]+1]- A.indptr[idx.data[i]];
  }
  
  csr_sparse sliced_sparse;
  sliced_sparse.data = (unsigned float*) malloc(sizeof(float) * new_size);
  sliced_sparse.size = new_size;
  sliced_sparse.shape[0]=idx.size;
  sliced_sparse.shape[1]=A.shape[1];
  int begin, end;
  int counter =0;
  for (i=0; i<idx.size;i++){
    begin = A.indptr[idx.data[i]];
    end = A.indptr[idx.data[i]+1];
    for (j=begin; j<end; j++){
      sliced_sparse.data[counter] = A.data[j];
      counter++;
    }
  }

  return sliced_sparse;
}

csr_sparse slice_sparse(csr_sparse A, int idx){
  //row-wise slices the matrix)
  int new_size = A.indptr[idx.data[i]+1]- A.indptr[idx.data[i]];

  csr_sparse sliced_sparse;
  sliced_sparse.data = (unsigned float*) malloc(sizeof(float) * new_size);
  sliced_sparse.size = new_size;
  sliced_sparse.shape[0]=idx.size;
  sliced_sparse.shape[1]=A.shape[1];
  int begin, end;
  int counter =0;
  begin = A.indptr[idx.data[i]];
  end = A.indptr[idx.data[i]+1];
  for (j=begin; j<end; j++){
    sliced_sparse.data[counter] = A.data[j];
    counter++;
  }
  return sliced_sparse;
}  


dense cdist(dense vecs, int * sel, int len){
  dense M;
  int m = vecs.shape[0];
  int n = vecs.shape[1];
  M.shape[0] = m;
  M.shape[1] = len;
  M.size = m * len;
  M.data = (unsigned float*) malloc(sizeof(float) m*len);
  float * dist_vec = (unsigned float*) malloc(sizeof(float) *n);

  for (i=0; i<len; i++){
    k=sel[i];
    for (j=0 ; j<m; j++){
      for (z=0; z<n; z++){
	M.data[i*n+j] += pow(vecs.data[k*n+z]-vecs.data[j*n+z],2);
      }
      M.data[i*n+j] = sqrt(M.data[i*n+j]);
    }
  }
  return M;
}



int main(int argc, char** argv) {

  //int m=100000;
  //int n = 5000;

  //char *sparse_fname, *dense_fname;
  char *sparse_fname;
  csr_sparse G;
  csr_sparse mat;
  dense M;
  
  csr_sparse v;
  v.shape = G.shape;
  v.size = G.size;
  v.data = (unsigned float*) malloc(sizeof(float) * v.size);
    
  assert(argc == 3);
  sparse_fname = argv[1];
  dense_fname = argv[2];
  int query_idx = 50;
  //std::istringstream iss (argv[3]);
  //iss >> query_idx;


  
  // M = parse_dense_matrix(dense_fname);
  // G = parse_csr_sparse(sparse_fname);
  mat = parse_csr_sparse(sparse_fname);
  vec = parse_dense_matrix(dense_name);

  // std::array<int, query_idx > doc_idx;
  // std::iota(doc_idx.begin(), doc_idx.end(), 1);

  dense doc_idx;
  doc_idx.data  = int* malloc(sizeof(int) * query_idx);
  for (i=0; i<query_idx; i++){
    doc_idx.data[i]=i;
  }
  doc_idx.size = query_idx;
  doc_idx.shape[0] = query_idx;
  doc_idx.shape[1] = 1;  
  
  G = slice_sparse(mat, doc_idx);  
  r = slice_sparse(mat, query_idx);
  M = cdist(vec, r.indices, r.shape[0]);
  
  dense K;
  K.shape = M.shape;
  K.size = M.size;
  K.data = (unsigned float*) malloc(sizeof(float) * K.size);
  for (int i=0; i< K.size; i++){
    K.data[i] = exp(M.data[i]);
  }

  dense x;
  x.shape[0] = K.shape[0];
  x.shape[0] = G.shape[1];
  x.size = K.shape[0]* G.shape[1];
  x.data = (unsigned float*) malloc(sizeof(float) * x.size);
  for (int i=0; i<x.size; i++){
    x.data[i] = 1/r.shape[0];
  }

  dense inv_x;
  inv_x.shape[0] = K.shape[0];
  inv_x.shape[0] = G.shape[1];
  inv_x.size = K.shape[0]* G.shape[1];
  inv_x.data = (unsigned float*) malloc(sizeof(float) * inv_x.size);

  dense KM;
  KM.shape = K.shape;
  KM.size = K.size;
  KM.data = (unsigned float*) malloc(sizeof(float) * KM.size);

  dense Z;
  Z.shape = K.shape;
  Z.size = K.size;
  Z.data = (unsigned float*) malloc(sizeof(float) * Z.size);

  
  dense P;
  P.shape[0] = K.shape[0];
  P.shape[1] = G.shape[1];
  P.size = K.shape[0]*G.shape[1] ;
  P.data = (unsigned float*) malloc(sizeof(float) * P.size);

  dense S;
  S.shape = P.shape;
  S.size = P.size;
  S.data = (unsigned float*) malloc(sizeof(float) * S.size);

  dense u;
  u.shape = G.shape;
  u.size = u.shape[0] * u.shape[1];
  u.data = (unsigned float*) malloc(sizeof(float) * u.size);

  dense scores;
  scores.shape[0] = x.shape[1];
  scores.shape[1] = 1;
  scores.size = x.shape[1];
  scores.data = (unsigned float*) malloc(sizeof(float) * u.size);
  
  printf("\n\nstarting kernel\n");
  auto start = chrono::system_clock::now();

  _kernel_(M, G, K, KM, P, S, x, inv_x, u, v, Z, scores, max_iter, 0, 1);

  double res = 0;
  for (int i = 0; i < scores.size; i ++){
    res += (scores.data[i]*i);
      }
  
  cout << "RESULT HASH: " << res << "\n";

  printf("\nending kernel");
  auto end = std::chrono::system_clock::now();
  chrono::duration<double> elapsed_seconds = end-start;
  cout << "\nkernel computation time: " << elapsed_seconds.count() << "s\n";
  
  /*
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
  */
  delete M,G, K, KM, P, S, x, inv_x, u, v, Z, scores ;
}