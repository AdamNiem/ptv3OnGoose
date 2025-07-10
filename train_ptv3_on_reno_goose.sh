#!/bin/bash

#SBATCH --job-name train_ptv3_on_reno_Q64_goose
#SBATCH --nodes 1
#SBATCH --tasks-per-node 1
#SBATCH --cpus-per-task 16
#SBATCH --gpus-per-node a100:2
#SBATCH --mem 64gb
#SBATCH --time 30:00:00
  
cd ~/jun25_mamba_goosepptv3/Pointcept/data
source activate jun25_mamba_goosepptv3
unlink goose
COMPRESSOR="reno"
Q_lvl="Q_64"
ln -s /scratch/aniemcz/goose-pointcept-decomp-bin/${COMPRESSOR}/${Q_lvl} goose

cd ~/jun25_mamba_goosepptv3/Pointcept

wandb login	

sh scripts/train.sh -g 2 -d goose -c semseg-pt-v3m1-0-baseGooseOGModified -n pptv3_goose_${COMPRESSOR}_${Q_lvl}_jul8