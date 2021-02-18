library("TreeTools", warn.conflicts = FALSE)
library("TreeSearch")
data("congreveLamsdellMatrices", package = "TreeSearch")
FILE_NUMS <- formatC(1:100, width = 3, format = 'd', flag = '0')
if (dir.exists('data-raw')) {
  origDir <- setwd('data-raw')
  on.exit(setwd(origDir))
}

for (i in 1:100) {
  tree <- MaximizeParsimony(congreveLamsdellMatrices[[i]], concavity = 'profile')
  ape::write.tree(tree, paste0('trees/pp/pp.', FILE_NUMS[i], '.tre'))
}
