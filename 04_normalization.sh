#!/bin/bash

# CPM Normalization

bamCoverage \
    -b ${sample}.bam \
    -o ${sample}_CPM.bw \
    --normalizeUsing CPM \
    --binSize 10 \
    --extendReads \
    --centerReads \
    -p 6
