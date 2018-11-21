## Test environments
* local Windows 10 install, R 3.5.1
* R-hub, with `check_rhub()`
* check_win_devel()`

## R CMD check results
There were no ERRORs or WARNINGs.

There were 2 NOTES:


* checking CRAN incoming feasibility ... NOTE
  Maintainer: 'Smith Martin R. <martin.smith@durham.ac.uk>'
  
  New submission
  
This package is a new submission.



* Suggests or Enhances not in mainstream repositories:
  Quartet

The package `Quartet`, currently in preparation for CRAN submission, was used to 
generate some of these data, and is used to generate package vignettes.  
The present package is also called in the `Quartet` package vignettes, and included
in its `Suggests` field.  

One option is to remove the affected vignette from this package, then create a
new submission once `Quartet` is available on CRAN, but this seems to create 
unnecessary administrative overhead for both you and me.  I'd be happy to hear
other suggestions.

## Downstream dependencies
There are currently no downstream dependencies for this package.
