FROM continuumio/miniconda3

RUN conda config --add channels defaults && \
    conda config --add channels bioconda && \
    conda config --add channels conda-forge

RUN conda update -n base -c defaults conda

RUN conda install --yes kaiju=1.7.0 taxonkit=0.3.0 sqlite=3.26.0 pandas=0.24.2 goatools=0.8.12 ete3=3.1.1

RUN conda clean --index-cache --tarballs --packages --yes
