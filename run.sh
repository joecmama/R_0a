#!/bin/bash
#SBATCH -p debug
#SBATCH -n 1
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=2000
#SBATCH -t 1:00:00
#SBATCH -J r_test
#SBATCH -e test.err
#SBATCH -o test.out
#
cd $SLURM_SUBMIT_DIR
echo "working directory = "$SLURM_SUBMIT_DIR
#
module load r
echo start at `date`
R CMD BATCH hello.r hello.out
echo end at `date`

