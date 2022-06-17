#!/bin/bash
#SBATCH --job-name=cutadapt
#SBATCH --mem=120G
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --tasks-per-node=20
#SBATCH --time=48:00:00

echo “START”
date

module load cutadapt/2.8-GCCcore-8.3.0-Python-3.7.4

cd /data3/jenkinslab/lzholland/exports/raw/lane1

#cutadapt -j 20 -u 15 -U 15 -q 20 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
#	-o EXPORTS-S1_R1_cut.fastq -p EXPORTS-S1_R2_cut.fastq EXPORTS-S1_R1_001.fastq.gz EXPORTS-S1_R2_001.fastq.gz 

#cutadapt -j 20 -a "A{50}" -a "T{50}" -a "C{20}" -a "G{50}" -A "A{50}" -A "T{50}" -A "C{20}" -A "G{50}"  \
#       -o /data/jenkinslab/lzholland/exports/EXPORTS-S1_R1_cut2.fastq -p /data/jenkinslab/lzholland/exports/EXPORTS-S1_R2_cut2.fastq EXPORTS-S1_R1_cut.fastq EXPORTS-S1_R2_cut.fastq

cutadapt -j 20 --minimum-length=60 \
	-o /data/jenkinslab/lzholland/exports/EXPORTS-S1_R1_cut4.fastq /data/jenkinslab/lzholland/exports/EXPORTS-S1_R1_cut2.fastq

cutadapt -j 20 --minimum-length=60 \
        -o /data/jenkinslab/lzholland/exports/EXPORTS-S1_R2_cut4.fastq /data/jenkinslab/lzholland/exports/EXPORTS-S1_R2_cut2.fastq
 

echo “DONE”
date
