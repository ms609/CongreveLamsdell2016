#!/bin/sh

Rscript -e "rmarkdown::render('vignettes/Compare-methods.Rmd', 'all')"
Rscript -e "rmarkdown::render('vignettes/Compare-node-supports.Rmd', 'all')"
Rscript -e "rmarkdown::render('vignettes/Conduct-analyses.Rmd', 'all')"
