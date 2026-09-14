FROM ghcr.io/bioconductor/bioconductor:3.23-R-4.6.1

USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    cmake \
    libmagick++-dev \
    libudunits2-dev \
    libabsl-dev \
    libnlopt-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY scripts/install_packages.R /tmp/install_packages.R

RUN Rscript /tmp/install_packages.R

COPY scripts/download_data.R /tmp/download_data.R

RUN Rscript /tmp/download_data.R

COPY --chown=rstudio:rstudio workshop /home/rstudio/workshop

WORKDIR /home/rstudio/workshop