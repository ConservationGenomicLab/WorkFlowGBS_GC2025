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

# mv *.fastq.gz $myPATH/1.RawData
# mv gbstrim.pl $myPATH/1.RawData
# mv popmap $myPATH/3.Call_Stacks
###############################################################################################################################
# Control de Calidad
################################################################################################################################
# cd $myPATH/1.RawData
# fastqc Sub_1Ca4.fastq.gz


################################################################################################################################
# Recorte de adptadores y longitud de reads
################################################################################################################################
# cd $myPATH/1.RawData
# ls *.fastq.gz > Lista
# for i in $(cat Lista); do name=`echo $i | cut -d "_" -f 2|cut -d "." -f 1` ; perl gbstrim.pl --enzyme1 psti --enzyme2 mspi --read R1 --minlength 142 --fastqfile $i --outputfile $myPATH/2.gbstrim/$name.fastq ;done

# cd ../2.gbstrim
# mkdir HQReads_FastQC
# fastqc *.fastq -o HQReads_FastQC 


################################################################################################################################ 
# STACKS::denovo (https://catchenlab.life.illinois.edu/stacks/comp/denovo_map.php) 
# Run ustacks, cstacks, sstacks, tsv2bam, gstacks
# Llamados de SNP's
################################################################################################################################
# ¿Cómo crear un popmap?
# cd $myPATH/2.gbstrim
# Crear un popmap
# ls *.fastq | sed 's/.fastq//g' > popmap
# nano popmap 


# mv popmap $myPATH/3.Call_Stacks
# cd $myPATH/3.Call_Stacks
<<<<<<< HEAD
# denovo_map.pl --samples $myPATH/2.gbstrim/ --popmap popmap --out-path ./ -M 1 -n 1 
=======
#mkdir M2
# denovo_map.pl --samples $myPATH/2.gbstrim/ --popmap popmap --out-path M2/ -M 2 -n 3 
#mkdir M3
# denovo_map.pl --samples $myPATH/2.gbstrim/ --popmap popmap --out-path M3 -M 3 -n 3 
#mkdir M4
#denovo_map.pl --samples $myPATH/2.gbstrim/ --popmap popmap --out-path M3 -M 4 -n 3

# Comparar las corridas de optimizacion:
# NOTA: Losarchivos Descriptores de cada prueba, seran analizados en R para comparar y  decidir la mejor corrida 
# mv stacks-dist-extract $myPATH/3.Call_Stacks
# cd $myPATH/3.Call_Stacks 
# stacks-dist-extract M2denovo_map.log cov_per_sample >  M2/DescriptoresM2.txt
# stacks-dist-extract M3/denovo_map.log cov_per_sample > M3/DescriptoresM3.txt
# stacks-dist-extract M4/denovo_map.log cov_per_sample > M4DescriptoresM4.txt

#####################################################################################################################
# Crear un link simbolico de todos los archivos Descriptores a una nueva carpeta para poder descargarlos todos juntos
# cd $myPATH/3.Call_Stacks
# mkdir DescripFiles
# ln -s M*/Descriptores*.txt DescripFiles
#####################################################################################################################
>>>>>>> b61e3d6827f5156ecfbeeddefeeb418f525a0cd4

# cd $myPATH/3.Call_Stacks
# mkdir M2
# denovo_map.pl --samples $myPATH/2.gbstrim/ --popmap popmap --out-path M2/ -M 2 -n 1

<<<<<<< HEAD
# Comparar las corridas de optimizacion: 
# mv stacks-dist-extract $myPATH/3.Call_Stacks
# cd $myPATH/3.Call_Stacks 
# stacks-dist-extract denovo_map.log cov_per_sample > Descriptores.txt
=======
>>>>>>> b61e3d6827f5156ecfbeeddefeeb418f525a0cd4

#cd $myPATH/3.Call_Stacks 
#stacks-dist-extract M2/denovo_map.log cov_per_sample > DescriptoresM2.txt
################################################################################################################################
# STACKS::populations
# Run to generate population-level summary statistics and export data in a variety of formats
################################################################################################################################
<<<<<<< HEAD
# cd $myPATH/4.Populations
# populations -P $myPATH/3.Call_Stacks -O $myPATH/4.Populations -M $myPATH/3.Call_Stacks/popmap --write-random-snp -r 0.7 --vcf 
=======
 cd $myPATH/4.Populations
 populations -P $myPATH/3.Call_Stacks -O $myPATH/4.Populations -M $myPATH/3.Call_Stacks/popmap --write-random-snp --vcf 
>>>>>>> b61e3d6827f5156ecfbeeddefeeb418f525a0cd4



################################################################################################################################
# VCFtools 
# Filtrar SNP's 
################################################################################################################################

<<<<<<< HEAD
cd $myPATH/5.VCFtools
vcftools --vcf $myPATH/4.Populations/populations.snps.vcf --maf 0.05 --min-alleles 2 --max-alleles 2 --hwe 0.00001 --max-missing 0.5 --recode
=======
 cd $myPATH/5.VCFtools
 vcftools --vcf $myPATH/4.Populations/populations.snps.vcf --maf 0.05 --min-alleles 2 --max-alleles 2 --hwe 0.00001 --max-missing 0.7 --recode
>>>>>>> b61e3d6827f5156ecfbeeddefeeb418f525a0cd4


