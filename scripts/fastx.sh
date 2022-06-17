#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -J FastQ-A
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu

echo "START"
date

module load fastx/0.0.14

cd /data3/jenkinslab/so_metatrans/Pa_files/

gunzip -d Pa_cent_BAdb_class_reads_3-17-2020.1.fq.gz 
fastq_to_fasta -n -v -i Pa_cent_BAdb_class_reads_3-17-2020.1.fq -o Pa_cent_BAdb_class_reads_3-17-2020.1.fa
#gunzip NBP1608-MetaT_cent_BAdb_class_reads_7-09-2018.1.fa
gunzip -d Pa_cent_BAdb_class_reads_3-17-2020.2.fq.gz 
fastq_to_fasta -n -v -i Pa_cent_BAdb_class_reads_3-17-2020.2.fq -o Pa_cent_BAdb_class_reads_3-17-2020.2.fa
#gunzip NBP1608-MetaT_cent_BAdb_class_reads_7-09-2018.2.fa 


echo "END"
date

