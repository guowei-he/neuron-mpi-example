#!/bin/bash
# Set number of tasks to run
#SBATCH --ntasks=8
# Set number of cores per task (default is 1)
#SBATCH --cpus-per-task=1
# Walltime format hh:mm:ss
#SBATCH --time=00:30:00
# Output and error files
#SBATCH -o job.%J.out
#SBATCH -e job.%J.err

# **** Put all #SBATCH directives above this line! ****
# **** Otherwise they will not be in effective! ****
#
# **** Actual commands start here ****
# Load modules here (safety measure)
module purge
module load anaconda
module load gcc openmpi

source activate <neuron-env>

mpiexec -n 3 python parrun.py
