#!/bin/bash

# Datos GBS (Genome by Sequencing)
# NexSeq 1x150 pb
# Enzimas utilizadas psti y mspi
# 8 individuos 

# Pipeline para realizar control de calidad de reads, recortar la longitud a un tamaño específicos, construccion de RAD locus, llamado de SNP's y filtrado de SNP's 



DIRECTORIOS="1.RawData 2.gbstrim 3.Call_Stacks 4.Populations 5.VCFtools"

if [ -d "$DIRECTORIOS" ]
then
   echo "Los directorios de trabajo existen"
else
    mkdir ${DIRECTORIOS} 
fi 



myPATH=`pwd`

# mv *.fastq $myPATH/1.RawData
# mv gbstrim.pl $myPATH/1.RawData
# mv popmap 3.Call_Stacks
###############################################################################################################################
# Control de Calidad
################################################################################################################################
# cd $myPATH/1.RawData
# fastqc Sub_1Ca4.fastq


################################################################################################################################
# Recorte de adptadores y longitud de reads
################################################################################################################################
# cd $myPATH/1.RawData
# ls *.fastq > Lista
# for i in $(cat Lista); do name=`echo $i | cut -d "_" -f 2|cut -d "." -f 1` ; perl gbstrim.pl --enzyme1 psti --enzyme2 mspi --read R1 --minlength 142 --fastqfile $i --outputfile $myPATH/2.gbstrim/$name.fastq ;done

# fastqc *.fastq


################################################################################################################################ 
# STACKS::denovo (https://catchenlab.life.illinois.edu/stacks/comp/denovo_map.php) 
# Run ustacks, cstacks, sstacks, tsv2bam, gstacks
# Llamados de SNP's
################################################################################################################################
# ¿Cómo crear un popmap?
# cd $myPATH/2.gbstrim
# Crear un popmap:
# ls *.fastq | sed 's/.fastq//g' > popmap
# nano popmap 


# mv popmap $myPATH/3.Call_Stacks
# mv stacks-dist-extract  $myPATH/3.Call_Stacks
# cd $myPATH/3.Call_Stacks
# denovo_map.pl --samples $myPATH/2.gbstrim/ --popmap popmap --out-path ./ -M 3 -n 3 

# Comparar las corridas de optimizacion: 
# stacks-dist-extract denovo_map.log cov_per_sample > Descriptores.txt

################################################################################################################################
# STACKS::populations
# Run to generate population-level summary statistics and export data in a variety of formats
################################################################################################################################
# cd $myPATH/4.Populations
# populations -P $myPATH/3.Call_Stacks -O $myPATH/4.Populations -M $myPATH/3.Call_Stacks/popmap --write-random-snp --vcf 



################################################################################################################################
# VCFtools 
# Filtrar SNP's 
################################################################################################################################

# $myPATH/5.VCFtools
# vcftools --vcf $myPATH/4.Populations/populations.snps.vcf --maf 0.05 --min-alleles  2 --max-alleles 2 --hwe 0.00001 --max-missing 0.7 --recode


