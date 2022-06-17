#!/bin/bash
#SBATCH -t 7-00:00:00
#SBATCH -J trinity
#SBATCH --mem=250GB
#SBATCH -c 20
#SBATCH --exclusive
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu

echo "START"
date

module load Trinity/2.11.0-foss-2019b-Python-3.7.4

cd /data/jenkinslab/lzholland/exports

Trinity --seqType fa --max_memory 200G --CPU 20 --min_kmer_cov 2 \
	--left EXPORTS-S28_dedupe_1.fa --right EXPORTS-S28_dedupe_2.fa --output trinity_out_dir_S28_dedupe
echo "END"
date
