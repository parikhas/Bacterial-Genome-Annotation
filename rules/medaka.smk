rule polish_medaka:
    input:
        assembly = f"{output_dir}/canu_assembly/{sample}.contigs.fasta",
        fastq = f"{output_dir}/qc/{sample}_filtered.fastq"
    output:
        polished_assembly = f"{output_dir}/medaka/consensus.fasta"
    params:
        outdir = f"{output_dir}/medaka",
    threads: 2
    conda:
        "../envs/medaka.yaml"
    shell:
        "medaka_consensus -i {input.fastq} -d {input.assembly} -o {params.outdir}"