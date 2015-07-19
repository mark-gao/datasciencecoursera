
## -------------------------------------
##  Programming with R
##  Programming Assignment 1 - Part 1
###      Yilong Gao (Mark)
###      November 14, 2014
## -------------------------------------

pollutantmean <- function(dir = "specdata", 
                          pollutant = "sulfate",
                          id = 1:332) {
  
  fnames <- paste0(dir,"/",paste0(formatC(id, width = 3, flag = "0"),".csv"))
  sdata <- NULL
  for ( i in 1:length(fnames)) {
    tmp <- read.csv(fnames[i])
    sdata <- rbind(sdata, tmp[1:3])
  }  
#  lap <- lapply(fnames, read.csv)
#  sdata = ldply(lap)
  format(round(mean(sdata[,pollutant], na.rm = TRUE),3), nsmall = 3)
}




