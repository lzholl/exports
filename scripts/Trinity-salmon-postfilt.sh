#!/bin/bash
#SBATCH -t 7-00:00:00
#SBATCH -J salmon
#SBATCH --nodes=1
#SBATCH --mem=120GB
#SBATCH --ntasks-per-node=20
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

module load R-bundle-Bioconductor/3.3-foss-2016b-R-3.3.1
module load Python/2.7.12-foss-2016b
module load Salmon/0.10.2-foss-2016b-Python-2.7.12 
module load SAMtools/1.3.1-foss-2016b
module load Trinity/2.4.0-foss-2016b

cd /data3/jenkinslab/so_metatrans/Pa_files

#/opt/software/Trinity/2.4.0-foss-2016b/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl \
#--transcripts Trinity_Pa_95k_minexp1.fasta \
#--est_method salmon --trinity_mode --prep_reference -output_dir Pa_95k_minexp1_salmon

#/opt/software/Trinity/2.4.0-foss-2016b/trinityrnaseq-Trinity-v2.4.0/util/align_and_estimate_abundance.pl --seqType fq \
#--samples_file Pa_sample_file2.txt --transcripts Trinity_Pa_95k_minexp1.fasta \
#--est_method salmon --trinity_mode --prep_reference 

#/opt/software/Trinity/2.4.0-foss-2016b/trinityrnaseq-Trinity-v2.4.0/util/abundance_estimates_to_matrix.pl --est_method salmon \
#--out_prefix Trinity --name_sample_by_basedir \
#--quant_files quant_files_postfilt.list \
#--gene_trans_map Trinity_Pa_95k_minexp1.fasta.gene_trans_map

#/opt/software/Trinity/2.4.0-foss-2016b/trinityrnaseq-Trinity-v2.4.0/util/misc/contig_ExN50_statistic.pl Trinity.TMM.EXPR.matrix \
#Trinity_Pa_95k_minexp1.fasta > Trinity_Pa_95k_minexp1_ExN50.stats

/opt/software/Trinity/2.4.0-foss-2016b/trinityrnaseq-Trinity-v2.4.0/util/misc/plot_ExN50_statistic.Rscript Trinity_Pa_95k_minexp1_ExN50.stats \
xpdf Trinity_Pa_95k_minexp1_ExN50.stats.plot.pdf

