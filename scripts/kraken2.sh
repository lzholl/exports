#!/bin/bash
#SBATCH -t 24:00:00
#SBATCH -J kraken2
#SBATCH --mem=246G
#SBATCH -c 32
#SBATCH --mail-type=ALL
#SBATCH --mail-user=lzfilliger@uri.edu

module load kraken/2.1.2
module load gcc/8.3
module load blast/2.9.0+

cd /users/lhollan5/data/lhollan5/

#kraken2-build --standard --threads 32 --db kraken2_standard_db
#missing viral sequences in NCBI causes an error for the above command

#wget https://genome-idx.s3.amazonaws.com/kraken/k2_standard_20210517.tar.gz
#tar -xvzf k2_standard_20210517.tar.gz
#downloaded pre-built standard database

#kraken2-build --download-taxonomy --skip-maps --db k2_fungi_db
#kraken2-build --download-library fungi --db k2_fungi_db
#kraken2-build --build --db k2_fungi_db

#kraken2-build --download-taxonomy --skip-maps --db k2_protozoa_db
#kraken2-build --download-library protozoa --db k2_protozoa_db
#kraken2-build --build --db k2_protozoa_db

kraken2 --db k2_standard_db --threads 32 --paired --confidence 0.5 \
	--classified-out EXPORTS-S71_cseqs#.fa --unclassified-out EXPORTS-S71_ucseqs#.fa \
	--report EXPORTS-S71_k2_report.txt \
	EXPORTS-S71_R1_all_trimmed_rRNAfiltered.fasta EXPORTS-S71_R2_all_trimmed_rRNAfiltered.fasta

#kraken2 --db k2_fungi_db --threads 32 --paired --confidence 0.5 \
#	--classified-out EXPORTS-S1_fungi_cseqs#.fa --unclassified-out EXPORTS-S1_final_ucseqs#.fa \
#	--report EXPORTS-S1_k2_fungi_report.txt \
#	EXPORTS-S1_ucseqs_1.fa EXPORTS-S1_ucseqs_2.fa

#kraken2 --db k2_protozoa_db --threads 32 --paired --confidence 0.5 \
#	--classified-out EXPORTS-S1_protozoa_cseqs#.fa --unclassified-out EXPORTS-S1_final2_ucseqs#.fa \
#	--report EXPORTS-S1_k2_protozoa_report.txt \
#	EXPORTS-S1_final_ucseqs_1.fa EXPORTS-S1_final_ucseqs_2.fa
