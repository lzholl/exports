#!/bin/bash
#SBATCH -t 2-00:00:00
#SBATCH -J salmon
#SBATCH --nodes=1
#SBATCH --mem=64GB
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu

module load R-bundle-Bioconductor/3.3-foss-2016b-R-3.3.1
module load Python/2.7.12-foss-2016b
module load Salmon/0.10.2-foss-2016b-Python-2.7.12 
module load SAMtools/1.3.1-foss-2016b
module load Trinity/2.8.4-foss-2016b

cd /data/jenkinslab/lzholland/exports

#run salmon to get counts
#/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/align_and_estimate_abundance.pl --seqType fq \
#--samples_file exports_S1_S27-28_S31_S55-58_S69-70_samples.txt --transcripts Trinity_EXPORTS_S1-4_S27-69-71_clstrd98n10.fasta \
#--est_method salmon --trinity_mode --prep_reference

#compile expression matrices
/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/abundance_estimates_to_matrix.pl --est_method salmon \
--out_prefix Trinity --name_sample_by_basedir \
--quant_files quant_files.list \
--gene_trans_map Trinity_EXPORTS_S1-4_S27-69-71_clstrd98n10.fasta.gene_trans_map

#filter for highest expressed isoform
#/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/filter_low_expr_transcripts.pl --matrix Trinity.isoform.TMM.EXPR.matrix \
#--transcripts EXPORTS_LL1-5_1-27-21_assembly_clstrd98n10.fasta --highest_iso_only --trinity_mode > EXPORTS_LL1-5_1-27-21_assembly_highestiso.fasta

#optional stats
#/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/misc/contig_ExN50_statistic.pl Trinity.isoform.TMM.EXPR.matrix \
#EXPORTS_LL1-5_1-27-21_assembly_clstrd98n10.fasta > EXPORTS_LL1-5_1-27-21_assembly_ExN50.stats

#/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/misc/plot_ExN50_statistic.Rscript EXPORTS_LL1-5_1-27-21_assembly_ExN50.stats \
#xpdf EXPORTS_LL1-5_1-27-21_assembly_ExN50.stats.plot.pdf

