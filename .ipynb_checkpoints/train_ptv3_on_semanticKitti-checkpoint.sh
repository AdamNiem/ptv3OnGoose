#!/bin/bash

#SBATCH --job-name train_ptv3_on_semanticKitti
#SBATCH --nodes 1
#SBATCH --tasks-per-node 1
#SBATCH --cpus-per-task 16
#SBATCH --gpus-per-node a100:2
#SBATCH --mem 64gb
#SBATCH --time 30:00:00
  
source activate jun25_mamba_goosepptv3
cd ~/jun25_mamba_goosepptv3/Pointcept

wandb login	

sh scripts/train.sh -g 2 -d semantic_kitti -c semseg-pt-v2m2-0-base -n ptv3_semanticKitti_jul6