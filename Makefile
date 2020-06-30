export PATH := /usr/local/cuda-9.0/bin:$(PATH)
export CUDA_HOME=/usr/local/cuda-9.0
#export PATH="/usr/local/cuda-9.0/bin:$PATH"
export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/usr/local/cuda-9.0/lib64"
export LIBRARY_PATH="$LIBRARY_PATH:/usr/local/cuda-9.0/lib64"
all: draw_rectangles box_intersections 

draw_rectangles:
	cd lib/draw_rectangles; python setup.py build_ext --inplace
box_intersections:
	cd lib/fpn/box_intersections_cpu; python setup.py build_ext --inplace
