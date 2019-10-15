PDEC++ -m db  -t 1 -a 1 main_wAcc.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 1 -cc core_inorder -o AccOneIO
pythiarun . -n 1 -cc core_ooo -o AccOneOoO

PDEC++ -m db  -t 4 -a 1 main_wAcc.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 4 -cc core_inorder -o Acc4IO

PDEC++ -m db  -t 8 -a 1 main_wAcc.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 8 -cc core_inorder -o Acc8IO

PDEC++ -m di  -t 4 -a 1 main_wAcc.cpp
./decades_decoupled_implicit/decades_decoupled_implicit  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -d -n 4 -cc core_inorder -o Acc8IO_Decoupled

