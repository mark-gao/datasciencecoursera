
## -------------------------------------
##  Programming with R
##  Programming Assignment 1 - Part 3
###      Yilong Gao (Mark)
###      November 15, 2014
## -------------------------------------

corr <- function(dir = "specdata", 
                          threshold = 0) {
  
  x <- complete(dir)
  qualifier <- x[x$nobs>threshold,]
  corr <- vector("numeric",nrow(qualifier))
  fnames <- paste0(dir,"/",paste0(formatC(qualifier$id, width = 3, flag = "0"),".csv"))
  if(length(corr)>0) {
    for ( i in 1:length(fnames)) {
      a <- read.csv(fnames[i])
      corr[i] <- cor(a[,2], a[,3], use = "complete.obs")
    } 
    #round(cr[sample(length(cr), 5)], 4)
    #round(corr,5)
    corr
  }
}




