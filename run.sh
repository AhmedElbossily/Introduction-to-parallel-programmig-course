#!/bin/bash
#new
#PBS -N SPH_GPU
#PBS -q gpuGeneral
#PBS -l select=1:ncpus=1:ngpus=1:mem=10gb:host=node01-v100 
#PBS  -o /home/ghada/SPH_GPU/C-out.txt
#PBS  -e /home/ghada/SPH_GPU/C-error.txt


export PATH="/cm/shared/apps/gcc9/9.3.0/bin/:$PATH}" 
export PATH="/usr/include/glm/:$PATH}" 
export PATH="/cm/local/apps/cmake-gcc9/3.21.3/bin/:$PATH}"
export PATH="/cm/shared/apps/opencv4-py37-cuda11.2-gcc8/4.5.4/bin/:$PATH}"


module load shared

module load openblas/dynamic/0.3.7 
module load hdf5_18/1.8.21 gcc8/8.4.0 
module load python37 
module load cudnn8.1-cuda11.2/8.1.1.33 
module load ml-pythondeps-py37-cuda11.2-gcc8/4.7.8
module load opencv4-py37-cuda11.2-gcc8/4.5.4


module load gcc9/9.3.0
module load cmake-gcc9/3.21.3  
module load cuda11.2/toolkit/11.2.2
module load cuda11.2/blas/11.2.2
module load cuda11.2/fft/11.2.2




rm -rf build
mkdir build
cd build 
cmake ..
make
qsub ./HW1


