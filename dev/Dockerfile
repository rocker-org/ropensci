## Start with the rstudio image providing 'base R' as well as RStudio based on Debian testing
## Published on DockerHub as cboettig/ropensci:dev 

FROM rocker/ropensci:latest 
MAINTAINER Carl Boettiger cboettig@ropensci.org


## Additional dependencies
RUN Rscript -e 'source("http://bioconductor.org/biocLite.R"); biocLite("sangerseqR")'

## Github-dev versions of the R packages already on CRAN
## Non-alphabetized since order reflects package dependencies
RUN install2.r -r http://cran.rstudio.com -r http://carlboettiger.info/drat \ 
    grinat \
		gspocc \
		gAntWeb \
		gecoengine \
		grebird \
		grfishbase \
		grfisheries \
		gtreebase \
		grbhl \
		grgbif \
		gtaxize \
		grsnps \
		grentrez \
		grnoaa \
		grdryad \
		gRSelenium \
		grbison \
		gbold \
		grplos \
		gaRxiv \
		grAltmetric \
		galm \
		grfigshare \
		gdvn \
		gRNeXML \
		gsolr \
		gReol \
		grWBclimate \
    grnpn \
		grvertnet \
		ggender \
		ggeonames \
		gclifro \
		gecoretriever \
		gtraits \
		grebi \
		grorcid \
		gelife \
		grdatacite \
		gbmc \
		grcrossref \
		grmetadata \
		gEML \
		ggit2r \
		gtestdat \
		ggistr \
		gelastic \
		gplotly \
    ggeojsonio \
    gfulltext \ 
    grMaps \
    grfishbase \
&& rm -rf /tmp/downloaded_packages/

RUN R -e "update.packages(repos=c('http://cran.rstudio.com', 'http://carlboettiger.info/drat'))"

## Packages needing further configuration before install will work: 

#RUN Rscript -e 'devtools::install_github(paste0("ropensci/", c("paleobioDB", "rAvis")) 
