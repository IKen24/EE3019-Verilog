#!/bin/csh -f

cd /net/courses/2025/EE3019/KennyI/lab1/source/proj/processors/16-bit

#This ENV is used to avoid overriding current script in next vcselab run 
setenv SNPS_VCSELAB_SCRIPT_NO_OVERRIDE  1

/cadtools/synopsys/2020/vcs21/S-2021.09-SP1-1/linux64/bin/vcselab $* \
    -o \
    simv \
    -nobanner \

cd -

