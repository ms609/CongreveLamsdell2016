#' Initialize ternary plots for quartet plotting
#' @importFrom Ternary TernaryPlot
#' @importFrom Quartet SymmetricDifferencePoints
#' @export
clInitializeTernaryQuarts <- function (zoom = 1, padding = 0.1, gridLines = 10,
                                       fontSize = 1,
                                       gridCol = rgb(0.92, 0.92, 0.92),
                                       backgroundCol = rgb(0.985, 0.985, 0.992),
                                       xLim = c(0, 1 / zoom) - 0.01,
                                       yLim = c(0.5-(1 / zoom), 0.5)
                                       ) {
  lab <- if (zoom == 1) c("Unresolved quartets",
                          "Different quartets",
                          "Identical quartets") else rep('', 3)

  TernaryPlot(atip=NULL, btip=NULL, ctip=NULL,
              alab=lab[1], blab=lab[2], clab=lab[3],
              lab.cex=fontSize, lab.offset=0.13,
              point='right', isometric = TRUE,
              col=backgroundCol,
              grid.lty='solid', grid.col=gridCol, grid.lines=gridLines,
              grid.minor.lines = 0,
              axis.labels =
                if(zoom==1) round(seq(0, choose(22, 4), length.out=20), 0)
              else if (zoom == 3.5) round(seq(0, choose(22, 4), length.out=20), 0)
              else FALSE,
              axis.col=rgb(0.6, 0.6, 0.6),
              ticks.length = if (zoom == 1) 0.025 else 0.009,
              #axis.labels.col = if (zoom == 1) gridCol else rgb(0.6, 0.6, 0.6),
              padding=padding, xlim=xLim, ylim=yLim)
  SymmetricDifferenceLines(seq(0.1, 0.9, by=0.1), col = '#888888',
                           lty = "dotted")
  AddToTernary(lines, list(c(0, 2/3, 1/3), c(1, 0, 0)), lty='dotted',
               col=cbPalette8[8], lwd=2)
}

#' Initialize ternary plots for partition plotting
#' @export
clInitializeTernarySplits <- function(fontSize = 1, xlim=NULL, ylim=NULL,
                                      gridCol = rgb(0.92, 0.92, 0.92),
                                      padding=0.1) {
  TernaryPlot(NULL, NULL, NULL, #'Unresolved', 'Different', 'Same',
              alab="Unresolved partitions",
              blab="Different partitions",
              clab="Identical partitions",
              #alab=expression("Unresolved partitions" %->% ''),
              #blab=expression("" %<-% "Different partitions"),
              #clab=expression("Identical partitions" %->% ""),
              lab.cex=fontSize, lab.offset=0.12,
              col=BG_COL, point='right',
              grid.lines = 19, grid.lty='solid', grid.col=gridCol,
              grid.minor.lines = 0,
              axis.col=rgb(0.6, 0.6, 0.6),
              padding=padding, axis.labels = 0:19,
              xlim=xlim, ylim=ylim)
  SymmetricDifferenceLines(seq(0.1, 0.9, by=0.1), col = '#888888',
                           lty = "dotted")
}
