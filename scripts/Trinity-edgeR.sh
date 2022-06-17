#!/bin/bash
#SBATCH -t 1-00:00:00
#SBATCH -J edgeR
#SBATCH --nodes=1
#SBATCH --mem=120GB
#SBATCH --ntasks-per-node=20
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

module load R-bundle-Bioconductor/3.10-foss-2019b
module load Trinity/2.12.0-foss-2019b-Python-3.7.4

cd /data/jenkinslab/lzholland/exports/edgeR_LL10-20_7assembly

#/opt/software/Trinity/2.12.0-foss-2019b-Python-3.7.4/trinityrnaseq-v2.12.0/Analysis/DifferentialExpression/run_DE_analysis.pl \
#--matrix LL65_7assembly_salmon/Trinity.isoform.counts.matrix \
#--samples_file exports_LL65_samples_DE.txt \
#--method edgeR --dispersion 0.1 \
#--output edgeR_LL65_7assembly


/opt/software/Trinity/2.12.0-foss-2019b-Python-3.7.4/trinityrnaseq-v2.12.0/Analysis/DifferentialExpression/analyze_diff_expr.pl \
--matrix ../LL10-20_7assembly_salmon/Trinity.isoform.TMM.EXPR.matrix \
--samples ../exports_LL10-20_samples_DE.txt \
-P 1e-5 -C 3

#/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/Analysis/DifferentialExpression/rename_matrix_feature_identifiers.pl \
#  no_Pa_388/Trinity.isoform.TMM.EXPR.matrix Trinotate_xls_annotate_ids  > Trinity.isoform.TMM.EXPR.annotated.matrix
