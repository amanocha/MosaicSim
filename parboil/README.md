# Parboil Benchmarks Status:

[x] bfs -> DONE, could also use ASPLOS version

[?] cutcp -> DONE, questionable parallelization

[x] histo -> DONE, well parallelized

[o] lbm -> kernelized, incorrect parallelism, might need to downsize (mem trace is 2.8GB), difficult

[x] mri-gridding -> DONE

[x] mri-q -> DONE, very well parallelized

[o] sad -> kernelized, need to check if can be parallelized

[x] sgemm -> DONE

[x] spmv -> DONE

[x] stencil -> DONE

[ ] tpacf -> need to look into kernelization (has a mix of IO and compute)
