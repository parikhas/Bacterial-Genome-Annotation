# Rule for genome assembly using Canu
# Assembles filtered reads into contigs

rule canu_assembly:
    input:
        f"{output_dir}/qc/{sample}_filtered.fastq"
    output:
        assembly = f"{output_dir}/canu_assembly/{sample}.contigs.fasta"
    conda:
        "../envs/canu.yaml"
    shell:
        "canu -p {sample} -d {output_dir}/canu_assembly genomeSize=4.8m -nanopore-raw {input}"
