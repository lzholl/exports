#!/bin/bash
#SBATCH --job-name=bbmerge
#SBATCH --time=24:00:00
#SBATCH --mem=250G
#SBATCH -c 40
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@my.uri.edu

module load BBMap/37.36-foss-2016b-Java-1.8.0_131

cd /data3/jenkinslab/so_metatrans/

bbmerge.sh usejni=t t=40 -Xmx250g ihist=NBP1608_MetaT_CondC_inserthist_10-03-18 in1=NBP1608_MetaT_CondC_cent_postBAdb_ntdb_unclass_reads_9-27-2018_1.fa in2=NBP1608_MetaT_CondC_cent_postBAdb_ntdb_unclass_reads_9-27-2018_2.fa \
out=NBP1608_MetaT_CondC_merged_10-03-18.fa outu1=NBP1608_MetaT_CondC_unmerged_1_10-03-18.fa outu2=NBP1608_MetaT_CondC_unmerged_2_10-03-18.fa 


