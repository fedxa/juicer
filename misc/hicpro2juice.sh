#!/bin/bash

for cc in 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 X Y; do
    bzcat $1 |
    awk " \$2==\"chr$cc\" {
    readname=\$1;
    sub(\"^chr\",\"\",\$2);chr1=\$2;
    pos1=\$3;
    str1=(\$4==\"+\")? 0 : 16;
    sub(\"^chr\",\"\",\$5);chr2=\$5;
    pos2=\$6;
    str2=(\$7==\"+\")? 0 : 16;
    sub(\"HIC_[^_]*_\",\"\",\$9); frag1=\$9-1;
    sub(\"HIC_[^_]*_\",\"\",\$10); frag2=\$10-1;
    mapq1=\$11;
    mapq2=\$12;
#    print readname,str1,chr1,pos1,frag1,str2,chr2,pos2,frag2,mapq1,mapq2
    print chr1,chr2,readname,str1,pos1,frag1,str2,pos2,frag2,mapq1,mapq2
}" | sort -T $HOME
done | awk '{print $3,$4,$1,$5,$6,$7,$2,$8,$9,$10,$11,$12,$13}'
