#!/bin/bash
#SBATCH --cpus-per-task=20
#SBATCH --job-name=transdecoder
#SBATCH --time=48:00:00
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --exclusive
#SBATCH --mem=250GB
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu
#SBATCH -e transdecoder_9-28-21_7assemblies.e
#SBATCH -o transdecoder_9-28-21_7assemblies.o

module load HMMER/3.1b2-foss-2016b
module load BLAST+/2.7.1-foss-2018a
module load TransDecoder/3.0.1-foss-2016b

cd /data/jenkinslab/lzholland/exports

TransDecoder.LongOrfs -t Trinity_EXPORTS_S1-4_S27-69-71_clstrd98n10.fasta

#blastp -query Trinity_Pa_7-11-2018_95k.fasta.transdecoder_dir/longest_orfs.pep  \
#    -db ref_pepdb_4gen17trans.faa  -max_target_seqs 1 \
#    -outfmt 6 -evalue 1e-5 -num_threads 10 > blastp.refpepdb.outfmt6

#hmmscan --cpu 8 --domtblout trinotatepfam.out \
#	Pfam-A.hmm \
#	Trinity_Pa_7-11-2018_95k.fasta.transdecoder_dir/longest_orfs.pep
		
TransDecoder.Predict -t Trinity_EXPORTS_S1-4_S27-69-71_clstrd98n10.fasta

# --retain_pfam_hits trinotatepfam.out --retain_blastp_hits blastp.sprot.refpepdb.outfmt6
