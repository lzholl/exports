#!/bin/bash
#SBATCH -t 7-00:00:00
#SBATCH -J kraken
#SBATCH --mem=120GB
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

echo "START"
date

module load Kraken/1.1-foss-2016b-Perl-5.24.0

cd /data3/jenkinslab/so_metatrans/Tt_files/

#kraken --preload --db /data3/shared/kraken --gzip-compressed --fastq-input --out-fmt paired --classified-out Tt_class_reads_stddb --unclassified-out Tt_unclass_reads_stddb --paired Tt_left_trimmed_rRNAfiltered.fq.gz Tt_right_trimmed_rRNAfiltered.fq.gz
kraken-report --db /data3/shared/kraken Tt_kraken_output_6-14-2018 > Tt_kraken_output_6-14-2018_report  

echo "END"
date
