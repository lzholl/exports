#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --job-name=FastQC
#SBATCH --mem=120G
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --tasks-per-node=20
#SBATCH --time=48:00:00

echo “START”
date

module load FastQC/0.11.8-Java-1.8

cd /data/jenkinslab/lzholland/exports

fastqc -t 20 *rRNAfiltered.fastq.gz

echo “DONE”
date
