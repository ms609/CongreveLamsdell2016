## Test environments
* local Windows 10 install, R 3.6.1
* ubuntu 16.04.6 LTS (on travis-ci), R devel
* Windows 10 via `check_win_devel(quiet = TRUE)`, R devel
* R-hub, Using `check_rhub(platforms = rhub::platforms()[[1]])`

## R CMD check results
There were no ERRORs or WARNINGs.

There were 2 NOTEs:

> Package suggested but not available for checking: ‘Quartet’

Quartet has been archived, but was re-submitted to CRAN on Dec 16th 2019.

The present package has been modified such that it will still compile if 
Suggested packages are not present, per §1.1.3.1 of 'Writing R Extensions'.

> * checking installed package size ... NOTE
>   installed size is  5.4Mb
>   sub-directories of 1Mb or more:
>     doc   4.5Mb

This is unchanged from the previous submission.

The package has been built with --compact-vignettes, which yields file size
reductions of ~20%.  The images in the vignettes are vector images (by design)
and I am aware of no obvious route to reducing their size further.

As this is primarily a data package, I do not envisage it being updated with any
frequency, which hopefully offsets the cost of its large file size.

## Downstream dependencies
There are currently no downstream dependencies for this package.
