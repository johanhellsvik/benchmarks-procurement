#!/bin/bash

#SBATCH -J my_gmx_job
#SBATCH -A pdc.staff
#SBATCH -p s11-tst
#SBATCH -t 1-00:00:00

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=32

ml PDCTEST/22.06
ml gromacs/2023-cpeGNU-22.06

export OMP_NUM_THREADS=1

echo "Script initiated at `date` on `hostname`"

srun -n 32 gmx_mpi mdrun -s topol.tpr

echo "Script finished at `date` on `hostname`"
