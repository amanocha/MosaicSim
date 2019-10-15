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
#include "DECADES/DECADES_TensorFlow.h"
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
  float       *data;
};


// CSC sparse matrix
struct csc_sparse {
  unsigned int nodes;
  unsigned int size;  
  unsigned int *shape;
  unsigned int *indptr;
  unsigned int *indices;
  float       *data;
};

// Dense matrix
struct dense {
  unsigned int size;  
  unsigned int *shape;
  float       *data;
};

// Dense matrix
struct dense_int {
  unsigned int size;  
  unsigned int *shape;
  int       *data;
};

// Parsing a dense matrix                                                                                                                                                                                                                            
dense parse_dense_matrix(char *fname) {
  fstream in(fname);
  in.exceptions(std::ifstream::failbit | std::ifstream::badbit);
  unsigned int m, n;
  cout << "reading dense matrix data...\n";

  if (!in) {
    cout << "Cannot open file.\n";
  }

  auto start = chrono::system_clock::now();
  in >> m >> n;

    
  cout << "dense matrix: " << fname << "\nrows: " << m << "\ncolumns: " << n << "\n\n";

  dense dense_matrix;
  dense_matrix.data = (float*) calloc(m*n, sizeof(float)) ;
  dense_matrix.size = m * n;
  dense_matrix.shape =   (unsigned int*) calloc(2, sizeof(unsigned int) );
  dense_matrix.shape[0] = m;
  dense_matrix.shape[1] = n;
  
  //float dense_matrix[m * n];
  for (unsigned int i = 0; i < m; i++) {
    for (unsigned int j = 0; j < n; j++) {
      in >> dense_matrix.data[i*n + j];
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
  float third;

  auto start = chrono::system_clock::now();

  reader >> m >> n >> s;

  cout << "sparse: " << fname << "\nrows: " << m << "\ncolumns: " << n << "\nsize: " << s <<"\n\n";

  ret.shape =  (unsigned int*) calloc(2, sizeof(unsigned int) );
  ret.size = s;
  ret.shape[0] = m;  
  ret.shape[1] = n;
  ret.indptr = (unsigned int*) calloc((ret.shape[0] + 1), sizeof(unsigned int));
  ret.indices = (unsigned int*) calloc((ret.size), sizeof(unsigned int));
  ret.data = (float*) calloc((ret.size), sizeof(float));
  
  ret.indptr[0] = 0;
  cout << "length of array:" << ret.size << "\n\n";
  cout << "shape of array:" << ret.shape[0] << " x " << ret.shape[1] << "\n\n";
  
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
  chrono::duration<float> elapsed_seconds = end-start;
  cout << "Reading sparse matrix elapsed time: " << elapsed_seconds.count() << "s\n";

  return ret;
}


csc_sparse csr_to_csc(csr_sparse A){
  int n_rows, n_cols, last;
  n_rows = A.shape[0];
  n_cols = A.shape[1];
  csc_sparse B;
  B.indptr = (unsigned int*) calloc((n_cols+1), sizeof(unsigned int));
  B.indices= (unsigned int*) calloc(A.size, sizeof(unsigned int)); 
  B.data = (float*) calloc(A.size, sizeof(float) ); 
  B.shape = A.shape;
  B.size = A.size;

  // enter number of elements per column:
  for (int i=0; i< A.size; i++){
    B.indptr[A.indices[i]+1] += 1;
  }
  
  // cumsum number of elements per column:
  for (int i = 1; i < n_cols+1; i++) {
    B.indptr[i] += B.indptr[i-1];
  }
  

  // fill indices of rows into index array and
  // fill columnwise stacked data into data array                                                                                                                                                                                                    
  int col, b_j, temp;
  for (int row=0; row<n_rows; row++){
    for (int j=A.indptr[row]; j<A.indptr[row+1]; j++){
      col = A.indices[j];
      b_j = B.indptr[col];
      B.indices[b_j] = row;
      B.data[b_j] = A.data[j];
      B.indptr[col] += 1;
    }
  }

  last = 0;
  for (int col=0; col<n_cols+1; col++){
    temp = B.indptr[col];
    B.indptr[col] = last;
    last = temp;
  }
  
  return B;
}

csr_sparse csc_to_csr(csc_sparse A){
  int n_rows, n_cols, last;
  n_rows = A.shape[0];
  n_cols = A.shape[1];

  csr_sparse B;
  B.indptr = (unsigned int*) calloc((n_rows+1), sizeof(unsigned int));
  B.indices= (unsigned int*) calloc(A.size, sizeof(unsigned int)); 
  B.data = (float*) calloc(A.size, sizeof(float) ); 
  B.shape = A.shape;
  B.size = A.size;
  
  for (int i=0; i< A.size; i++){
    B.indptr[A.indices[i]+1] += 1;
  }
  
  for (int i = 1; i < n_rows+1; i++) {
    B.indptr[i] += B.indptr[i-1];
  }
  // fill indices of rows into index array and                                                                            
  // fill columnwise stacked data into data array
  
  int row, b_j, temp;
  for (int col=0; col<n_cols; col++){
    for (int j=A.indptr[col]; j<A.indptr[col+1]; j++){
      row = A.indices[j];
      b_j = B.indptr[row];
      B.indices[b_j] = col;
      B.data[b_j] = A.data[j];
      B.indptr[row] += 1;
    }
  }
  
  last = 0;
  for (int row=0; row<n_rows+1; row++){
    temp = B.indptr[row];
    B.indptr[row] = last;
    last = temp;
  }

  return B;
}

dense transpose(dense Q){
  dense ret;
  int i ,j;
  ret.size = Q.size;
  ret.shape = (unsigned int*) calloc(2, sizeof(unsigned int) );
  ret.shape[0] = Q.shape[1];
  ret.shape[1] = Q.shape[0];
  ret.data = (float*) calloc(Q.size, sizeof(float));
  for (int idx = 0 ; idx< Q.size; idx+=1){
    j = idx % Q.shape[1];
    i = floor(idx/Q.shape[1]);
    ret.data[j*Q.shape[0]+i] = Q.data[idx];
  }
  return ret;
}

void invert(dense Q, dense ret, int tid, int num_threads){
  int i ,j;
  //ret.size = Q.size;
  //ret.shape = Q.shape;
  //ret.data = (float*) malloc(sizeof(float) * Q.size);

  //TODO: put assertion here that the shape matches
  for (int idx = tid ; idx< Q.size; idx+=num_threads){
    ret.data[idx] = 1/ Q.data[idx];
  }
}

csr_sparse invert(csr_sparse Q){
  csr_sparse ret;
  int i ,j;
  ret.size = Q.size;
  ret.shape = Q.shape;
  ret.indptr = Q.indptr;
  ret.indices = Q.indices;
  ret.data = (float*) calloc(Q.size, sizeof(float));
  for (int idx = 0 ; idx< Q.size; idx+=1){
    ret.data[idx] = 1/ Q.data[idx];
  }
  return ret;
}


//multi-threaded
void dot_dense_sparse(dense B, csc_sparse A, dense C, int tid, int num_threads){
  float tmp;
  unsigned int n_cols, n_rows;
  n_cols=A.shape[1];
  n_rows = B.shape[0];

  for (int i = 0; i < n_rows; i++){
    for (int j = tid; j < n_cols; j+=num_threads){
      tmp = 0.0;
      for (int k=A.indptr[j]; k < A.indptr[j+1]; k++){
	tmp += B.data[i*B.shape[1]+A.indices[k]] * A.data[k];
	}
      C.data[i*C.shape[1]+j] = tmp;
    }
  }
}


//multi-threaded
void elementwise_sparse_dense_div(csr_sparse A, dense B, csr_sparse C, int tid, int num_threads){
  unsigned int pointer, col;
  unsigned int offset;

  int tmp=0;
  for (int i = 0; i < A.shape[0]; i ++) {
    offset = A.indptr[i+1]-A.indptr[i];
    for (int j = tid; j < offset; j+=num_threads) {
      pointer = A.indptr[i] + j;
      col = A.indices[pointer];

      //if (B.data[i*A.shape[1]+col]!=0){
      C.data[pointer] = A.data[pointer] / B.data[i*A.shape[1]+col];
	//}
    }
  }
}

/*
dense densify_vector(csr_sparse r, int * cols, int l, int m){
  assert(m>l);
  dense dense_r;
  dense_r.shape[0] = m;
  dense_r.shape[1] = 1;
  dense_r.size = m;
  dense_r.data = (float*) malloc(sizeof(float) * dense_r.size);
  for (int i=0; i<l; i++){
    dense_r.data[cols[i]] = r.data[i];
  }
  return dense_r;
}  
*/


csr_sparse slice_sparse(csr_sparse B, dense_int idx){
  //column-wise slices the matrix
  
  int new_size, index;
  csc_sparse A = csr_to_csc(B);
  new_size = 0;

  for (int j=0; j< idx.size; j++){
    index = idx.data[j];
    new_size += A.indptr[index+1]- A.indptr[index];
  }
  
  csc_sparse sliced_sparse;
  sliced_sparse.data = (float*) calloc(new_size, sizeof(float));
  sliced_sparse.size = new_size;
  sliced_sparse.shape = (unsigned int*) calloc(2, sizeof(unsigned int) );
  sliced_sparse.shape[1]=idx.size;
  sliced_sparse.shape[0]=A.shape[0];
  sliced_sparse.indptr=(unsigned int*) calloc((A.shape[0]+1), sizeof(unsigned int));
  sliced_sparse.indices=(unsigned int*) calloc(new_size, sizeof(unsigned int));

  int begin, end;
  int counter =0;

  for (int i=0; i<idx.size; i++){
    index = idx.data[i];
    begin = A.indptr[index];
    end = A.indptr[index+1];
    sliced_sparse.indptr[i+1] = sliced_sparse.indptr[i]+end-begin;
    
    for (int j=begin; j<end; j++){
      sliced_sparse.data[counter] = A.data[j];
      sliced_sparse.indices[counter] = A.indices[j];
      counter++;

    }
  }
  return csc_to_csr(sliced_sparse);
}

csr_sparse slice_sparse(csr_sparse B, int idx){
  //row-wise slices the matrix)
  csc_sparse A = csr_to_csc(B);
  int new_size = A.indptr[idx+1]- A.indptr[idx];

  csr_sparse sliced_sparse;
  sliced_sparse.data = (float*) calloc(new_size, sizeof(float));
  sliced_sparse.size = new_size;
  sliced_sparse.shape = (unsigned int*) calloc(2, sizeof(unsigned int));
  sliced_sparse.shape[1]=1;
  sliced_sparse.shape[0]=A.shape[0];
  sliced_sparse.indptr=(unsigned int*) calloc(2, sizeof(unsigned int));
  sliced_sparse.indptr[1] = new_size;
  sliced_sparse.indices = (unsigned int*) calloc(new_size, sizeof(unsigned int));
  int begin;
  int counter =0;
  begin = A.indptr[idx];
  //printing indices of A for idx-th column:
  
  for (int j=0; j<new_size; j++){
    sliced_sparse.data[j] = A.data[begin+j];
    sliced_sparse.indices[j] = A.indices[begin+j];
  }

  return (sliced_sparse);
}  

dense cdist(dense vecs, unsigned int * sel, int len){
  dense M;
  int k;
  int m = vecs.shape[0];
  int n = vecs.shape[1];
  
  M.shape = (unsigned int*) calloc(2, sizeof(unsigned int) );
  M.shape[0] = len;
  M.shape[1] = m;
  M.size = m * len;
  M.data = (float*) calloc(m*len, sizeof(float));
  //float * dist_vec = (float*) malloc(sizeof(float)* n);
  float tmp_dist= 0;
  for (int i=0; i<len; i++){
    k=sel[i];
    for (int j=0 ; j<m; j++){
      for (int z=0; z<n; z++){
	tmp_dist = (vecs.data[k*n+z]-vecs.data[j*n+z]);
	M.data[i*m+j] += (tmp_dist*tmp_dist);
      }
      M.data[i*m+j] = sqrt(M.data[i*m+j]);
    }
  }
  
  return M;
}

void _kernel_(csr_sparse G, dense K, dense K_trans,
	      dense x, dense inv_x,
	      dense u, csr_sparse v, csc_sparse v_csc, dense Z,
	      int max_iter, int tid, int num_threads) {

  int col = 0;
  unsigned int pointer = 0;
  int outerloop = 0;
  //dense K_trans;
  // csc_sparse v_csc;
  //K_trans = transpose(K);
  
  while (outerloop < max_iter){
    cout << "outerloop # : " << outerloop <<"\n";
    outerloop++;

    //invert(x, inv_x, tid, num_threads);
     
    //DECADES_BARRIER();
    // int m = K_trans.shape[0];
    int m = 360;
    int k = K_trans.shape[1];
    //    int n = inv_x.shape[1];
    int n = 175;
    cout << "multiplying matrices with " << m << " x " <<  k << " and " << k << " x " <<  n << "\n";
    //decadesTF_matmul(K_trans.shape[0], K_trans.shape[1],
    // 		       inv_x.shape[0], inv_x.shape[1],
    // 		       1, K_trans.data, inv_x.data,
    // 		       u.data, tid, num_threads);

    decadesTF_matmul(m, k,
    		       k, n,
   		       1, K_trans.data, inv_x.data,
    		       u.data, tid, num_threads);
     
    DECADES_BARRIER();

    elementwise_sparse_dense_div(G, u, v, tid, num_threads);
    
    DECADES_BARRIER();

    //v_csc = csr_to_csc(v);
    
    //DECADES_BARRIER();

    //dot_dense_sparse(Z, v_csc, x, tid, num_threads);

    //DECADES_BARRIER();
  }

  
}


int main(int argc, char** argv) {

  //int m=100000;
  //int n = 5000;

  char *sparse_fname, *dense_fname;
  //char *sparse_fname;
  
  assert(argc == 3);
  sparse_fname = argv[1];
  dense_fname = argv[2];
  int query_idx = 50;
  int max_iter =1;

  csr_sparse mat = parse_csr_sparse(sparse_fname);
  dense vec = parse_dense_matrix(dense_fname);
  cout << "shape of mat:" << mat.shape[0]<< " x " << mat.shape[1] << "\n";
  cout << "shape of vec:" << vec.shape[0]<< " x " << vec.shape[1] << "\n";
  
  dense_int doc_idx;
  doc_idx.data  = (int*) calloc(query_idx, sizeof(int));
  for (int i=0; i<query_idx; i++){
    doc_idx.data[i]=i;
  }
  doc_idx.shape = (unsigned int*) calloc(2, sizeof(unsigned int));
  doc_idx.size = query_idx;
  doc_idx.shape[0] = query_idx;
  doc_idx.shape[1] = 1;  

  //csr_sparse G = slice_sparse(mat, doc_idx);
  csr_sparse G = mat;
  csr_sparse r = slice_sparse(mat, query_idx);
  cout << "shape of G:" << G.shape[0]<< " x " << G.shape[1] << "   size: " << G.size << " \n";
  cout << "shape of r:" << r.shape[0]<< " x " << r.shape[1] << "   size: " << r.size << " \n";

  dense M = cdist(vec, r.indices, r.size);
  cout << "shape of M:" << M.shape[0]<< " x " << M.shape[1] << "   size: " << M.size << " \n";

  
  csr_sparse inv_r = invert(r);

    
  csr_sparse v;
  v.shape = G.shape;
  v.size = G.size;
  v.data = (float*) calloc(v.size, sizeof(float));
  v.indptr = G.indptr;
  v.indices = G.indices;

  dense K;
  K.shape = M.shape;
  K.size = M.size;
  K.data = (float*) calloc(K.size, sizeof(float));
  for (int i=0; i< K.size; i++){
    K.data[i] = exp(-M.data[i]);
  }

  dense x;
  x.shape = (unsigned int*) calloc(2, sizeof(unsigned int) );
  x.shape[0] = r.size;
  x.shape[1] = G.shape[1];
  x.size = r.size* G.shape[1];
  x.data = (float*) calloc(x.size, sizeof(float) );

  for (int i=0; i<x.size; i++){
    x.data[i] = 1.0/r.size;
  }
  

  dense inv_x;
  inv_x.shape = (unsigned int*) calloc(2, sizeof(unsigned int) );
  inv_x.shape[0] = r.size;
  inv_x.shape[1] = G.shape[1];
  inv_x.size = r.size* G.shape[1];
  inv_x.data = (float*) calloc(inv_x.size, sizeof(float));

  dense KM;
  KM.shape = K.shape;
  KM.size = K.size;
  KM.data = (float*) calloc(KM.size, sizeof(float));

  dense Z;
  Z.shape = K.shape;
  Z.size = K.size;
  Z.data = (float*) calloc(Z.size, sizeof(float));

  
  dense P;
  P.shape = (unsigned int*) calloc(2, sizeof(unsigned int));
  P.shape[0] = K.shape[0];
  P.shape[1] = G.shape[1];
  P.size = K.shape[0]*G.shape[1] ;
  P.data = (float*) calloc(P.size, sizeof(float));

  dense S;
  S.shape = P.shape;
  S.size = P.size;
  S.data = (float*) calloc(S.size, sizeof(float));

  dense u;
  u.shape = G.shape;
  u.size = u.shape[0] * u.shape[1];
  u.data = (float*) calloc(u.size, sizeof(float));

  dense scores;
  scores.shape = (unsigned int*) calloc(2, sizeof(unsigned int));
  scores.shape[0] = x.shape[1];
  scores.shape[1] = 1;
  scores.size = x.shape[1];
  scores.data = (float*) calloc(scores.size, sizeof(float));

  //dense K_trans;
  //csc_sparse v_csc;

  dense K_trans;
  csc_sparse v_csc;
  v_csc  = csr_to_csc(v);
  K_trans = transpose(K);
  


  for (int i = 0; i< K.shape[0]; i++){
    for (int j=0; j< K.shape[1] ; j++){
      Z.data[i*Z.shape[1]+j] = K.data[i*K.shape[1]+j]*inv_r.data[i];
      /*decadesTF_mul(inv_r.size, K.shape[1], inv_r.data,
	K.data + i*K.shape[1], Z.data + i*K.shape[1],
	tid, num_threads);*/
    }
  }

  printf("\n\nstarting kernel\n");
  auto start_time = chrono::system_clock::now();

  _kernel_(G, K, K_trans, x, inv_x, u, v, v_csc, Z,  max_iter, 0, 1);

  printf("\nending kernel");
  auto time_end = std::chrono::system_clock::now();
  chrono::duration<float> elapsed_seconds = time_end-start_time;
  cout << "\nkernel computation time: " << elapsed_seconds.count() << "s\n";
  

  invert(x, inv_x, 0, 1); 
  K_trans = transpose(K);

  decadesTF_matmul(K_trans.shape[0], K_trans.shape[1],
		   inv_x.shape[0], inv_x.shape[1],
		   1, K_trans.data, inv_x.data,
		   u.data, 0, 1);
  
  elementwise_sparse_dense_div(G, u, v, 0, 1);
  v_csc = csr_to_csc(v);

  decadesTF_sdp(2, K.size, K.data, M.data, KM.data, 0, 1);
  
  dot_dense_sparse(KM, v_csc, P, 0,1);

  decadesTF_sdp(2, P.size, inv_x.data, P.data, S.data, 0, 1);

  for (int i =0; i < inv_x.shape[1]; i++){
    scores.data[i]=0;
    for (int j = 0; j < inv_x.shape[0]; j++){ 
      scores.data[i] += S.data[j*inv_x.shape[1]+i];
    }
    }

  
  float res = 0;
  cout << "scores size:" << scores.size << "\n";
  cout << "first 20 elements of scores:\n";
  for (int i = 0; i < 20; i ++){
    cout << scores.data[i] << "\n";
  }
  for (int i = 0; i < scores.size; i ++){
    res += (scores.data[i]*i);
      }
  
  cout << "RESULT HASH: " << res << "\n";

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
  /*
  free((void*)(M.data));
  free((void*)(G.data));
  free((void*)(G.indptr));
  free((void*)(G.indices));
  free((void*)(K.data));
  free((void*)(KM.data));
  free((void*)(P.data));
  free((void*)(S.data));
  free((void*)(x.data));
  free((void*)(inv_x.data));
  free((void*)(u.data));
  free((void*)(v.data));
  free((void*)(v.indptr));
  free((void*)(v.indices));
  free((void*)(inv_r.data));  
  free((void*)(inv_r.indptr));
  free((void*)(inv_r.indices));
  free((void*)(Z.data));
  free((void*)(scores.data));
  */
  //delete M.data,G.data, G.indices, G.indptr, v.data, v.indices, v.indptr, inv_r.data, inv_r.indices, inv_r.indptr, K.data, KM.data, P.data, S.data, x.data, inv_x.data, u.data, Z.data, scores.data ;

  //delete M,G,v, KM, K, P,S,x, inv_x, inv_r, scores, u, Z;
}
