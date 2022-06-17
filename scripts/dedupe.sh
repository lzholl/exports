#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH -J bbtools
#SBATCH --mem=246G
#SBATCH -c 32
#SBATCH --nodes=1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lzfilliger@uri.edu

module load bbmap/38.23

cd /users/lhollan5/data/lhollan5/

dedupe.sh -Xmx200g threads=32 in1=EXPORTS-S71_ucseqs_1.fa in2=EXPORTS-S71_ucseqs_2.fa out=EXPORTS-S71_deduped.fa ac=f

reformat.sh -Xmx200g threads=32 in=EXPORTS-S71_deduped.fa out1=EXPORTS-S71_dedupe_1.fa out2=EXPORTS-S71_dedupe_2.fa

rm EXPORTS-S71_deduped.fa
