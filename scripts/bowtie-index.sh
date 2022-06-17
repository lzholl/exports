#!/bin/bash
#SBATCH --cpus-per-task=1
#SBATCH --job-name=bowtie2
#SBATCH --time=24:00:00
#SBATCH --mem=120G
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --tasks-per-node=1
#SBATCH -e bt2build.e
#SBATCH -o b2build.o

module load Bowtie2/2.2.9-foss-2016b

cd /data/jenkinslab/lzholland/exports 

bowtie2-build EXPORTS_LL1-5_1-27-21_assembly_clstrd98n10.fasta EXPORTS_LL1-5_bowtie2

