#!/bin/bash
#SBATCH --qos=premium
#SBATCH --account=m2407
#SBATCH --nodes=512
#SBATCH --time=24:00:00
#SBATCH --licenses=cscratch1
#SBATCH --constraint=haswell

module load cray-fftw
module load cray-hdf5-parallel

cd /global/cscratch1/sd/kyuen2/AthenaMP/B_3miG_R/
srun -N 512 -n 16384 --cpu_bind=cores /global/homes/k/kyuen2/athena-chemistry_scalar/bin/athena -i /global/homes/k/kyuen2/athena-chemistry_scalar/B_1miG_1024/athinput.H2MHD_R
