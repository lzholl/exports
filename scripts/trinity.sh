#!/bin/bash
#SBATCH -t 7-00:00:00
#SBATCH -J trinity
#SBATCH --mem=500GB
#SBATCH --exclusive
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

echo "START"
date

module load Trinity/2.8.4-foss-2016b
module load SAMtools/1.3.1-foss-2016b
module load Jellyfish/2.2.6-foss-2016b
module load Salmon/0.10.2-foss-2016b-Python-2.7.12

cd /data3/jenkinslab/so_metatrans/

Trinity --seqType fa --max_memory 500G --CPU 16 --min_kmer_cov 2 --no_normalize_reads --monitoring \
	--single NBP1608_MetaT_Ev_postmerge_all_norm_10-03-18.fa --run_as_paired

echo "END"
date
