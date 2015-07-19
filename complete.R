
## -------------------------------------
##  Programming with R
##  Programming Assignment 1 - Part 2
###      Yilong Gao (Mark)
###      November 14, 2014
## -------------------------------------

complete <- function(dir = "specdata", 
                           id = 1:332) {
  
  fnames <- paste0(dir,"/",paste0(formatC(id, width = 3, flag = "0"),".csv"))
  sdata <- matrix(,length(id), 2)
  colnames(sdata) <- c("id", "nobs")
  for ( i in 1:length(fnames)) {
    tmp <- read.csv(fnames[i])
    sdata[i,] <- c(id[i], nrow(tmp[complete.cases(tmp),]))
  }  
  as.data.frame(sdata)
}




