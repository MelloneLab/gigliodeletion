#!/bin/bash

# Quality Control and Adapter Trimming

# FastQC
fastqc -o QC ${file_path}/${sample}_R1.fastq.gz ${file_path}/${sample}_R2.fastq.gz

# TrimGalore
trim_galore -j 4 --paired --quality 20 --nextera --length 35 --phred33 --fastqc \
    -o fastq_Trim \
    ${file_path}/${sample}_R1.fastq.gz \
    ${file_path}/${sample}_R2.fastq.gz
