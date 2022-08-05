#!/bin/bash
#SBATCH --qos=regular
#SBATCH --nodes=16
#SBATCH --time=48:00:00
#SBATCH --licenses=cscratch1
#SBATCH --constraint=haswell
#CODE FOR NERSC SERVER!
#python configure.py --prob=chem_H2_MHD --chemistry=H2_MHD --cvode_path=/global/common/software/spackecp/e4s-21.02/software/cray-cnl7-haswell/intel-19.1.2.254/sundials-5.7.0-xnkalzuqkv6uacibofdcfidiulm3ztxw/ --lib_path=/global/common/software/spackecp/e4s-21.02/software/cray-cnl7-haswell/intel-19.1.2.254/sundials-5.7.0-xnkalzuqkv6uacibofdcfidiulm3ztxw/lib64 -b -fft -mpi -hdf5 --cxx cray


cd /global/cscratch1/sd/kyuen2/AthenaMP/B_3miG

module load cray-fftw
module load cray-hdf5-parallel
module load e4s/21.02
module load sundials/5.7.0-intel-19.1.2.254


srun -N 16 -n 512 --cpu_bind=cores /global/homes/k/kyuen2/Athena-chemistry-scalar-NERSC/bin/athena -r /global/cscratch1/sd/kyuen2/AthenaMP/B_3miG/H2_MHD.final.rst time/tlim=500
#########################################################################


salloc --nodes 64 --qos interactive --time 04:00:00 --constraint haswell
cd /global/cscratch1/sd/kyuen2/AthenaMP/B_3miG_R

module load cray-fftw
module load cray-hdf5-parallel
module load e4s/21.02
module load sundials/5.7.0-intel-19.1.2.254
#srun -N 64 -n 2048 --cpu_bind=cores /global/homes/k/kyuen2/Athena-chemistry-scalar-NERSC_R/bin/athena -r /global/cscratch1/sd/kyuen2/AthenaMP/B_3miG_R/H2_MHD.00007.rst 

#srun -N 16 -n 512 --cpu_bind=cores /global/homes/k/kyuen2/Athena-chemistry-scalar-NERSC_R/bin/athena -i /global/homes/k/kyuen2/Athena-chemistry-scalar-NERSC_R/B_3miG/athinput.H2MHD_R









############################################################################################################

salloc --nodes 61 --qos interactive --time 04:00:00 --constraint haswell

cd /global/cscratch1/sd/kyuen2/AthenaMP/B_1miG_1024

module load cray-fftw
module load cray-hdf5-parallel
module load e4s/21.02
module load sundials/5.7.0-intel-19.1.2.254


srun -N 61 -n 1944 --cpu_bind=cores /global/homes/k/kyuen2/Athena-chemistry-scalar-NERSC_R/bin/athena -i /global/homes/k/kyuen2/Athena-chemistry-scalar-NERSC_R/B_1miG_792/athinput.H2MHD_R
#14.2855










#############################################################################################################

salloc --nodes 2 --qos interactive --time 04:00:00 --constraint haswell


module load cray-fftw
module load cray-hdf5-parallel

srun -N 2 -n 64 --cpu_bind=cores /global/homes/k/kyuen2/athena-master-NERSC/bin/athena -i /global/homes/k/kyuen2/athena-master-NERSC/SubMsSubMa/Ms0_2Ma0_1/athinput.Ms0_2Ma0_1


#####################################################################
salloc --nodes 2 --qos interactive --time 04:00:00 --constraint haswell


module load cray-fftw
module load cray-hdf5-parallel
srun -N 2 -n 64 --cpu_bind=cores /global/homes/k/kyuen2/athena-master-NERSC/bin/athena -r /global/cscratch1/sd/kyuen2/Athena/Ms0_2Ma1_0/Ms0_1Ma0_3.final.rst
-i /global/homes/k/kyuen2/athena-master-NERSC/SubMsSubMa/Ms0_2Ma0_1R/athinput.Ms0_2Ma0_1







#######################################################################################
salloc --nodes 2 --qos interactive --time 04:00:00 --constraint haswell

cd /global/cscratch1/sd/kyuen2/Athena/Ms0_2Ma0_1/
module load cray-fftw
module load cray-hdf5-parallel
srun -N 2 -n 64 --cpu_bind=cores /global/homes/k/kyuen2/athena-master-NERSC/bin/athena -r /global/cscratch1/sd/kyuen2/Athena/Ms0_2Ma0_1/Ms0_1Ma0_3.00026.rst time/tlim=10000


#######################################################################################
salloc --nodes 2 --qos interactive --time 04:00:00 --constraint haswell
cd /global/cscratch1/sd/kyuen2/Athena/Ms0_2Ma0_1R/
module load cray-fftw
module load cray-hdf5-parallel
srun -N 2 -n 64 --cpu_bind=cores /global/homes/k/kyuen2/athena-master-NERSC/bin/athena -r /global/cscratch1/sd/kyuen2/Athena/Ms0_2Ma0_1R/Ms0_2Ma0_1R.final.rst 