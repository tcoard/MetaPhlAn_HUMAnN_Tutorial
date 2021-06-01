# MetaPhlAn & HUMAnN

For both workflows, make sure to change `#SBATCH --mail-user=` and `$OUTPUT_DIR`.

## Running MetaphlAn

Use the [metaphlan_submitter.sh](https://github.com/tcoard/MetaPhlAn_HUMAnN_Tutorial/blob/master/metaphlan_submitter.sh) file.

`${INPUT}` is one or two fastq files. If using two files, they must have be in the format `<sample_name>R1.fastq,<sample_name>R2.fastq`

MetaphlAn will generate `${OUTPUT_DIR}/profiled_metagenome.txt` which will include the different clades found in the sample and their relative abundance.


## Running HUMAnN

Use the [humann_submitter.sh](https://github.com/tcoard/MetaPhlAn_HUMAnN_Tutorial/blob/master/humann_submitter.sh) file.

`${INPUT}` is one fastq file.

HUMAnN will generate three files:
* `$OUTPUT_DIR/$SAMPLENAME_genefamilies.tsv`
* `$OUTPUT_DIR/$SAMPLENAME_pathcoverage.tsv`
* `$OUTPUT_DIR/$SAMPLENAME_pathabundance.tsv`

### Gene Families

Gene family abundance is reported in RPK (reads per kilobase). This is computed as the sum of the scores for all alignments for a gene family. An alignment score is based on the number of matches to the reference gene for a specific sequence.

### Path Abundance

“The abundance for each pathway is a recursive computation of abundances of sub-pathways with paths resolved to abundances based on the relationships and abundances of the reactions contained in each.” https://github.com/biobakery/humann

### Path Coverage

Coverage is a confidence score assigned to each reaction detected in the community.


For more details on the HUMAnN program: https://github.com/biobakery/humann


