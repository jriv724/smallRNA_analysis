# Targeted Small RNA-Seq Analysis

Exploratory analysis of targeted small RNA sequencing BAM files generated on an Illumina NextSeq platform.

This project was completed as part of a computational biology data analysis assignment focused on:

- sequencing quality control,
- molecule-aware barcode deduplication,
- targeted enrichment analysis,
- candidate variant detection,
- and soft-clipped read interpretation.

---

# Project Overview

The dataset consisted of three hg19-aligned BAM files derived from a targeted small RNA sequencing assay. Reads contained embedded 8-mer molecular barcodes stored in the `mb` BAM tag, enabling molecule-aware deduplication and amplification complexity analysis.

The primary goals of the analysis were to:

1. evaluate sequencing and alignment quality,
2. identify enriched genes and targeted loci,
3. characterize candidate variants,
4. and investigate recurrent soft-clipped sequence behavior.

---

# Key Findings

## Quality Control

- Strong targeted enrichment behavior was observed across all samples.
- Most reads aligned with high confidence (`MAPQ=255`).
- Recurrent fragment size peaks (~130 bp and ~150 bp) were reproducible across samples.
- sample3 demonstrated elevated amplification redundancy and reduced barcode complexity.

## Enriched Genes

Major enriched loci included:

- CCND1
- FGFR1
- AXL
- MET
- EGFR
- RAF1
- BRAF
- GNAS
- IDH2
- RAB7A

Barcode-aware deduplication demonstrated that raw sequencing depth substantially overestimated molecular abundance in sample3.

## Candidate Variants

Target-restricted variant analysis identified candidate variants within multiple enriched cancer-associated genes.

Notably:

- recurrent FGFR1 substitutions were detected across all three samples,
- sample2 demonstrated the broadest candidate variant burden,
- and sample3 retained several high-depth candidate events despite reduced molecular complexity.

## Soft-Clipped Reads

Large soft-clipped reads (>15 bp) were highly recurrent and strongly enriched at specific genomic loci.

Soft-clipped sequences frequently remapped to:

- repetitive/unplaced contigs,
- enriched target regions,
- and homologous genomic loci.

The results support a mixture of:

- repetitive sequence mapping,
- alignment ambiguity,
- structurally complex RNA fragments,
- and off-target enrichment behavior.

No single dominant recurrent fusion event was identified.

---

# Repository Structure

```text
smallRNA_analysis/
├── data/
│   └── bam/
├── env/
│   └── environment.yml
├── genomes/
├── notebooks/
│   ├── 01_bam_qc.ipynb
│   ├── 02_gene_enrichment_barcode_dedup.ipynb
│   ├── 03_variant_analysis.ipynb
│   └── 04_softclip_analysis.ipynb
├── results/
│   ├── figures/
│   ├── tables/
│   └── variants/
└── scripts/
    └── download_and_index_references.sh
```

---

# Environment Setup

```bash
mamba env create -f env/environment.yml
mamba activate sophia_smallrna
```

---

# Reference Setup

Reference resources are not committed due to file size.

To download and index references:

```bash
bash scripts/download_and_index_references.sh
```

This script downloads:

- hg19 reference genome
- GENCODE v19 annotations

and builds:

- samtools FASTA indexes
- BWA indexes

---

# Main Analysis Workflow

## 1. BAM-Level Quality Control

Notebook:

```text
notebooks/01_bam_qc.ipynb
```

Includes:

- MAPQ analysis
- read length distributions
- alignment structure inspection
- barcode complexity analysis
- amplification redundancy assessment

## 2. Gene Enrichment Analysis

Notebook:

```text
notebooks/02_gene_enrichment_barcode_dedup.ipynb
```

Includes:

- region-level enrichment quantification
- barcode-aware deduplication
- GENCODE annotation
- raw vs deduplicated comparisons

## 3. Variant Analysis

Notebook:

```text
notebooks/03_variant_analysis.ipynb
```

Includes:

- targeted bcftools variant calling
- candidate variant filtering
- gene-level annotation
- variant visualization

## 4. Soft-Clipped Read Analysis

Notebook:

```text
notebooks/04_softclip_analysis.ipynb
```

Includes:

- large soft-clip extraction
- recurrent locus analysis
- clipped-sequence remapping
- exploratory fusion-like event assessment

---

# Reproducibility

All analyses were performed using:

- Python
- pysam
- pandas
- numpy
- seaborn
- matplotlib
- samtools
- bcftools
- bwa

Reference genome:

- hg19

Gene annotations:

- GENCODE v19