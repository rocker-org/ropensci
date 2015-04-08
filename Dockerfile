## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
FROM rocker/hadleyverse
MAINTAINER Carl Boettiger cboettig@ropensci.org

## Refresh package list and upgrade
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
    gdal-bin \
    icedtea-netx \
    libxslt1-dev \
    libgeos-dev \
    libgeos-c1 \
    libgdal1h \
    libgdal1-dev \
    libproj-dev \
    libv8-dev \
    netcdf-bin \
    python-pip \ 
&& apt-get build-dep -y r-cran-rgl 

## Install additional Omegahat dependencies, with fallback to Github-based install 
RUN rm -rf /tmp/*.rds \
&& install2.r --error \
    -r http://cran.rstudio.com \
    -r http://www.omegahat.org/R \
    -r http://datacube.wu.ac.at \
    drat \
    dismo \
    geiger \
    git2r \
    knitcitations \
    pander \
    phylobase \
    phytools \
    Rcampdf \
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
    ropensci/EML \
&& Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE)' \
&& pip install retriever \
&& rm -rf /tmp/downloaded_packages/ /tmp/*.rds 

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
