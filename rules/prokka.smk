# Rule for genome annotation using Prokka
# Annotates the polished genome assembly

rule annotate_prokka:
    input:
        polished_assembly = f"{output_dir}/medaka/consensus.fasta"
    output:
        f"{output_dir}/annotation/{sample}.gff"
    params:
        outdir=f"{output_dir}/annotation",
        prefix=sample
    threads: 8
    conda:
        "../envs/prokka.yaml"
    shell:
        """
        prokka --setupdb
        prokka --outdir {params.outdir} --force --prefix {params.prefix} --cpus {threads} --kingdom Bacteria --genus Escherichia --species coli {input.polished_assembly}
        """