## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM rocker/hadleyverse
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get update \
  && apt-get install -y --no-install-recommends -t unstable \
    cdbs \
    libgl1-mesa-dev \
    libhiredis-dev \
    libproj-dev \
    libsasl2-dev \
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
    rrdf \
    redland \
    rhdf5 \
    ropkgs \
    ridigbio \
    rgeolocate \
    RJSONIO \
    sangerseqR \
    dataone \
    datapackage \
  && installGithub.r \
    richfitz/drat.builder \
    cloudyr/aws.signature \
    cloudyr/aws.s3 \
  && pip install retriever \
  && rm -rf /tmp/downloaded_packages/ /tmp/*.rds 

## Do the Omegahat installs seperately...
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
