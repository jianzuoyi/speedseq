# Example speedseq commands on a small slice of chromosome 20

# 1. Align with BWA
../bin/speedseq align \
    -o example \
    -t 10 \
    -p \
    -R "@RG\tID:NA12878\tSM:NA12878\tLB:lib1" \
    /its1/GB_BT2/jianzuoyi/biosoft/speedseq/example/data/human_g1k_v37_20_42220611-42542245.fasta \
    /its1/GB_BT2/jianzuoyi/biosoft/speedseq/example/data/NA12878.20slice.30X.fastq.gz
