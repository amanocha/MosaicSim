# Parboil Benchmarks Status:

[x] bfs -> DONE, could also use ASPLOS version

[?] cutcp -> DONE, questionable parallelization

[x] histo -> DONE, well parallelized

[o] lbm -> kernelized, incorrect parallelism, might need to downsize (mem trace is 2.8GB), difficult

[?] mri-gridding -> DONE, need to check parallelism

[x] mri-q -> DONE, very well parallelized

[x] sad -> kernelized, but cannot be parallelized

[ ] sgemm -> need to look into compilation TYLER said he was looking into it

[ ] spmv

[?] stencil -> DONE, questionable parallelization

[ ] tpacf -> need to look into kernelization (has a mix of IO and compute)