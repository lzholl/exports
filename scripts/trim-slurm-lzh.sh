#!/bin/bash
#SBATCH --job-name=Trimmomatic
#SBATCH --mem=120G
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --tasks-per-node=1
#SBATCH --time=48:00:00

echo “START”
date

module load Trimmomatic/0.36-Java-1.8.0_92

cd /data3/jenkinslab/lzholland/exports/raw/lane1

for sample in $(cat samples);
do
	echo "On sample: ${sample}";

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.36.jar PE -phred33 -threads 16 \
	-basein ${sample}_R1_001.fastq.gz -baseout /data/jenkinslab/lzholland/exports/${sample}-trim.fastq \
	ILLUMINACLIP:../../TruSeq3-PE-2.fa:2:30:10 HEADCROP:15 SLIDINGWINDOW:3:20 MINLEN:60;

done

echo “DONE”
date
