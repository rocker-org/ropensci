## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM rocker/hadleyverse
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get update \
  && apt-get install -y --no-install-recommends -t unstable \
    cdbs \
    gdal-bin \
    libgdal1-dev \
    icedtea-netx \
    libxslt1-dev \
    libgeos-dev \
    libgeos-c1v5 \
    libgl1-mesa-dev \
    libhiredis-dev \
    libproj-dev \
    librdf0-dev \
    libsasl2-dev \
    libv8-dev \
    netcdf-bin \
    python-pip 


## Install additional dependencies
RUN rm -rf /tmp/*.rds \
  && install2.r --error \
    -r "http://cran.rstudio.com" \
    -r "http://datacube.wu.ac.at" \
    -r "http://packages.ropensci.org" \
    -r "http://www.bioconductor.org/packages/release/bioc" \
    -r "http://nceas.github.io/drat" \
    datapackage \
    dismo \
    drat \
    geiger \
    git2r \
    knitcitations \
    pander \
    phylobase \
    phytools \
    Rcampdf \
    redland \
    ropkgs \
    ridigbio \
    rgeolocate \
    RJSONIO \
  && installGithub.r \
    richfitz/drat.builder \
    cloudyr/aws.signature \
    cloudyr/aws.s3 \
    egonw/rrdf/rrdflibs \
    egonw/rrdf/rrdf \
    DataONEorg/rdataone/dataone \
  && r -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE); biocLite("sangerseqR", ask=FALSE)' \
  && pip install retriever \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds 

RUN install2.r \
    -r "http://cran.rstudio.com" \
    -r "http://www.omegahat.org/R" \
    -r "http://packages.ropensci.org" \
    Rcompression \
    RHTMLForms \
    ROOXML \
    RWordXML \
    SSOAP \
    Sxslt \
    XMLSchema 

## Install the rOpenSci R packages that are currently on CRAN. must use single quote notation
RUN R -e 'out <- ropkgs::ro_pkgs(); install.packages(out$packages$name[out$packages$on_cran])' \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds
