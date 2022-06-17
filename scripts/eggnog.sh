#!/bin/bash
#SBATCH -t 2-00:00:00
#SBATCH -J eggnog
#SBATCH --mail-user=lzfilliger@my.uri.edu
#SBATCH --cpus-per-task=20

cd /data3/jenkinslab/so_metatrans/Tt_files/

module load eggnog-mapper/2.0.0-foss-2018b-Python-2.7.15

python /opt/software/eggnog-mapper/2.0.0-foss-2018b-Python-2.7.15/bin/emapper.py -i Trinity_Tt_BAreads_assembly_3-25-2020.fasta.transdecoder.pep \
	--output Tt_BA_assembly_3-25-2020_EGannots -m diamond
