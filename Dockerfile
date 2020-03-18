FROM continuumio/miniconda3

ADD VERSION .

RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge

RUN conda update -n base -c defaults conda

RUN conda install --yes kaiju=1.7.3 taxonkit=0.3.0 sqlite=3.30.1 pandas goatools=0.9.9 bbmap=38.75 fastp=0.20.0 STAR=2.7.3a subread=2.0.0

RUN conda clean --index-cache --tarballs --packages --yes
