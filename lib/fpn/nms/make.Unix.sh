#!/usr/bin/env bash
cuda_path=/usr/local/cuda/

cd lib/fpn/nms/src/cuda
echo "Compiling stnn kernels by nvcc..."
nvcc -c -o nms.cu.o nms_kernel.cu -x cu -Xcompiler -fPIC -arch=sm_37

cd ../../
python build.py