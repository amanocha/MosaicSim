find -type f -name "graph_nodes.txt" -delete
find -type f -name "epochStats" -delete
find -type f -name "VE_out.txt" -delete
find -type f -name "SSSP_out.txt" -delete
find -type f -name "PR_out.txt" -delete
find -type d -name "decades_base" -prune -exec rm -rf {} \;
find -type d -name "decades_decoupled_implicit" -prune -exec rm -rf {} \;
find -type d -name "vtune" -prune -exec rm -rf {} \;
