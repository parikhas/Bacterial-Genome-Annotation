configfile: "config.yaml"

# Define input and output directories
input_dir = config["input_dir"]
output_dir = config["output_dir"]

# Define sample name
sample = config["sample_name"]

include: "rules/fastp.smk"
include: "rules/canu.smk"
include: "rules/medaka.smk"
include: "rules/quast.smk"
include: "rules/prokka.smk"

rule all:
    input:
        f"{output_dir}/qc/{sample}_filtered.fastq",
        assembly = f"{output_dir}/canu_assembly/{sample}.contigs.fasta",
        polished_assembly = f"{output_dir}/medaka/consensus.fasta",
        report = f"{output_dir}/quast/report.txt",
        annot = f"{output_dir}/annotation/{sample}.gff"