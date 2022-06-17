#!/bin/bash
#SBATCH -t 9-00:00:00
#SBATCH -J trinity-norm
#SBATCH --mem=500GB
#SBATCH --exclusive
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu

echo "START"
date

module load Trinity/2.8.4-foss-2016b
module load SAMtools/1.3.1-foss-2016b
module load Jellyfish/2.2.6-foss-2016b
module load Salmon/0.10.2-foss-2016b-Python-2.7.12

cd /data3/jenkinslab/so_metatrans/

#/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/insilico_read_normalization.pl \
#--seqType fa --JM 500G  --max_cov 200 --min_cov 2 --CPU 32 \
#--single NBP1608_MetaT_CondA_merged_10-03-18.fa

/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/insilico_read_normalization.pl \
--seqType fa --JM 500G  --max_cov 200 --min_cov 2 --CPU 32 \
--left NBP1608_MetaT_CondA_unmerged_1_10-03-18.fa --right NBP1608_MetaT_CondA_unmerged_2_10-03-18.fa

/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/insilico_read_normalization.pl \
--seqType fa --JM 500G  --max_cov 200 --min_cov 2 --CPU 32 \
--single NBP1608_MetaT_CondC_merged_10-03-18.fa                                               

/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/insilico_read_normalization.pl \
--seqType fa --JM 500G  --max_cov 200 --min_cov 2 --CPU 32 \
--left NBP1608_MetaT_CondC_unmerged_1_10-03-18.fa --right NBP1608_MetaT_CondC_unmerged_2_10-03-18.fa

/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/insilico_read_normalization.pl \
--seqType fa --JM 500G  --max_cov 200 --min_cov 2 --CPU 32 \
--single NBP1608_MetaT_Ev_merged_10-03-18.fa                                               

/opt/software/Trinity/2.8.4-foss-2016b/trinityrnaseq-Trinity-v2.8.4/util/insilico_read_normalization.pl \
--seqType fa --JM 500G  --max_cov 200 --min_cov 2 --CPU 32 \
--left NBP1608_MetaT_Ev_unmerged_1_10-03-18.fa --right NBP1608_MetaT_Ev_unmerged_2_10-03-18.fa

echo "END"
date
