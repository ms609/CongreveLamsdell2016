#' Plot results
#'
#' Plots the results of the analyses of the Congreve & Lamsdell (2016) datasets.
#'
#' @param dataset Dataset to plot, for example `\link[=clResults]{clBootGcQuartets}`.
#' @param tree Integer specifying which tree to plot.
#' @param cex,pch,\dots Graphical parameters to pass to
#' \code{\link[Ternary:AddToTernary]{JoinTheDots}}.
#' @param col Named vector specifying colours to use to plot each analysis,
#' named to match `names(dataset)`.
#'
#' @return Returns [invisible].
#'
#' @importFrom Ternary JoinTheDots
#' @author Martin R. Smith
#' @export
clPlotQuartets <- function(dataset, tree, cex=1.1, pch=2,
                           col=CongreveLamsdell2016::clColours, ...) {
  if (inherits(dataset, 'array')) dataset <- list(dataset)
  entries <- names(dataset)
  if (is.null(entries)) entries <- seq_along(dataset)
  lapply(entries, function (weighting) {
    JoinTheDots(dataset[[weighting]][, c('r2', 'd', 's'), tree],
                col=col[weighting], cex=cex, pch=pch, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Plots average across all 100 trees.
#' @export
clPlotAverageQuartets <- function(dataset, cex=1.1, pch=2,
                                  col=CongreveLamsdell2016::clColours, ...) {
  lapply(names(dataset), function (weighting) {
    plotChar <- if (is.null(names(pch))) pch else pch[[weighting]]
    clPlotTheseAverageQuartets(dataset[[weighting]], col=col[weighting],
                               cex=cex, pch=plotChar, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Plot average for single dataset across all 100 trees.
#' @export
clPlotTheseAverageQuartets <- function (dataset, cex=1.1, pch=2, col='black', ...) {
  JoinTheDots(apply(dataset[, c('r2', 'd', 's'), ], 2, rowMeans),
              col=col, cex=cex, pch=pch, ...)
}

#' @describeIn clPlotQuartets Splits equivalent of `clPlotQuartets`.
#' @export
clPlotSplits <- function(dataset, tree, cex=1.1, pch=2,
                         col=CongreveLamsdell2016::clColours, ...) {
  if (inherits(dataset, 'array')) dataset <- list(dataset)
  entries <- names(dataset)
  if (is.null(entries)) entries <- seq_along(dataset)
  lapply(entries, function (weighting) {
    JoinTheDots(dataset[[weighting]][, c('r2', 'd2', 's'), tree],
                col=col[weighting], cex=cex, pch=pch, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Splits equivalent of `clPlotTheseAverageQuartets`.
#' @export
clPlotTheseAverageSplits <- function (dataset, cex=1.1, pch=2, col='black', ...) {
  JoinTheDots(apply(dataset[, c('r2', 'd2', 's'), ], 2, rowMeans, na.rm=TRUE),
              col=col, cex=cex, pch=pch, ...)
}

#' @describeIn clPlotQuartets Splits equivalent of `clPlotTheseBestAverageQuartets`.
#' @export
clPlotTheseBestAverageSplits <- function (dataset, cex=1.1, pch=2, col='black', ...) {
  JoinTheDots(t(as.matrix(rowMeans(dataset[1, c('r2', 'd2', 's'), ]))), col=col, cex=cex, pch=pch, ...)
}

#' @describeIn clPlotQuartets Splits equivalent of `clPlotAverageQuartets`.
#' @export
clPlotAverageSplits <- function(dataset, cex=1.1, pch=2,
                                col=CongreveLamsdell2016::clColours, ...) {
  lapply(names(dataset), function (weighting) {
    plotChar <- if (is.null(names(pch))) pch else pch[[weighting]]
    clPlotTheseAverageSplits(dataset[[weighting]], col=col[weighting],
                             cex=cex, pch=plotChar, ...)
  })

  # Return:
  invisible()
}

#' @describeIn clPlotQuartets Splits equivalent of `clPlotAverageQuartets`.
#' @export
clPlotBestAverageSplits <- function(dataset, cex=1.1, pch=2,
                                    col=CongreveLamsdell2016::clColours, ...) {
  lapply(names(dataset), function (weighting) {
    plotChar <- if (is.null(names(pch))) pch else pch[[weighting]]
    clPlotTheseBestAverageSplits(dataset[[weighting]], col=col[weighting],
                                 cex=cex, pch=plotChar, ...)
  })

  # Return:
  invisible()
}
