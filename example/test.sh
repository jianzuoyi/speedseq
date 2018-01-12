cat  example.PoYGpGbeHJP3/example.sv.vcf \
    | /opt/bio/loopy/bin/python2.7 /its1/GB_BT2/jianzuoyi/biosoft/speedseq//bin/vawk --header '($1<=22 || $1=="X" || $1=="Y") && (I$SVTYPE=="BND" || (I$SVLEN<=50000 && I$SVLEN>=-50000))' \
    | /its1/GB_BT2/jianzuoyi/biosoft/speedseq//bin/vep \
    --fork 20 \
    -o STDOUT \
    --force_overwrite \
    --format vcf \
    --offline \
    --no_stats \
    --cache \
    --dir_cache /its1/GB_BT2/jianzuoyi/biosoft/speedseq//annotations/vep_cache \
    --assembly GRCh37 \
    --species homo_sapiens \
    --sift b \
    --polyphen b \
    --symbol \
    --numbers \
    --biotype \
    --total_length \
    --vcf \
    --fields Consequence,Codons,Amino_acids,Gene,SYMBOL,Feature,EXON,PolyPhen,SIFT,Protein_position,BIOTYPE \
    | cat - <(cat example.PoYGpGbeHJP3/example.sv.vcf | /opt/bio/loopy/bin/python2.7 /its1/GB_BT2/jianzuoyi/biosoft/speedseq//bin/vawk '($1>22 && $1!="X" && $1!="Y") || (I$SVTYPE!="BND" && (I$SVLEN>50000 || I$SVLEN<-50000))') \
    > example.PoYGpGbeHJP3/example.vep.sv.vcf
