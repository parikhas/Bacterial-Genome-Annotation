rule quast:
    input:
        polished_assembly = f"{output_dir}/medaka/consensus.fasta"
    output:
        report = f"{output_dir}/quast/report.txt"
    params:
        outdir = f"{output_dir}/quast"
    threads: 8
    conda:
        "../envs/quast.yaml"
    shell:
        """
        quast {input.polished_assembly} -o {params.outdir} -t {threads}
        """
