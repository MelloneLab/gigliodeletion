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
- SEACR v1.3
- deepTools v3.5.0
- Python v3.8+

## Reference Genome

Heterochromatin-enriched *Drosophila melanogaster* genome assembly (Chang et al., 2019).

**Reference:**  
Chang CH, Larracuente AM. 2019. Heterochromatin-enriched assemblies reveal the sequence and organization of the *Drosophila melanogaster* Y chromosome. *PLOS Biology* 17(5): e3000241. doi: 10.1371/journal.pbio.3000241

## Workflow

1. **Quality Control** - FastQC and adapter trimming
2. **Alignment** - Bowtie2 paired-end mapping
3. **Peak Calling** - SEACR and MACS2
4. **Normalization** - CPM-normalized BigWig generation
5. **Differential Analysis** - Log2 fold-change plots

## Usage

Scripts are designed to be run sequentially. Update file paths and sample names as needed.

```bash
bash 01_quality_control.sh
bash 02_alignment.sh
bash 03_peak_calling.sh
bash 04_normalization.sh
bash 05_differential_analysis.sh
```
