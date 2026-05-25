#!/usr/bin/env bash
set -euo pipefail

mkdir -p genomes

echo "Downloading hg19 reference genome..."
wget -nc -O genomes/hg19.fa.gz \
  https://hgdownload.soe.ucsc.edu/goldenPath/hg19/bigZips/hg19.fa.gz

echo "Unzipping hg19 FASTA..."
gunzip -k -f genomes/hg19.fa.gz

echo "Creating chromosome-name-compatible FASTA without chr prefix..."
sed 's/^>chr/>/' genomes/hg19.fa > genomes/hg19_nochr.fa

echo "Indexing FASTA with samtools..."
samtools faidx genomes/hg19_nochr.fa

echo "Indexing FASTA with bwa..."
bwa index genomes/hg19_nochr.fa

echo "Downloading GENCODE v19 annotation..."
wget -nc -O genomes/gencode.v19.annotation.gtf.gz \
  https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_19/gencode.v19.annotation.gtf.gz

echo "Unzipping GENCODE annotation..."
gunzip -k -f genomes/gencode.v19.annotation.gtf.gz

echo "Reference setup complete."
