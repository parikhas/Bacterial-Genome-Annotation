# Rule for quality control using fastp
# Performs quality filtering and trimming of raw reads

rule qc_fastp:
    input:
        f"{input_dir}/{sample}.fastq"
    output:
        fastq=f"{output_dir}/qc/{sample}_filtered.fastq",
        html=f"{output_dir}/qc/{sample}_fastp_report.html",
        json=f"{output_dir}/qc/{sample}_fastp_report.json"
    conda:
        "../envs/fastp.yaml"
    threads: 4
    shell:
        "fastp -i {input} -o {output.fastq} -h {output.html} -j {output.json} -q 10 -w {threads}"