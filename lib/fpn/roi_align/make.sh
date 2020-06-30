#!/usr/bin/env bash
cuda_path=/usr/local/cuda/

cd lib/fpn/roi_align/src/cuda
echo "Compiling stnn kernels by nvcc..."
nvcc -c -o roi_align.cu.o roi_align_kernel.cu -x cu -Xcompiler -fPIC -arch=sm_37

cd ../../
python build.py