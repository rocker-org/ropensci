## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM rocker/hadleyverse
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get update && apt-get install -y --no-install-recommends \
    gdal-bin \
    libxslt1-dev \
    libgeos-dev \
    libgeos-c1 \
    libgdal1h \
    libgdal1-dev \
    libproj-dev \
    netcdf-bin \
    python-mysqldb \
    python-psycopg2 \
    python-setuptools \
    python-wxgtk3.0 \
    python-xlrd 

## Install additional Omegahat, CRAN & Github hosted dependencies 
RUN rm /tmp/*.rds \
&& install2.r --error --repos http://www.omegahat.org/R \
    Rcompression \
    RHTMLForms \
    ROOXML \
    RWordXML \
    SSOAP \
    Sxslt \
    XMLSchema \
||  installGithub.r \
    omegahat/Rcompression \
    omegahat/RHTMLForms \
    duncantl/ROOXML \
    duncantl/RWordXML \
    omegahat/XMLSchema \
    omegahat/SSOAP/Install \
    omegahat/Sxslt \
&&  installGithub.r \
    DataONEorg/rdataone/dataonelibs \
    ropensci/rdataone/dataone \
    egonw/rrdf/rrdflibs \
    egonw/rrdf/rrdf \
    ramnathv/rcharts \
&&  install2.r --error \
    geiger \ 
    phylobase \
    phytools \
    knitcitations \
&& install2.r --error --repos http://datacube.wu.ac.at Rcampdf \
&& Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE); biocLite("BiocInstaller")' \
&& wget https://github.com/weecology/retriever/archive/v1.7.0.tar.gz \ 
&& tar -xvf v1.7.0.tar.gz \
&& cd v1.7.0 && python setup.py install && cd .. \
&& rm v1.7.0.tar.gz \
&& rm -rf /tmp/downloaded_packages/


## Install build dependencies (not avaialble for Debian)
#RUN apt-get build-dep -y r-cran-rgeos r-cran-rgdal


## Install the rOpenSci R packages that are currently on CRAN
RUN install2.r --error \
  alm \
  AntWeb \
  aRxiv \
  bold \
  dvn \
  ecoengine \
  ecoretriever \
  paleobioDB \
  rAltmetric \
  rAvis \
  rbhl \
  rbison \
  rdryad \
  rebird \
  rentrez \
  Reol \
  rfigshare \
  rfishbase \
  rfisheries \
  rgbif \
  rinat \
  RNeXML \
  rnoaa \
  rplos \
  RSelenium \
  rsnps \
  rWBclimate \
  solr \
  spocc \
  taxize \
  treebase \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds

