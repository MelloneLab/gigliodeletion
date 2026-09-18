#!/bin/bash

# Bowtie2 Alignment and BAM Processing

# Bowtie2 alignment
bowtie2 -p 8 -t -x ${genome_index} \
    -1 ${trimmed_path}/${sample}_R1_val_1.fq.gz \
    -2 ${trimmed_path}/${sample}_R2_val_2.fq.gz \
    -S ${sample}_trim_bt2_df.sam

# Convert SAM to BAM and sort
samtools sort -O bam -o ${sample}_trim_bt2_df.bam ${sample}_trim_bt2_df.sam

# Index BAM
samtools index ${sample}_trim_bt2_df.bam
