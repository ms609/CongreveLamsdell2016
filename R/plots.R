#' Initialize ternary plots for quartet plotting
#'
#' Sets up a blank ternary plot ready for analytical results to be added.
#'
#' @param gridCol Colour, passed to `TernaryPlot` as `grid.col`.
#' @param backgroundCol Background colour, passed to `TernaryPlot` as `col`.
#' @param gridLines Number of grid lines, passed to `TernaryPlot` as `grid.lines`.
#' @param xLim,yLim x and y limits, passed to `TernaryPlot` as `xlim`, `ylim`.
#' @param isometric Logical specifying whether plot should be isometric, passed
#' to `TernaryPlot` as `isometric`.
#' @param fontSize Font size, passed to `TernaryPlot` as `lab.cex`.
#' @param padding Padding, passed to `TernaryPlot`.
#' @param zoom Level of magnification (times), used to adjust ticks and scale.
#'
#' @importFrom Ternary TernaryPlot HorizontalGrid AddToTernary
#' @importFrom graphics lines
#'
## @importFrom Quartet SymmetricDifferencePoints
#' @export
clInitializeTernaryQuarts <- function (zoom = 1, padding = 0.1, gridLines = 10,
                                       fontSize = 1,
                                       gridCol = "#dBdBdB",
                                       backgroundCol = "#FdFdFe",
                                       xLim = c(0, 1 / zoom) - 0.01,
                                       yLim = c(0.5-(1 / zoom), 0.5),
                                       isometric=TRUE
                                       ) {
  lab <- if (zoom == 1) c("unresolved quartets",
                          "different quartets",
                          "identical quartets") else rep('', 3)

  TernaryPlot(atip=NULL, btip=NULL, ctip=NULL,
              alab=lab[1], blab=lab[2], clab=lab[3],
              lab.cex=fontSize, lab.offset=0.18, # higher value as longer tick labels
              point='right', isometric = isometric,
              col=backgroundCol,
              grid.lty='solid', grid.col=gridCol, grid.lines=gridLines,
              grid.minor.lines = 0,
              axis.labels =
                if(zoom==1) round(seq(0, choose(22, 4), length.out=20), 0)
              else if (zoom == 3.5) round(seq(0, choose(22, 4), length.out=20), 0)
              else FALSE,
              axis.col="#999999",
              axis.cex=fontSize,
              axis.labels.col = "black",
              ticks.length = if (zoom == 1) 0.025 else 0.009,
              padding=padding, xlim=xLim, ylim=yLim)
  HorizontalGrid(gridLines)
  #SymmetricDifferenceLines(seq(0.1, 0.9, by=0.1), col = '#888888',
  #                         lty = "dotted")
  AddToTernary(lines, list(c(0, 2/3, 1/3), c(1, 0, 0)), lty='dotted',
               col=Ternary::cbPalette8[8], lwd=2)
}

#' @describeIn clInitializeTernaryQuarts Initialize ternary plots for
#' partition plotting.
#' @export
clInitializeTernarySplits <- function(fontSize = 1, xLim = NULL, yLim = NULL,
                                      gridCol = "#dBdBdB",
                                      backgroundCol = "#FdFdFe",
                                      padding=0.1, isometric=TRUE) {
  TernaryPlot(NULL, NULL, NULL,
              alab="unresolved partitions",
              blab="different partitions",
              clab="identical partitions",
              lab.cex=fontSize, lab.offset=0.16,
              col=backgroundCol, point='right',
              grid.lines = 19, grid.lty='solid', grid.col=gridCol,
              grid.minor.lines = 0,
              axis.col="#999999",
              axis.cex=fontSize,
              axis.labels.col = 'black',
              padding=padding, axis.labels = 0:19,
              xlim=xLim, ylim=yLim, isometric=isometric)
  HorizontalGrid(grid.lines=19)
}
