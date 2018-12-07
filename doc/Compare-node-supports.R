## ----initialize, echo=FALSE, message=FALSE-------------------------------
x <- Sys.setlocale("LC_ALL", "English_United Kingdom.1252") # allows PCH=183
library("Quartet")
library("Ternary")
library("CongreveLamsdell2016")
data('clBremPartitions', 'clBremQuartets', 'clMkvPartitions', 'clMkvQuartets',
     'clBootFreqPartitions', 'clBootFreqQuartets', 
     'clBootGcPartitions', 'clBootGcQuartets',
     'clJackFreqPartitions', 'clJackFreqQuartets',
     'clJackGcPartitions', 'clJackGcQuartets', 
     'clCI')

## ----initialize-variables, echo=FALSE------------------------------------
PCH_MK <- 1   # circle
PCH_EQ <- 61  #'='
PCH_XX <- 18 # 183 #'.' is invalid in some locales
PCH_IW <- 2   #triup
PCH_IC <- 17  #triupfilled
TREE <- 2

COL <- c(
  'mk' = paste0(cbPalette8[4],  '99'),
  'eq' = paste0(cbPalette8[8],  '99'),
  'k1' = paste0(cbPalette8[6],  '42'),
  'k2' = paste0(cbPalette8[6],  '42'),
  'k3' = paste0(cbPalette8[6],  '42'),
  'k5' = paste0(cbPalette8[6],  '42'),
  'kX' = paste0(cbPalette8[6],  '99'),
  'kC' = paste0(cbPalette8[2],  '99'))

GRID_COL <- rgb(0.92, 0.92, 0.92)
BG_COL   <- rgb(0.985, 0.985, 0.992)

PCH <- c(
  brem = 2,
  bootG = 0,
  bootF = 5,
  jackG = 3,
  jackF = 4,
  mk = 1
  
)

MARGINS <- c(2.8, 0.3, 0.3, 0.3)
ROWS <- c(20, 3)

TernaryQuarts <- function(TREE=TREE, an='eq', zoom=1, padding=0.1) {
  
  clInitializeTernaryQuarts(zoom=zoom, padding=padding)
  
  clPlotQuartets(pch=PCH['brem'] , cex=2.5, clBremQuartets[an], TREE)
  clPlotQuartets(pch=PCH['bootF'], cex=2.5, clBootFreqQuartets[an], TREE)
  clPlotQuartets(pch=PCH['bootG'], cex=2.5, clBootGcQuartets[an], TREE)
  clPlotQuartets(pch=PCH['jackF'], cex=2.5, clJackFreqQuartets[an], TREE)
  clPlotQuartets(pch=PCH['jackG'], cex=2.5, clJackGcQuartets[an], TREE)
  
  clPlotQuartets(pch=PCH['mk'], clMkvQuartets, TREE, cex=1.1, col=COL['mk'])
  
  # Return:
  invisible()
}

TernaryAllQuarts <- function(an='eq', zoom=1, padding=0.1) {
  
  clInitializeTernaryQuarts(zoom=zoom, padding=padding)
  
  clPlotAverageQuartets(pch=PCH['brem'] , cex=2.5, clBremQuartets[[an]])
  clPlotAverageQuartets(pch=PCH['bootF'], cex=2.5, clBootFreqQuartets[[an]])
  clPlotAverageQuartets(pch=PCH['bootG'], cex=2.5, clBootGcQuartets[[an]])
  clPlotAverageQuartets(pch=PCH['jackF'], cex=2.5, clJackFreqQuartets[[an]])
  clPlotAverageQuartets(pch=PCH['jackG'], cex=2.5, clJackGcQuartets[[an]])
  
  clPlotTheseAverageQuartets(pch=PCH['mk'], clMkvQuartets, cex=1.1, col=COL['mk'])
  
  # Return:
  invisible()
}


TernaryParts<-function(TREE=TREE, an='eq') {
  
  clInitializeTernarySplits()
  title(main="\nPartitions", cex.main=0.8)
  
  HorizontalGrid(19)
  
  clPlotSplits(pch=PCH['brem'] , cex=2.5, clBremPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['bootF'], cex=2.5, clBootGcPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['bootG'], cex=2.5, clBootFreqPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['jackF'], cex=2.5, clJackGcPartitions[[an]], TREE)
  clPlotSplits(pch=PCH['jackG'], cex=2.5, clJackFreqPartitions[[an]], TREE)
  
  clPlotSplits(pch=PCH['mk'], cex=1, clMkvPartitions, TREE, col=COL['mk'])
  
  # Return:
  invisible()
}

TernaryAllParts<-function(an='eq') {
  
  clInitializeTernarySplits()
  title(main="\nPartitions", cex.main=0.8)
  
  HorizontalGrid(19)
  
  clPlotAverageSplits(pch=PCH['brem'] , cex=2.5, clBremPartitions[[an]])
  clPlotAverageSplits(pch=PCH['bootF'], cex=2.5, clBootGcPartitions[[an]])
  clPlotAverageSplits(pch=PCH['bootG'], cex=2.5, clBootFreqPartitions[[an]])
  clPlotAverageSplits(pch=PCH['jackF'], cex=2.5, clJackGcPartitions[[an]])
  clPlotAverageSplits(pch=PCH['jackG'], cex=2.5, clJackFreqPartitions[[an]])
  
  clPlotTheseAverageSplits(pch=PCH['mk'], cex=1, clMkvPartitions, col=COL['mk'])
  
  # Return:
  invisible()
}

AddLegend <- function(pos='bottomright', an='eq') {
  legend(pos, cex=0.8, bty='n',
         lty=1,
         pch=PCH[c('mk', 'brem', 'bootF', 'bootG', 'jackF', 'jackG')], pt.cex=1.2,
         col=c(COL['mk'], rep(COL[an], 5)),
         legend=c('Markov', 'Bremer', 'BootFreq', 'Boot GC', 'Jack Freq', 'Jack GC')
   )
}

CompareNodeSupports <- function (i) { 
  
  TernaryQuarts(TREE=i, an='eq')
  title(main=paste0("\nQuartets"), cex.main=0.8)
  arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
  text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)
  
  TernaryQuarts(TREE=i, an='eq', zoom=3, padding=0.01)
  title(main=paste0("\nDataset ", i, ": CI=",round(clCI[i], 2)), cex.main=1.2)
  
  TernaryParts(TREE=i, an='eq')
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)
  
  AddLegend(an='eq')
  
  TernaryQuarts(TREE=i, an='k3')
  title(main=paste0("\nQuartets"), cex.main=0.8)
  arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
  text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)
  
  TernaryQuarts(TREE=i, an='k3', zoom=3, padding=0.01)
  
  TernaryParts(TREE=i, an='k3')
  
  arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
  text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)
  
  AddLegend(an='k3')
}

## ----Averages, echo=FALSE, fig.width=9, fig.height=6---------------------
par(mfrow=c(2, ROWS[2]), mar=MARGINS)
TernaryAllQuarts(an='eq')
title(main=paste0("\nQuartets"), cex.main=0.8)
arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)

TernaryAllQuarts(an='eq', zoom=3, padding=0.01)
title(main="\nAll datasets (averaged)", cex.main=1.2)

TernaryAllParts(an='eq')

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)

AddLegend(an='eq')

TernaryAllQuarts(an='k3')
title(main=paste0("\nQuartets"), cex.main=0.8)
arrows(sqrt(3/4) * 0.5, 0.5, sqrt(3/4) * 0.8, 0.5, length=0.1)
text  (sqrt(3/4) * 0.65, 0.5, pos=3, 'Decreasing resolution', cex=0.8)

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing divergence', cex=0.8, srt=270)

TernaryAllQuarts(an='k3', zoom=3, padding=0.01)

TernaryAllParts(an='k3')

arrows(sqrt(3/4) * 0.98, 0.40, sqrt(3/4) * 0.98, 0.20, length=0.1)
text  (sqrt(3/4) * 1.01, 0.30, pos=3, 'Increasing RF distance', cex=0.8, srt=270)

AddLegend(an='k3')

## ----compare-best, results='asis', echo=FALSE----------------------------
TreeBests <- function (dataset) vapply(dataset, function (item) 
  apply(apply(item, 1, function (x)
    QuartetDivergence(t(x))), 1, max), double(dim(dataset[[1]])[3]))

treeBests <- vapply(list(clBootGcQuartets, clBootFreqQuartets,
                         clJackGcQuartets, clJackFreqQuartets, clBremQuartets),
                    TreeBests, 
                    matrix(0, nrow=dim(clBootGcQuartets[[1]])[3],
                           ncol=length(clBootGcQuartets))
                    )



tests <- apply(treeBests, 2, function (slice)
  apply(slice, 2, function (column) t.test(column, slice[, 1])$p.value))

rownames(tests) <- c( 'Bootstrap GC', 'Bootstrap Freq',
                      'Jackknife GC', 'Jackknife Freq', 'Bremer')
knitr::kable(tests)


## ----1-10, echo=FALSE, fig.width=9, fig.height=60------------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(1:10, CompareNodeSupports)

## ----11-20, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(11:20, CompareNodeSupports)

## ----21-30, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(21:30, CompareNodeSupports)

## ----31-40, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(31:40, CompareNodeSupports)

## ----41-50, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(41:50, CompareNodeSupports)

## ----51-60, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(51:60, CompareNodeSupports)

## ----61-70, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(61:70, CompareNodeSupports)

## ----71-80, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(71:80, CompareNodeSupports)

## ----81-90, echo=FALSE, fig.width=9, fig.height=60-----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(81:90, CompareNodeSupports)

## ----91-100, echo=FALSE, fig.width=9, fig.height=60----------------------
par(mfrow=ROWS, mar=MARGINS)
x <- lapply(91:100, CompareNodeSupports)

