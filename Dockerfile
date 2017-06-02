## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM rocker/geospatial
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    cdbs \
    icedtea-netx \
    libgsl0-dev \
    libhiredis-dev \
    libpoppler-cpp-dev \
    librdf0-dev \
    libsasl2-dev \
    libxslt1-dev \
    mdbtools \
    python-pip \
    python-pdftools \
  && R CMD javareconf \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/ \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds \
  && wget -O /usr/local/bin/install2.r https://github.com/eddelbuettel/littler/raw/master/inst/examples/install2.r \
  && chmod +x /usr/local/bin/install2.r

## Install additional dependencies
RUN install2.r --error \
    -r 'http://cran.rstudio.com' \
    -r 'http://datacube.wu.ac.at' \
    -r 'http://packages.ropensci.org' \
    -r 'http://www.bioconductor.org/packages/release/bioc' \
    -r 'http://nceas.github.io/drat' \
    aws.s3 \
    dismo \
    drat \
    geiger \
    git2r \
    knitcitations \
    pander \
    phylobase \
    phytools \
    Rcampdf \
    rrdf \
    redland \
    rhdf5 \
    ropkgs \
    ridigbio \
    rgeolocate \
    RJSONIO \
    sangerseqR \
    dataone \
    datapack \
  && R -e "remotes::install_github('richfitz/drat.builder')" \
  && pip install retriever \
  && install2.r --error \
    -r 'http://cran.rstudio.com' \
    -r 'http://packages.ropensci.org' \
    -r 'http://www.omegahat.net/R' \
    Rcompression \
    RHTMLForms \
    ROOXML \
    RWordXML \
    SSOAP \
    Sxslt \
    XMLSchema \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds 

## Install the rOpenSci R packages that are currently on CRAN. must use single quote notation
RUN R -e 'out <- ropkgs::ro_pkgs(); readr::write_lines(out$packages$name[out$packages$on_cran], "ropensci.txt")' \
  && install2.r `cat ropensci.txt`  
