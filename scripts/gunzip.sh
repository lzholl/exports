#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -J gzip
#SBATCH --mem=64GB
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

echo "START"
date

cd /data3/jenkinslab/so_metatrans/Pa_files/

gzip *.fq
gzip *.fastq
gzip *.fa
gzip *.fasta




echo "END"
date
