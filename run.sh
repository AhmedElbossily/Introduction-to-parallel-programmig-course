#!/bin/bash
#new
#PBS -N SPH_GPU
#PBS -q gpuGeneral
#PBS -l select=1:ncpus=1:ngpus=1:mem=10gb:host=node01-v100 
#PBS  -o /home/ghada/SPH_GPU/C-out.txt
#PBS  -e /home/ghada/SPH_GPU/C-error.txt

module load shared
module load gcc9/9.3.0
module load cmake-gcc9/3.21.3  
module load cuda11.2/toolkit/11.2.2
module load cuda11.2/blas/11.2.2
module load cuda11.2/fft/11.2.2
#export PATH="/cm/local/apps/cmake-gcc9/3.21.3/bin/:$PATH}"

#cd $PBS_O_WORKDIR

#cd /home/ghada/SPH_GPU/build/
#./Mfree

rm -rf build
mkdir build
cd build 
cmake ..
make
qsub ./HW1


