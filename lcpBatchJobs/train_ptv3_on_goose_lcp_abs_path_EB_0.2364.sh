#!/bin/bash

#SBATCH --job-name train_ptv3_on_goose_lcp_abs_path_EB_0.2364
#SBATCH --nodes 1
#SBATCH --tasks-per-node 1
#SBATCH --cpus-per-task 16
#SBATCH --gpus-per-node a100:2
#SBATCH --mem 64gb
#SBATCH --time 30:00:00
  
source activate jun25_mamba_goosepptv3
cd ~/jun25_mamba_goosepptv3/Pointcept
COMPRESSOR="lcp"
Q_lvl="EB_0.2364"

wandb login	

sh scripts/train.sh -g 2 -d goose -c semseg-pt-v3m1-0-baseGooseOGModified-AbsPath-${COMPRESSOR}-${Q_lvl} -n pptv3_goose_${COMPRESSOR}_${Q_lvl}_jul8 -r true