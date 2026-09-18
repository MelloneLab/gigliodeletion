# CUT&Tag Analysis Pipeline

CUT&Tag data analysis pipeline for *Drosophila melanogaster* centromere biology research.

## Software Requirements

- FastQC v0.11.9
- TrimGalore v0.6.6
- Bowtie2 v2.4.2
- SAMtools v1.12
- BEDTools v2.30.0
- UCSC tools (bedGraphToBigWig)
- MACS2 v2.2.7.1
- deepTools v3.5.0
- Python v3.8+

## Reference Genome

Heterochromatin-enriched *Drosophila melanogaster* genome assembly (Chang et al., 2019).

**Reference:**  
Chang CH, Larracuente AM. 2019. Heterochromatin-enriched assemblies reveal the sequence and organization of the *Drosophila melanogaster* Y chromosome. *PLOS Biology* 17(5): e3000241. doi: 10.1371/journal.pbio.3000241

## Workflow

1. **Quality Control** - FastQC and adapter trimming
2. **Alignment** - Bowtie2 paired-end mapping
3. **Downsample IgG** - Reduce over-sequenced IgG control depth (~25x) before peak calling
4. **Peak Calling** - MACS2
5. **Normalization** - CPM-normalized BigWig generation
6. **Differential Analysis** - Log2 fold-change plots

## Usage

Scripts are designed to be run sequentially. Update file paths and sample names as needed.

```bash
bash 01_quality_control.sh
bash 02_alignment.sh
bash 03_downsample_igg.sh
bash 04_peak_calling.sh
bash 05_normalization.sh
bash 06_differential_analysis.sh
```

### Note on IgG downsampling

The IgG control library was pooled at ~25x higher concentration than the target
libraries, so it is over-sequenced relative to the target. Step 3 keeps 1/25 of
the IgG reads (fraction `0.04`, fixed seed) to restore a comparable depth. The
downsampled BAM (`*_trim_bt2_df_ds25.bam`) is the control input for peak calling
in step 4.
