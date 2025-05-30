#!/bin/bash
#
#SBATCH -t 4-00:00 # Runtime in D-HH:MM
#SBATCH --job-name=Aging_data
#SBATCH -c 16
#SBATCH --mem=120g
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=zah47@pitt.edu

##module
module load cellranger/7.0.0

DATA="../path_to_Raw_FASTQ_files"

cd $DATA

cellranger count --id=aging \
    --libraries=../codes/GC_libraries.csv \
    --transcriptome=../scRNA_codes/refdata-gex-mm10-2020-A \
    --localcores=16 \
    --localmem=119 
