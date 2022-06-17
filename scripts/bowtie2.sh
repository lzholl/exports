#!/bin/bash
#SBATCH --job-name=bowtie2
#SBATCH --time=120:00:00
#SBATCH --exclusive
#SBATCH --mem=250GB
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH -c 20
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu
#SBATCH -e bowtie2_EXPORTS_LL1-5-map.e
#SBATCH -o bowtie2_EXPORTS_LL1-5-map.o

module load Bowtie2/2.2.9-foss-2016b

cd /data/jenkinslab/lzholland/exports

bowtie2 -x EXPORTS_LL1-5_bowtie2 -q -p 20 \
        -1 EXPORTS-LL1-5_S1-S27-S69_R1_trimmed_rRNAfiltered.fastq.gz -2 EXPORTS-LL1-5_S1-S27-S69_R2_trimmed_rRNAfiltered.fastq.gz \
        -S trinity_backmap_paired_to_EXPORTS_LL1-5.sam 1>b2_trinity_backmap_to_EXPORTS_LL1-5.log 2>b2_trinity_backmap_to_EXPORTS_LL1-5.err
