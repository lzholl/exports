#!/bin/bash
#SBATCH -t 48:00:00
#SBATCH -J samtools
#SBATCH --mem=20GB
#SBATCH --nodes=1 --ntasks-per-node=1
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

echo "START"
date

module load SAMtools/1.5-foss-2017a

cd /data3/jenkinslab/so_metatrans/Pa_files

#samtools view -bS trinity_backmap_paired.sam > trinity_backmap_paired_psegenome_3-28.bam && rm trinity_backmap_paired.sam
samtools flagstat trinity_backmap_paired_psegenome_3-28.bam > trinity_backmap_paired_psegenome_3-28_flagstat.txt

echo "END"
date
