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

cd /data/jenkinslab/lzholland/exports

for sample in $(cat /data3/jenkinslab/lzholland/exports/raw/lane1/samples);
do
  	echo "On sample: ${sample}";

#cutadapt -j 20 -u 15 -U 15 -q 20 -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCA -A AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGT \
#	-o ${sample}_R1_trim.fastq -p ${sample}_R2_trim.fastq \
#	/data3/jenkinslab/lzholland/exports/raw/lane2/${sample}_R1.fastq.gz /data3/jenkinslab/lzholland/exports/raw/lane2/${sample}_R2.fastq.gz 

#cutadapt -j 20 -a "A{50}" -a "T{50}" -a "C{20}" -a "G{50}" -A "A{50}" -A "T{50}" -A "C{20}" -A "G{50}"  \
#       -o ${sample}_R1_trim2.fastq -p ${sample}_R2_trim2.fastq ${sample}_R1_trim.fastq ${sample}_R2_trim.fastq

cutadapt -j 20 --minimum-length=60 -o ${sample}_R1_trimmed.fastq.gz -p ${sample}_R2_trimmed.fastq.gz ${sample}_R1_trim2.fastq ${sample}_R2_trim2.fastq \
	--too-short-o ${sample}_R1_trimmed_short.fastq.gz --too-short-p ${sample}_R2_trimmed_short.fastq.gz;

#rm *_trim.fastq
#rm *_trim2.fastq;

done
 

echo “DONE”
date
