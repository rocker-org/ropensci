## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
## Published on DockerHub as cboettig/ropensci:dev 

FROM rocker/ropensci:latest 
MAINTAINER Carl Boettiger cboettig@ropensci.org


## Additional dependencies
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("sangerseqR")'

## Github-dev versions of the R packages already on CRAN
## Non-alphabetized since order reflects package dependencies
RUN installGithub.r \ 
    ropensci/rinat \
		ropensci/spocc \
		ropensci/AntWeb \
		ropensci/ecoengine \
		ropensci/rebird \
		ropensci/rfishbase \
		ropensci/rfisheries \
		ropensci/treebase \
		ropensci/rbhl \
		ropensci/rgbif \
		ropensci/taxize \
		ropensci/rsnps \
		ropensci/rentrez \
		ropensci/rnoaa \
		ropensci/rdryad \
		ropensci/RSelenium \
		ropensci/rbison \
		ropensci/bold \
		ropensci/rplos \
		ropensci/aRxiv \
		ropensci/rAltmetric \
		ropensci/alm \
		ropensci/rfigshare \
		ropensci/dvn \
		ropensci/RNeXML \
		ropensci/solr \
		ropensci/Reol \
		ropensci/rWBclimate \
&& rm -rf /tmp/downloaded_packages/

## Packages not yet on CRAN
## Non-alphabetized since order reflects package dependencies
RUN installGithub.r \
    emhart/biorxiv \
    ropensci/rnpn \
		ropensci/rvertnet \
		ropensci/gender \
		ropensci/geonames \
		ropensci/clifro \
		ropensci/ecoretriever \
		ropensci/traits \
		ropensci/rebi \
		ropensci/rorcid \
		ropensci/elife \
		ropensci/rdatacite \
		ropensci/bmc \
		ropensci/rcrossref \
		ropensci/rmetadata \
		ropensci/EML \
		ropensci/git2r \
		ropensci/testdat \
		ropensci/gistr \
		ropensci/elastic \
		ropensci/plotly \
    ropensci/geojsonio \
    ropensci/fulltext \ 
    ropensci/rMaps \
    ropensci/rfishbase \
&& rm -rf /tmp/downloaded_packages/


## Packages needing further configuration before install will work: 

#RUN Rscript -e 'devtools::install_github(paste0("ropensci/", c("paleobioDB", "rAvis")) 
