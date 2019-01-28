## Test environments
* local Windows 10 install, R 3.5.2
* R-hub, with `check_rhub()`
* Windows, R devel, with `check_win_devel()`

## R CMD check results
There were no ERRORs or WARNINGs.

There were 2 NOTEs:

>  * checking CRAN incoming feasibility ... NOTE
> Maintainer: 'Smith Martin R. <martin.smith@durham.ac.uk>'
> 
> New submission
  
This package is a new submission.

> Found the following (possibly) invalid URLs:
>   URL: https://doi.org/10.1098/rsbl.2018.0632
>     From: README.md
>     Status: 404
>     Message: Not Found
> 
> Found the following (possibly) invalid DOIs:
>   DOI: 10.1098/rsbl.2018.0632
>     From: DESCRIPTION
>     Status: Not Found
>     Message: 404

The doi 10.1098/rsbl.2018.0632 is valid, but has not yet been activated
at CrossRef; it will go live once the associated paper is published.

> * checking installed package size ... NOTE
>   installed size is  5.4Mb
>   sub-directories of 1Mb or more:
>     doc   4.5Mb

The package has been built with --compact-divnettes, which yields file size
reductions of ~20%.  The images in the vignettes are vector images and I am
aware of no obvious route to reducing their size further.

For what it's worth, this is primarily a data package, so I do not envisage it
being updated with any frequency, which hopefully offsets the cost of its large
file size.

## Downstream dependencies
There are currently no downstream dependencies for this package.
