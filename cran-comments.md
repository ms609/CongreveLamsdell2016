## Test environments
* local Windows 10 install, R 3.5.2
* R-hub, with `check_rhub()`
* Windows, R devel, with `check_win_devel()`

## R CMD check results
There were no ERRORs or WARNINGs.

There were 2 NOTEs:


> * checking CRAN incoming feasibility ... NOTE
> Maintainer: 'Martin R. Smith <martin.smith@durham.ac.uk>'
> 
> Days since last update: 2

This package has been resubmitted to address a request from Uwe Ligges:
> Please omit the citation (it is in the Description already) and 
> make the rest title case.


> * checking installed package size ... NOTE
>   installed size is  5.4Mb
>   sub-directories of 1Mb or more:
>     doc   4.5Mb

The package has been built with --compact-vignettes, which yields file size
reductions of ~20%.  The images in the vignettes are vector images (by design)
and I am aware of no obvious route to reducing their size further.

For what it's worth, this is primarily a data package, so I do not envisage it
being updated with any frequency, which hopefully offsets the cost of its large
file size.

## Downstream dependencies
There are currently no downstream dependencies for this package.
