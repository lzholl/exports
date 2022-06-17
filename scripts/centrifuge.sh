#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH -J centrifuge
#SBATCH --mem=250GB
#SBATCH --exclusive
#SBATCH -c 20
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

echo "START"
date

module load centrifuge/1.0.3-foss-2017a

cd /data3/jenkinslab/so_metatrans/Pa_files

#centrifuge -x p_compressed -1 Pa_trimmed_paired/Pa_left_rRNAfiltered.fq.gz -2 Pa_trimmed_paired/Pa_right_rRNAfiltered.fq.gz -S Pa_centrifuge_BAdb_results_3-17-2020.txt --report-file Pa_centrifuge_BAdb_report_3-17-2020.txt --un-conc-gz Pa_cent_BAdb_unclass_reads_3-17-2020 --un-gz Pa_cent_BAdb_unclass_reads_unpaired_3-17-2020 --al-conc-gz Pa_cent_BAdb_class_reads_3-17-2020 --al-gz Pa_cent_BAdb_class_reads_unpaired_3-17-2020
centrifuge -x nt --exclude-taxids 2,2157,12908,33208,33634,61964 -1 Pa_cent_BAdb_unclass_reads_3-17-2020.1.fq.gz -2 Pa_cent_BAdb_unclass_reads_3-17-2020.2.fq.gz -S Pa_centrifuge_postBAdb_ntdb_results_3-18-2020.txt --report-file Pa_centrifuge_postBAdb_ntdb_report_3-18-2020.txt --un-conc-gz Pa_cent_postBAdb_ntdb_unclass_reads_3-18-2020 --un-gz Pa_cent_postBAdb_ntdb_unclass_reads_unpaired_3-18-2020 --al-conc-gz Pa_cent_postBAdb_ntdb_class_reads_3-18-2020 --al-gz Pa_cent_postBAdb_ntdb_class_reads_unpaired_3-18-2020
#centrifuge -x nt --host-taxids 33634 -f ./Trinity_Pa_7-6-2018_postcent_clustr98n10_transrate/Trinity_Pa_7-11-2018_95k.fasta -S Pa_assembly_centrifuge_ntdb_results_7-11-2018.txt --report-file Pa_assembly_centrifuge_ntdb_report_7-11-2018.txt --un-gz Pa_assembly_ntdb_unclass_transcripts_7-11-2018 --al-gz Pa_assembly_ntdb_class_transcripts_7-11-2018
#centrifuge-kreport -x nt Pa_assembly_centrifuge_ntdb_results_7-11-2018.txt

echo "END"
date
