#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -J cd-hit-est
#SBATCH --mem=128GB
#SBATCH --nodes=1
#SBATCH -c 20
#SBATCH --partition=general
#SBATCH --tasks-per-node=1
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu

echo "START"
date

module load CD-HIT/4.6.8-foss-2016b

cd /data/jenkinslab/lzholland/exports

cd-hit-est -i Trinity_S1-4_S27-69-71_combined_assemblies.fasta -o Trinity_EXPORTS_S1-4_S27-69-71_clstrd98n10.fasta -c 0.98 -n 10 -p 1 -g 1 -M 120000 -T 20 -d 40 1>Trinity_cd-hit-est_09-28-21_0.98_n10.log

echo "END"
date
