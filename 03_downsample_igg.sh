#!/bin/bash

# Downsample IgG (Control) BAM

# Keep 1/25 of reads to reverse ~25x over-concentration of the IgG library
samtools view -b -@ 8 --subsample 0.04 --subsample-seed 42 \
    ${control}_trim_bt2_df.bam > ${control}_trim_bt2_df_ds25.bam

# Index BAM
samtools index ${control}_trim_bt2_df_ds25.bam
