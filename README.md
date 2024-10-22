# Bacterial Genome Assembly and Annotation Pipeline

Overview

This Snakemake pipeline automates the process of assembling and annotating bacterial genomes from Oxford Nanopore Technologies (ONT) sequencing data. The pipeline includes quality control, genome assembly, polishing, assembly evaluation and annotation.

Pipeline Steps:

1. Quality Control (fastp): Filters and trims raw reads
2. Assembly (Canu): Assembles the filtered reads into contigs
3. Polishing (Medaka): Improves base-level accuracy of the assembly
4. Evaluation (Quast): Evaluates the genome assembly
5. Annotation (Prokka): Annotates the polished genome assembly

Software Requirements:

Snakemake (≥6.0.0)
conda (>20.0.0)

The pipeline creates conda environments from the yaml file for each of the steps. This eliminates the need to install any packages locally and ensures reproducibility.

Usage

1. Configure the Pipeline:

Create a config.yaml file in the pipeline directory:

input_dir: "path/to/input/directory"
output_dir: "path/to/output/directory"
sample_name: "your_sample_name"

2. Prepare Your Data:

Place your FASTQ file in the input directory with the naming format:
<input_dir>/<sample_name>.fastq

3. Run the Pipeline:

snakemake --cores all --use-conda --conda-frontend conda
