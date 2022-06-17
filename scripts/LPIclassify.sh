#!/bin/bash
#SBATCH -t 2-00:00:00
#SBATCH -J LPIclassify
#SBATCH --mail-user=lzfilliger@uri.edu
#SBATCH --cpus-per-task=20

cd /data/jenkinslab/lzholland/exports

module load LPIclassify/20170423-foss-2018b

LPIclassify -i EXPORTS_LL1-5_1-27-21_assembly_phylodb_3-9-21.txt -a 0.5 -d /data3/jenkinslab/so_metatrans/LPI_data.db
