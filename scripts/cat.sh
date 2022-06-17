#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH -J quant
#SBATCH --mem=20GB
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu

echo "START"
date

cd /data/jenkinslab/lzholland/exports

#cat Dino_MMETSP_transcriptomes/*.pep.fa Ciliate_MMETSP_transcriptomes/*.pep.fasta > Dino_Ciliate_MMETSP_transcriptomes.pep.fa
find E-S4 E-S31 E-S58 E-S71 -name 'quant.sf' | tee quant_files.list

echo "END"
date
