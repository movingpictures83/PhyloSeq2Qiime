# PhyloSeq2Qiime
# Language: R
# Input: TXT (keyword-value pairs)
# Output: PREFIX
# Tested with: PluMA 1.1, R 4.0.0
# Dependency: ape_5.4-1, biomformat_1.18.0, microbiome_1.12.0, ggplot2_3.3.5, phyloseq_1.34.0

PluMA plugin to convert PhyloSeq-compatible input data (OTU, TAX and META files)
into Qiime-compatible BIOM and TRE format.

The plugin accepts as input a tab-delimited parameter file of keyword value pairs:
OTU: OTU table
TAX: TAX table
META: metadata

Output will be files PREFIX.biom and PREFIX.tre.
