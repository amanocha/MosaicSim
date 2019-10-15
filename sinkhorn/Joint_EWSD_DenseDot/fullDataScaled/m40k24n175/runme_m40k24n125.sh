PDEC++ -m db  -t 1 main_noAcc.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 1 -cc core_ooo -o OneOoO
pythiarun . -n 1 -cc core_inorder -o OneIO
PDEC++ -m db  -t 4 main_noAcc.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 4 -cc core_inorder -o 4IO
PDEC++ -m db  -t 8 main_noAcc.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 8 -cc core_inorder -o 8IO
PDEC++ -m di -t 4 main_noAcc.cpp
./decades_decoupled_implicit/decades_decoupled_implicit  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -d -n 4 -cc core_inorder -o 8IO_Decoupled

PDEC++ -m db  -t 1 -a 1 main_wAcc.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 1 -cc core_inorder -o Acc
