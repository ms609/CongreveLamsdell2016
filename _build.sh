#!/bin/sh

Rscript -e "rmarkdown::render('vignettes/Compare-methods.Rmd', 'all', output_dir='./doc')"
Rscript -e "rmarkdown::render('vignettes/Compare-node-supports.Rmd', 'all', output_dir='./doc')"
Rscript -e "rmarkdown::render('vignettes/Conduct-analyses.Rmd', 'all', output_dir='./doc')"
Rscript -e "devtools::build_manual('.', './doc')"
