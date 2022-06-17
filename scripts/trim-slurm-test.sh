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

java -jar $EBROOTTRIMMOMATIC/trimmomatic-0.36.jar PE -phred33 -threads 16 \
	-basein EXPORTS-S1_R1_001.fastq.gz -baseout /data/jenkinslab/lzholland/exports/EXPORTS-S1-trim4.fastq \
	ILLUMINACLIP:../../TruSeq3-PE-2.fa:2:30:10

echo “DONE”
date
