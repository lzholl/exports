#!/bin/bash
#SBATCH -t 7-00:00:00
#SBATCH -J Tt_phylodb
#SBATCH --mail-user=lzfilliger@my.uri.edu
#SBATCH --mem=250G
#SBATCH --exclusive


cd /data3/jenkinslab/kgomes/blast/

module load BLAST+/2.9.0-iimpi-2019a

blastp -query /data3/jenkinslab/so_metatrans/Tt_files/Trinity_Tt_6-04-2019_119k.fasta.transdecoder.pep -db phylodb -evalue 0.00001  -out /data3/jenkinslab/so_metatrans/Tt_files/Tt_119k_assembly_phylodb_blastp.txt -outfmt 6
