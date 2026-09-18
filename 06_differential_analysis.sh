#!/bin/bash

# Log2 Differential Analysis

# Generate log2 fold-change BigWig
bigwigCompare \
    -b1 ${sample1}_CPM.bw \
    -b2 ${sample2}_CPM.bw \
    --operation log2 \
    --pseudocount 1 \
    --skipZeroOverZero \
    -o ${comparison}_log2.bw \
    -p 8

# Compute matrix over regions
computeMatrix scale-regions \
    -S ${comparison}_log2.bw \
    -R ${regions}.bed \
    --regionBodyLength 5000 \
    --binSize 25 \
    --missingDataAsZero \
    --skipZeros \
    -o ${comparison}_matrix.gz \
    --outFileNameMatrix ${comparison}_matrix.tab \
    -p 8

# Generate profile plot
plotProfile -m ${comparison}_matrix.gz \
    -o ${comparison}_profile.pdf \
    --samplesLabel ${comparison} \
    --plotTitle "Log2 Fold Change" \
    --yAxisLabel "log2(fold change)" \
    --plotHeight 5 \
    --plotWidth 8 \
    --plotType lines \
    --plotFileFormat pdf


