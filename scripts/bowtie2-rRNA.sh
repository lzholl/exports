#!/bin/bash
#SBATCH --cpus-per-task=20
#SBATCH --job-name=bowtie2
#SBATCH --time=7-00:00:00
#SBATCH --mem=120G
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --tasks-per-node=1
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu
#SBATCH -e bowtie2-rRNA-map-Tt-3-17-2020.e
#SBATCH -o bowtie2-rRNA-map-Tt-3-17-2020.o

module load Bowtie2/2.2.9-foss-2016b

cd /data3/jenkinslab/so_metatrans/Tt_files/Tt_trimmed_paired 

#bowtie2-build silva132_99.fna SILVA132_bowtie

bowtie2 --very-sensitive-local -x ../../bowtie2_indices/SILVA132_bowtie -1 Tt_left.fastq -2 Tt_right.fastq --threads 20 --met-file bowtie2_rRNAremoval_summary_Tt_3-17-2020 --al-conc-gz b2_pairsmap_to_SILVA132_Tt_3-17-2020 --un-conc-gz b2_pairsnotmap_to_SILVA132_Tt_3-17-2020 --al-gz b2_singlesmap_to_SILVA132_Tt_3-17-2020 --un-gz b2_singlesnotmap_to_SILVA132_Tt_3-17-2020
