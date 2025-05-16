# WorkFlowGBS_GC2025
Genotyping by sequencing (GBS) is a cost-effective method for discovering and genotyping single nucleotide polymorphisms (SNPs) . Pipeline para realizar control de calidad de reads, recortar la longitud a un tamaño específicos, construccion de RAD locus, llamado de SNP's y filtrado de SNP's

Requerimientos:
sudo make install
sudo apt install zlib1g-dev
instalar c++
Instalar cutadapt
Instalar con sudo:
sudo apt install cutadapt

Instalar con conda:
conda install bioconda::cutadapt conda install bioconda/label/cf201901::cutadapt

Instalar stacks
Instalar con conda:
conda create -n Stacks-2.53
conda activate Stacks-2.53
conda install Stacks=2.53 -c bioconda
denovo_map.pl -v

Descarga directa
https://catchenlab.life.illinois.edu/stacks/
$ cd Descargas
$ tar -vxzf stacks-2.66.tar.gz
$ cd stacks-2.66
$ less README.md
$ ./configure
$ make

Instalar vcftools
Instalar con sudo:
sudo apt-get install vcftools

Instalar con conda
conda install bioconda::vcftools
conda install bioconda/label/cf201901::vcftools

Clonar repositorio de github
$ git clone https://github.com/vcftools/vcftools.git
$ cd vcftools
$ git pull https://github.com/vcftools/vcftools.git master
$ less README.md # ver instrucciones de instalacion

Descarga directa:
https://vcftools.sourceforge.net/man_latest.html
$ cd Descargas
$ tar -vxzf vcftools_0.1.13.tar.gz
$ cd vcftools_0.1.13
$ less README.md # ver instrucciones de instalacion
