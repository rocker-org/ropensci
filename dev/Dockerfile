## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
## Published on DockerHub as cboettig/ropensci:dev 

FROM rocker/ropensci 
MAINTAINER Carl Boettiger cboettig@ropensci.org


## Additional dependencies
RUN installGithub.r ramnathv/rCharts \
&& install2.r --error --repos http://datacube.wu.ac.at Rcampdf \
&& Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("rhdf5", ask=FALSE); biocLite("BiocInstaller")' \
&& rm -rf /tmp/downloaded_packages/

## Github-dev versions of the R packages already on CRAN
## Non-alphabetized since order reflects package dependencies
RUN installGithub.r --deps TRUE \ 
    ropensci/rinat \
		ropensci/spocc \
		ropensci/AntWeb \
		ropensci/ecoengine \
		ropensci/rebird \
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
RUN installGithub.r --deps TRUE \
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
		ropensci/togeojson \ 
    ropensci/fulltext \ 
    ropensci/rMaps \
    ropensci/rfishbase \
&& rm -rf /tmp/downloaded_packages/


## Packages needing further configuration before install will work: 

#RUN Rscript -e 'devtools::install_github(paste0("ropensci/", c(rfishbase", "paleobioDB", "rAvis")) 
