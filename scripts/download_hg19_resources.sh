#!/usr/bin/env bash
set -euo pipefail

mkdir -p genomes
cd genomes

# hg19 reference genome for variant calling
wget -nc https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.fa.gz
gunzip -k -f hg19.fa.gz
samtools faidx hg19.fa

# GENCODE v19 annotation for hg19/GRCh37 gene annotation
wget -nc https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_19/gencode.v19.annotation.gtf.gz
gunzip -k -f gencode.v19.annotation.gtf.gz