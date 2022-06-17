#!/bin/bash
#SBATCH --cpus-per-task=20
#SBATCH --job-name=blastp
#SBATCH --time=3-00:00:00
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu

module load HMMER/3.1b2-foss-2016b
module load BLAST+/2.7.1-foss-2018a
module load TransDecoder/5.5.0-foss-2019a
module load Trinotate/3.0.2

cd /data3/jenkinslab/so_metatrans/Tt_files/

#/opt/software/Trinotate/3.0.2/admin/Build_Trinotate_Boilerplate_SQLite_db.pl Trinotate

#makeblastdb -in uniprot_sprot.pep -dbtype prot
#gunzip Pfam-A.hmm.gz
#hmmpress Pfam-A.hmm

#TransDecoder.LongOrfs -t Tt_4-1-20_assembly_71k_highestiso.fasta

#blastx -query Tt_4-1-20_assembly_71k_highestiso.fasta \
#	-db refpepdb_5gen17trans_pse.faa -max_target_seqs 1 \
#	-outfmt 6 -evalue 1e-5 -num_threads 20 > blastx.refpepdb_4-1-20.outfmt6

#blastx -query Tt_4-1-20_assembly_71k_highestiso.fasta \
#	-db uniprot_sprot.pep -max_target_seqs 1 \
#	-outfmt 6 -evalue 1e-5 -num_threads 20 > blastx.sprot.outfmt6

#blastp -query Tt_4-1-20_assembly_71k_highestiso.fasta.transdecoder_dir/longest_orfs.pep  \
#	-db ref_pepdb_5gen17trans_thals.faa  -max_target_seqs 1 \
#	-outfmt 6 -evalue 1e-5 -num_threads 20 > blastp.refpep_4-1-20.outfmt6	

#blastp -query Tt_4-1-20_assembly_71k_highestiso.fasta.transdecoder_dir/longest_orfs.pep  \
#    -db uniprot_sprot.pep  -max_target_seqs 1 \
#    -outfmt 6 -evalue 1e-5 -num_threads 20 > blastp.sprot_4-1-20.outfmt6

#blastp -query Trinity_Tt_119k_assembly_highestiso.fa.transdecoder_dir/longest_orfs.pep  \
#    -db ../../uniprot_sprot.pep  -max_target_seqs 1 \
#    -outfmt 6 -evalue 1e-5 -num_threads 20 > blastp.sprot.outfmt6

#hmmscan --cpu 40 --domtblout pfam_4-1-20.out \
#	Pfam-A.hmm \
#	Pa_4-1-20_assembly_33k_highestiso.fasta.transdecoder_dir/longest_orfs.pep
		
TransDecoder.Predict -t Tt_4-1-20_assembly_71k_highestiso.fasta --single_best_only --retain_pfam_hits pfam_4-1-20.out --retain_blastp_hits blastp.sprotrefpephits.outfmt6

#tmhmm --short < NBP1608-MetaT_BAreads_assembly_8-12-2019.fasta.transdecoder.pep > NBP1608-MetaT_BAassembly_tmhmm.out

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite init \
#	--gene_trans_map Trinity.fasta.gene_trans_map \
#	--transcript_fasta NBP1608-MetaT_BAreads_assembly_8-12-2019.fasta \
#	--transdecoder_pep NBP1608-MetaT_BAreads_assembly_8-12-2019.fasta.transdecoder.pep

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite \
#	LOAD_swissprot_blastp blastp.sprot.outfmt6

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite \
#        LOAD_swissprot_blastx blastx.sprot.outfmt6

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite \
#        LOAD_custom_blast --outfmt6 blastp.refpepdb.outfmt6 --prog blastp --dbtype refpepdb

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite \
#        LOAD_custom_blast --outfmt6 blastx.refpepdb.outfmt6 --prog blastx --dbtype refpepdb

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite \
#        LOAD_pfam trinotatepfam.out

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite \
#	LOAD_tmhmm NBP1608-MetaT_BAassembly_tmhmm.out

#/opt/software/Trinotate/3.0.2/Trinotate Trinotate.sqlite report > Trinotate.xls

#/opt/software/Trinotate/3.0.2/util/annotation_importer/import_transcript_names.pl Trinotate.sqlite Trinotate.xls

#/opt/software/Trinotate/3.0.2/util/transcript_expression/import_expression_and_DE_results.pl \
#    --sqlite Trinotate.sqlite \
#    --transcript_mode \
#    --samples_file Tt_sample_file.txt \
#    --count_matrix Trinity.isoform.counts.matrix \
#	--fpkm_matrix Trinity.isoform.TMM.EXPR.matrix

#/opt/software/Trinotate/3.0.2/util/transcript_expression/import_transcript_clusters.pl \
#    --sqlite Trinotate.sqlite \
#    --group_name DE_all_vs_all \
#    --analysis_name diffExpr.P1e-3_C1_clusters_fixed_P_40 \
#    edgeR.73202.dir/diffExpr.P1e-3_C1.matrix.RData.clusters_fixed_P_40/*matrix

#/opt/software/Trinotate/3.0.2/util/transcript_expression/import_expression_and_DE_results.pl \
#    --sqlite Trinotate.sqlite \
#    --gene_mode \
#    --samples_file Tt_sample_file.txt \
#    --count_matrix Trinity.gene.counts.matrix \
#	--fpkm_matrix Trinity.gene.TMM.EXPR.matrix
	
#/opt/software/Trinotate/3.0.2/util/transcript_expression/import_expression_and_DE_results.pl \
#    --sqlite Trinotate.sqlite \
#    --gene_mode \
#    --samples_file Tt_sample_file.txt \
#    --DE_dir edgeR.73611.dir

#/opt/software/Trinotate/3.0.2/util/extract_GO_assignments_from_Trinotate_xls.pl --Trinotate_xls Trinotate.xls -G  --include_ancestral_terms > Trinotate_GO_assignments.txt

#/opt/software/Trinotate/3.0.2/util/Trinotate_get_feature_name_encoding_attributes.pl Trinotate.xls > Trinotate_xls_annotate_ids
