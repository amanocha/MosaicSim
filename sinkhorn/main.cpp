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
  cout << "shape of array:" << ret.shape[0] << "x" << ret.shape[1] << "\n\n";
  
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
      if (b_j<100){
	cout << "got here: B.data[" << b_j << "]:" << B.data[b_j] << "\n";
      }
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

  cout << "printing first 10 elements of dot_dense_sparse_output\n";
  int tt=0;
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
  cout << "first 5000:5010 elements of B in the while loop:\n";
  for (int i= 5000 ; i< 5010; i++){
    cout << B.data[i] << "\n" ;
  }

  cout << "Sparse mat shape and size: " << A.shape[0] << " x " << A.shape[1] << " , " << A.size << "\n";
  cout << "dense mat shape and size: " << B.shape[0] << " x " << B.shape[1] << " , " << B.size << "\n";
  int tmp=0;
  for (int i = tid; i < A.shape[0]; i += num_threads) {
    offset = A.indptr[i+1]-A.indptr[i];
    for (int j = 0; j < offset; j ++) {
      pointer = A.indptr[i] + j;
      col = A.indices[pointer];

      if (B.data[i*A.shape[1]+col]!=0){
	C.data[pointer] = A.data[pointer] / B.data[i*A.shape[1]+col];
      }
      /*
      if (tmp <20){
	if (B.data[i*A.shape[1]+col]==0 || B.data[i*A.shape[1]+col]==INFINITY){
	  cout << "dense[" << i << ", "<< col << "]=" << B.data[i*A.shape[1]+col] << "\n";
	  cout << "i*A.shape[1]+col:" << i*A.shape[1]+col << "\n";
	}
	tmp++;
      }
      */
      /*if (C.data[pointer]==0){
	cout << "["<< i << ", " << col << "]:\n";
	cout << "v.data[" << pointer << "] is zero.. from: A.data[" << pointer << " ]: " << A.data[pointer] << "division with B.data[" << i*A.shape[1]+col <<"]:" << B.data[i*A.shape[1]+col] << "\n"; 
	}*/
      
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
  //row-wise slices the matrix)
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

// ?parallelize this
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
      //cout << M.data[i*m+j] << "\n";
    }
  }
  
  return M;
}

void _kernel_(dense M, csr_sparse G, dense K, dense KM,
	      dense P, dense S, dense x, dense inv_x,
	      dense u, csr_sparse inv_r, csr_sparse v, dense Z,
	      dense scores, int max_iter, int tid, int num_threads) {

  int col = 0;
  unsigned int pointer = 0;
  int outerloop = 0;
  dense K_trans;
  csc_sparse v_csc;
  csr_sparse A;
  float data[5] = {1, 2, 3, 4, 5};
  unsigned int indices[5] = {3,1,3,2,3};
  unsigned int indptr[5] = {0, 1,3,5};
  unsigned int shape[2] = {3,4};
  
  A.data= data;
  A.indices = indices;
  A.indptr = indptr;
  A.shape = shape;
  A.size = 5;
  
  csc_sparse B = csr_to_csc(A);
  cout << "\nB.indptr:";
  for (int i=0;i<5;i++){
    cout << B.indptr[i] << ",";
  }
  cout << "\nB.indices:";
  for (int i=0;i<5;i++){
    cout << B.indices[i] << ",";
  }
  cout << "\nB.data:";
  for (int i=0;i<5;i++){
    cout << B.data[i] << ",";
  }
  cout << "\n";
  
  
  while (outerloop < max_iter){
    cout << "outerloop # : " << outerloop <<"\n";
    outerloop++;
    cout << "first 10 elements of x in the while loop:\n";
    for (int i= 0 ; i< 10; i++){
      cout << x.data[i] << "\n" ;
    }

    invert(x, inv_x, tid, num_threads);
    cout << "first 10 elements of inv_x in the while loop:\n";
    for (int i= 0 ; i< 10; i++){
      cout << inv_x.data[i] << "\n" ;
    }

    cout << "first 10 elements of K in the while loop:\n";
    for (int i= 0 ; i< 10; i++){
      cout << K.data[i] << "\n" ;
    }

     
    K_trans = transpose(K);
    DECADES_BARRIER();
    cout << "first 10 elements of K.T in the while loop:\n";
    for (int i= 0 ; i< 10; i++){
      cout << K_trans.data[i] << "\n" ;
    }


    if (tid==0){
      decadesTF_matmul(K_trans.shape[0], K_trans.shape[1],
		       inv_x.shape[0], inv_x.shape[1],
		       1, K_trans.data, inv_x.data,
		       u.data, tid, num_threads);
    }

    cout << "first 5000:5010 elements of u in the while loop:\n";
    for (int i= 5000 ; i< 5010; i++){
      cout << u.data[i] << "\n" ;
    }
    cout << "first 10 elements of u[:10,:0] in the while loop:\n";
    for (int i= 0 ; i< 10; i++){
      cout << u.data[1*u.shape[1]+i] << "\n" ;
    }
    
    
    
    DECADES_BARRIER();

    cout << "printing u[5000:5010]\n";
    for (int i=5000 ; i<5010 ; i++){
      cout << u.data[i] << "\n";
    }

    elementwise_sparse_dense_div(G, u, v, tid, num_threads);

    int curr_row =0;
    /*
    for (int i= 0; i< G.size ; i+=1913){
      while (G.indptr[curr_row]<=i){
	curr_row++;
      }
      cout << "[i,j], idx: [" << curr_row-1 << "," << G.indices[i] <<"], "<< (curr_row-1)*G.shape[1]+G.indices[i] << "\n";
      //cout << "[i,j]: ["<< curr_row-1 << "," << G.indices[i] << "]\n"; 
      cout << "G.data[" << i << "]:" << G.data[i] << "\n";
      cout << "u.data[" << curr_row-1 << " , " << G.indices[i] << "]:" << u.data[(curr_row-1)*G.shape[1]+G.indices[i]] << "\n";
      cout << "v.data[" << i << "]:" << v.data[i] << "\n";
    }
    */
    

    //cout << "first 10 elements of v in the while loop:\n";
    cout << "v.size:" << v.size <<"\n";
    for (int i= 0 ; i< v.size; i++){
      if (v.data[i]==0){
	cout  << "v.data[" << i << "]:"<< v.data[i] << "\n" ;
    }

    } 
    v_csc = csr_to_csc(v);
    cout << "first 20 elements of v_csc in the while loop:\n";
    for (int i= 0 ; i< 20; i++){
      cout << v_csc.data[i] << "\n" ;
    }

    
    DECADES_BARRIER();
    
    if (tid==0){
      for (int i = 0; i< K.shape[0]; i++){
	decadesTF_mul(inv_r.size, K.shape[1], inv_r.data,
		      K.data + i*K.shape[1], Z.data + i*K.shape[1],
		      tid, num_threads);
      }
    }

    
    cout << "first 10 elements of Z[:,0] in the while loop:\n";
    for (int i= 0 ; i< 10; i++){
      cout << Z.data[i*Z.shape[1]] << "\n" ;
    }

    cout << "first 10 elements of Z[0,:] in the while loop:\n";
    for (int i= 0 ; i< 10; i++){
      cout << Z.data[i] << "\n" ;
    }

    
    DECADES_BARRIER();
    dot_dense_sparse(Z, v_csc, x, tid, num_threads);
    DECADES_BARRIER();
    cout << "first 10 elements of x at the end of the while loop\n";
    for (int i= 0; i< 10; i++){
      cout << x.data[i] << "\n";
    }
    
  }

  
  invert(x, inv_x, tid, num_threads); 
  K_trans = transpose(K);
  DECADES_BARRIER();

  if (tid==0){
    decadesTF_matmul(K_trans.shape[0], K_trans.shape[1],
		      inv_x.shape[0], inv_x.shape[1],
		      1, K_trans.data, inv_x.data,
		      u.data, tid, num_threads);
  }


  
  DECADES_BARRIER();
  elementwise_sparse_dense_div(G, u, v, tid, num_threads);
  v_csc = csr_to_csc(v);
  DECADES_BARRIER();
  if (tid==0){
    decadesTF_mul(K.size, M.size, K.data, M.data, KM.data, tid, num_threads);
  }
  DECADES_BARRIER();
  dot_dense_sparse(KM, v_csc, P, tid, num_threads);
  if (tid==0){
    decadesTF_mul(inv_x.size, P.size, inv_x.data, P.data, S.data, tid, num_threads);
  }
  DECADES_BARRIER();
  for (int i =tid; i < inv_x.shape[1]; i+=num_threads){
    scores.data[i]=0;
    for (int j = 0; j < inv_x.shape[0]; j++){ 
      scores.data[i] += S.data[i*inv_x.shape[1]+j];
    }
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

  cout << "Got here 1!!...\n\n";


  //csr_sparse G = slice_sparse(mat, doc_idx);
  csr_sparse G = mat;
  csr_sparse r = slice_sparse(mat, query_idx);
  cout << "shape of G:" << G.shape[0]<< " x " << G.shape[1] << "   size: " << G.size << " \n";
  cout << "shape of r:" << r.shape[0]<< " x " << r.shape[1] << "   size: " << r.size << " \n";
  cout << "Got here 1.5!!...\n\n";
  dense M = cdist(vec, r.indices, r.size);
  cout << "shape of M:" << M.shape[0]<< " x " << M.shape[1] << "   size: " << M.size << " \n";

  csr_sparse inv_r = invert(r);

  cout << "Got here 2!!...\n\n";

    
  csr_sparse v;
  v.shape = G.shape;
  v.size = G.size;
  v.data = (float*) calloc(v.size, sizeof(float));
  v.indptr = (unsigned int*) calloc((v.shape[0]+1), sizeof(unsigned int));
  v.indices = (unsigned int*) calloc(v.size, sizeof(unsigned int));

  cout << "Got here 3!!...\n\n";
      

  dense K;
  K.shape = M.shape;
  K.size = M.size;
  K.data = (float*) calloc(K.size, sizeof(float));
  for (int i=0; i< K.size; i++){
    K.data[i] = exp(-M.data[i]);
  }
  cout << "Got here 4!!...\n\n";

  dense x;
  x.shape = (unsigned int*) calloc(2, sizeof(unsigned int) );
  x.shape[0] = r.size;
  x.shape[1] = G.shape[1];
  x.size = r.size* G.shape[1];
  x.data = (float*) calloc(x.size, sizeof(float) );
  cout <<"r.size:"  << r.size << "\n";
  cout <<"r.size:"  << 1.0/r.size << "\n";
  for (int i=0; i<x.size; i++){
    x.data[i] = 1.0/r.size;
  }
  cout << "first 10 elements of x after initializing:\n";
  for (int i= 0 ; i< 10; i++){
    cout << x.data[i] << "\n" ;
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
  cout << "\n\nlength of Scores: " << scores.size << "\n";
  
  printf("\n\nstarting kernel\n");
  auto start = chrono::system_clock::now();
  _kernel_(M, G, K, KM, P, S, x, inv_x, u, inv_r, v, Z, scores, max_iter, 0, 1);
    
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

  printf("\nending kernel");
  auto end = std::chrono::system_clock::now();
  chrono::duration<float> elapsed_seconds = end-start;
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
  
  //delete M.data,G.data, G.indices, G.indptr, v.data, v.indices, v.indptr, inv_r.data, inv_r.indices, inv_r.indptr, K.data, KM.data, P.data, S.data, x.data, inv_x.data, u.data, Z.data, scores.data ;

  //delete M,G,v, KM, K, P,S,x, inv_x, inv_r, scores, u, Z;
}
