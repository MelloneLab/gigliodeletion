#!/bin/bash

# Peak Calling with MACS2

# Process control sample
bedtools bamtobed -i ${control}.bam > ${control}.bed
bedtools genomecov -bg -i ${control}.bed -g ${genome_size} > ${control}.bedgraph
sort -k1,1 -k2,2n -k3,3n ${control}.bedgraph > ${control}_sort.bedgraph
bedGraphToBigWig ${control}_sort.bedgraph ${genome_size} ${control}_sort.bigwig

# Process treatment sample
bedtools bamtobed -i ${treatment}.bam > ${treatment}.bed
bedtools genomecov -bg -i ${treatment}.bed -g ${genome_size} > ${treatment}.bedgraph
sort -k1,1 -k2,2n -k3,3n ${treatment}.bedgraph > ${treatment}_sort.bedgraph
bedGraphToBigWig ${treatment}_sort.bedgraph ${genome_size} ${treatment}_sort.bigwig


# MACS2 peak calling
macs2 callpeak \
    -t ${treatment}.bam \
    -c ${control}.bam \
    -f BAMPE \
    -g dm \
    -q 0.01 \
    -B \
    --outdir peakCalling \
    -n ${sample}_macs2 \
    --call-summits
