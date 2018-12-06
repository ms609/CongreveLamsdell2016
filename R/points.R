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
  if (class(dataset) == 'array') dataset <- list(dataset)
  entries <- names(dataset)
  if (is.null(entries)) entries <- seq_along(dataset)
  lapply(entries, function (weighting) {
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
    plotChar <- if (is.null(names(pch))) pch else pch[[weighting]]
    clPlotTheseAverageQuartets(dataset[[weighting]], col=col[weighting],
                               cex=cex, pch=plotChar, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Plot average for single dataset across all 100 trees
#' @export
clPlotTheseAverageQuartets <- function (dataset, cex=1.1, pch=2, col='black', ...) {
  JoinTheDots(apply(dataset[, c('r2', 'd', 's'), ], 2, rowMeans),
              col=col, cex=cex, pch=pch, ...)
}

#' Convert splits data to ternary-plottable points
#' @export
SplitsToPoints <- function (itemData) {
  rbind(r2 = itemData[, 'ref'] - itemData[, 'cf'],
         d = itemData[, 'cf_not_ref'],
         s = itemData[, 'cf_and_ref'])
}

#' @describeIn clPlotQuartets Splits equivalent of clPlotQuartets
#' @export
clPlotSplits <- function(dataset, tree, cex=1.1, pch=2, col=clColours, ...) {
  if (class(dataset) == 'array') dataset <- list(dataset)
  entries <- names(dataset)
  if (is.null(entries)) entries <- seq_along(dataset)
  lapply(entries, function (weighting) {
    JoinTheDots(SplitsToPoints(dataset[[weighting]][, , tree]),
                col=col[weighting], cex=cex, pch=pch, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Splits equivalent of clPlotTheseAverageQuartets
#' @export
clPlotTheseAverageSplits <- function (dataset, cex=1.1, pch=2, col='black', ...) {
  JoinTheDots(SplitsToPoints(apply(dataset[, , ], 2, rowMeans, na.rm=TRUE)),
              col=col, cex=cex, pch=pch, ...)
}

#' @describeIn clPlotQuartets Splits equivalent of clPlotTheseBestAverageQuartets
#' @export
clPlotTheseBestAverageSplits <- function (dataset, cex=1.1, pch=2, col='black', ...) {
  JoinTheDots(SplitsToPoints(t(as.matrix(rowMeans(dataset[1, , ])))),
                             col=col, cex=cex, pch=pch, ...)
}

#' @describeIn clPlotQuartets Splits equivalent of clPlotAverageQuartets
#' @export
clPlotAverageSplits <- function(dataset, cex=1.1, pch=2, col=clColours, ...) {
  lapply(names(dataset), function (weighting) {
    plotChar <- if (is.null(names(pch))) pch else pch[[weighting]]
    clPlotTheseAverageSplits(dataset[[weighting]], col=col[weighting],
                             cex=cex, pch=plotChar, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Splits equivalent of clPlotAverageQuartets
#' @export
clPlotBestAverageSplits <- function(dataset, cex=1.1, pch=2, col=clColours, ...) {
  lapply(names(dataset), function (weighting) {
    plotChar <- if (is.null(names(pch))) pch else pch[[weighting]]
    clPlotTheseBestAverageSplits(dataset[[weighting]], col=col[weighting],
                                 cex=cex, pch=plotChar, ...)
  })

  # Return:
  invisible()
}
