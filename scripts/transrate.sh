#!/bin/bash
#SBATCH --cpus-per-task=20
#SBATCH --job-name=transrate
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --partition=general
#SBATCH --mail-type=END
#SBATCH --mail-user=lzfilliger@uri.edu
#SBATCH -e transrate_EXPORTS-LL1-5_3-10-21.e
#SBATCH -o transrate_EXPORTS-LL1-5_3-10-21.o

module load blast/2.2.31+
module load transrate/1.0.3-Ruby-2.3.3

cd /data/jenkinslab/lzholland/exports

transrate --assembly EXPORTS_LL1-5_1-27-21_assembly_clstrd98n10.fasta --threads 20
