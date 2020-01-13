FROM continuumio/miniconda3

ADD VERSION .

RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge

RUN conda update -n base -c defaults conda

RUN conda install --yes kaiju=1.7.2 taxonkit=0.5.0 sqlite pandas goatools=0.9.9 bbmap=38.75

RUN conda clean --index-cache --tarballs --packages --yes
