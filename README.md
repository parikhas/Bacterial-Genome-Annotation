# Bacterial Genome Assembly and Annotation Pipeline

## Overview

This Snakemake pipeline automates the process of assembling and annotating bacterial genomes from Oxford Nanopore Technologies (ONT) sequencing data. The pipeline includes quality control, genome assembly, polishing, assembly evaluation and annotation.

## Pipeline Steps:

1. Quality Control (fastp): Filters and trims raw reads
2. Assembly (Canu): Assembles the filtered reads into contigs
3. Polishing (Medaka): Improves base-level accuracy of the assembly
4. Evaluation (Quast): Evaluates the genome assembly
5. Annotation (Prokka): Annotates the polished genome assembly

## Software Requirements:

  * Snakemake (≥6.0.0)
  * conda (>20.0.0)

The pipeline creates conda environments for each of the steps (rules) from a pre-configured YAML file per rule. This eliminates the need to install any packages locally and ensures reproducibility.

## Usage

1. Configure the Pipeline: 

    Create a config.yaml file in the pipeline directory:

    ```yaml
    input_dir: "path/to/input/directory"
    output_dir: "path/to/output/directory"
    sample_name: "your_sample_name"
    ```

2. Retreive the input data:

    Download the input file SRR30810013 in the fastq format from the 
    [SRA website](https://trace.ncbi.nlm.nih.gov/Traces/?view=run_browser&acc=SRR30810013&display=download) 
    
    Consider downsampling the input to quickly verify that an end-to-end run succeeds. Example
    to downsample to 10%.

    ```
    seqtk sample <input_filename> 0.1 > <downsampled_filename>
    ```

3. Prepare Your Data:

     Place your FASTQ file in the input directory with the naming format 
     `<input_dir>/<sample_name>.fastq`

3. Run the Pipeline:

    ```
    snakemake --cores all --use-conda --conda-frontend conda
    ```

4. The output_dir should contain the final annotated file `your_sample_name.gff` in 
the GFF format

## Runtime

On a laptop machine with 2 cores and 8GB RAM, the original input files takes approximately 6h to run.

The 10% downsampled version takes approximately 30 minutes.