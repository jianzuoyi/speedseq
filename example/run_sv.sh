#source /its1/GB_BT2/jianzuoyi/biosoft/speedseq/src/root/bin/thisroot.sh

# 3. Detect SVs
../bin/speedseq sv \
    -B example.bam \
    -S example.splitters.bam \
    -D example.discordants.bam \
    -R /its1/GB_BT2/jianzuoyi/biosoft/speedseq/example/data/human_g1k_v37_20_42220611-42542245.fasta \
    -o example \
    -t 40 \
    -g
