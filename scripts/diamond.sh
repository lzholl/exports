#!/bin/bash
#SBATCH -t 3-00:00:00
#SBATCH -J diamond
#SBATCH --nodes=1
#SBATCH --mem=250GB
#SBATCH --exclusive
#SBATCH --mail-user=lzfilliger@uri.edu
#SBATCH --cpus-per-task=20

#cd /data3/jenkinslab/kgomes/so_plastid/
cd /data/jenkinslab/lzholland/exports

#module load DIAMOND/0.8.35-foss-2016b
module load DIAMOND/2.0.0-GCC-8.3.0

#diamond makedb --in Dino_Ciliate_MMETSP_transcriptomes.pep.fa --db dino_ciliates_mmetsp_pep_db
#diamond blastp --more-sensitive -d phylodb_diamond_database -q /data/jenkinslab/lzholland/exports/EXPORTS_LL1-5_1-27-21_assembly_clstrd98n10.fasta.transdecoder.pep -o /data/jenkinslab/lzholland/exports/EXPORTS_LL1-5_1-27-21_assembly_phylodb_3-9-21.txt
diamond blastp -d dino_ciliates_mmetsp_pep_db -e 0.00001 -k 0 -q Trinity_EXPORTS_S1-4_S27-69-71_clstrd98n10.fasta.transdecoder.pep -o EXPORTS_7assemblies_dinos_ciliates_09-29-21_k0_eval-1e5.txt
