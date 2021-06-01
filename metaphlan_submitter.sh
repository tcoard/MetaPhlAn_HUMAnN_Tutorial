#!/bin/bash
#
### !!! CHANGE !!! the email address to your drexel email
#SBATCH --mail-user=
### !!! CHANGE !!! the account - you need to consult with the professor
#SBATCH --account=eces450650Prj
### select number of nodes (usually you need only 1 node)
#SBATCH --nodes=1
### select number of tasks per node
#SBATCH --ntasks=1
### select number of cpus per task (you need to tweak this when you run a multi-thread program)
#SBATCH --cpus-per-task=32
### request 48 hours of wall clock time (if you request less time, you can wait for less time to get your job run by the system, you need to have a good esitmation of the run time though    ).
#SBATCH --time=1:00:00
### memory size required per node (this is important, you also need to estimate a upper bound)
#SBATCH --mem=32GB
### select the partition "def" (this is the default partition but you can change according to your application)
#SBATCH --partition=def

newgrp eces450650Grp
containerdir=/data_dir
INPUT="${containerdir}/trimmed/evol1.R1.fastq,${containerdir}/trimmed/evol1.R2.fastq"

### !!! CHANGE !!! make your own output directory
OUTPUT_DIR=${containerdir}/CHANGE_THIS/
PROJECT=Tutorial11

singularity exec --bind /ifs/groups/eces450650Grp/ECES450650_SP21/Tutorial11/:/${containerdir},${TMP}:/tmp,${TMP}:${TMP} docker://biobakery/metaphlan metaphlan ${INPUT} --bowtie2out ${OUTPUT_DIR}/metagenome.bowtie2.bz2 -o ${OUTPUT_DIR}/profiled_metagenome.txt --input_type fastq
