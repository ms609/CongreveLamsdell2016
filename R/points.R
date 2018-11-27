#' Plot results
#'
#' @param cex,pch,\dots Graphical parameters to pass to [Ternary:JoinTheDots]
#' @param tree Integer specifying which tree to plot
#' @param col Named vector specifying colour in which to plot each analysis
#'
#' @return Returns [invisible].
#' @importFrom Ternary JoinTheDots
#' @author Martin R. Smith
#' @export
clPlotQuartets <- function(dataset, tree, cex=1.1, pch=2, col=clColours, ...) {
  lapply(names(dataset), function (weighting) {
    JoinTheDots(dataset[[weighting]][, c('r2', 'd', 's'), tree],
                col=col[weighting], cex=cex, pch=pch, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Plots average across all 100 trees
clPlotAverageQuartets <- function(dataset, cex=1.1, pch=2, col=clColours, ...) {
  lapply(names(dataset), function (weighting) {
    JoinTheDots(apply(dataset[[weighting]][, c('r2', 'd', 's'), ], 2, rowMeans),
                col=col[weighting], cex=cex, pch=pch, ...)
  })

  # Return:
  invisible()
}

