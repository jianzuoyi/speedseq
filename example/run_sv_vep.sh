OUTBASE=example

cat  ${OUTBASE}.sv.vcf \
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
| cat - <(cat example.sv.vcf | /opt/bio/loopy/bin/python2.7 /its1/GB_BT2/jianzuoyi/biosoft/speedseq//bin/vawk '($1>22 && $1!="X" && $1!="Y") || (I$SVTYPE!="BND" && (I$SVLEN>50000 || I$SVLEN<-50000))') > $OUTBASE.vep.sv.vcf

 # write output vcf file
cat $OUTBASE.vep.sv.vcf | awk '{ print; if ($0~"^#CHROM") exit; }' > header.txt
cat $OUTBASE.sv.vcf \
 | grep -v "^#" \
 | sort -k1,1 -k2,2n \
 | cat header.txt - \
 | bgzip -c \
 > $OUTBASE.vep.sv.vcf.gz
tabix -p vcf $OUTBASE.vep.sv.vcf.gz

rm header.txt $OUTBASE.vep.sv.vcf

echo "VEP done"