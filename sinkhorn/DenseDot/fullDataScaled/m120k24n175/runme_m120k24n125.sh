PDEC++ -m db  -t 1 main.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 1 -cc core_ooo -o m120k24n175/OneOoO
pythiarun . -n 1 -cc core_inorder -o m120k24n175/OneIO
PDEC++ -m db  -t 4 main.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 4 -cc core_inorder -o m120k24n175/4IO
PDEC++ -m db  -t 8 main.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 8 -cc core_inorder -o m120k24n175/8IO
PDEC++ -m di -t 4 main.cpp
./decades_decoupled_implicit/decades_decoupled_implicit  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -d -n 4 -cc core_inorder -o m120k24n175/8IO_Decoupled

PDEC++ -m db  -t 1 -a 1 main.cpp
./decades_base/decades_base  ../../../data/sparsemat.csv  ../../../data/densemat.csv
pythiarun . -n 1 -cc core_inorder -o m120k24n175/Acc
