#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH -J bowtie2-index
#SBATCH --mem=120G
#SBATCH --nodes=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lzfilliger@uri.edu

module load bowtie2/2.3.5.1

cd /users/lhollan5/data/lhollan5/

bowtie2-build EXPORTS_LL1-5_1-27-21_assembly_clstrd98n10.fasta EXPORTS_LL1-5_bowtie2
