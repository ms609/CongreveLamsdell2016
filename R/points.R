#' Plot results
#'
#' @param cex,pch,\dots Graphical parameters to pass to
#' \code{\link[Ternary:AddToTernary]{JoinTheDots}}
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
#' @export
clPlotAverageQuartets <- function(dataset, cex=1.1, pch=2, col=clColours, ...) {
  lapply(names(dataset), function (weighting) {
    clPlotTheseAverageQuartets(dataset[[weighting]], col=col[weighting],
                               cex=cex, pch=pch, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets
#' @export
clPlotTheseAverageQuartets <- function (dataset, cex=1.1, pch=2, col='black', ...) {
  JoinTheDots(apply(dataset[, c('r2', 'd', 's'), ], 2, rowMeans),
              col=col, cex=cex, pch=pch, ...)
}
