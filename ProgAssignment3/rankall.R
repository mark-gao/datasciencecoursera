## FUNCTION: rankall(outcome, num = "best")
## Return: the hospital that has the best, worst or num of ranking of 30-day mortality for the specified outcome in every state
rankall <- function(outcome, num = "best") {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  valid_outcome <- c("heart attack", "heart failure", "pneumonia")
  row <- integer()
  
  ## check if inputs are valid
  #if (!(is.element(state, outcome_data$State))) stop("Invalid state")
  if (!(outcome %in% valid_outcome)) stop("Invalid outcome")
  
  ## get index of outcome
  if(outcome =="heart attack") row <- 11
  else if (outcome =="heart failure") row <- 17
  else if (outcome =="pneumonia") row <- 23
  else row <- 0
  
  #Convert measure row into numeric, ignore worning
  outcome_data[,row] <- suppressWarnings(as.numeric(outcome_data[,row]))
  
  #subsetting
  filtered <- outcome_data[,c(2,7,row)]
  filtered <- filtered[complete.cases(filtered),]
  
  if (is.numeric(num) & nrow(filtered) < num) return(NA)
  #return(filtered)
  x <- filtered
  
  #sorting & ranking
  if(num=="best") {
    y<-lapply(split(x,x$State),function(x) {x[order(x[,3], x[,1]),]})
    row<- 1

  }
  else if(num == "worst") {
    y<-lapply(split(x,x$State),function(x) {x[order(-x[,3], x[,1]),]})
    row<- 1

  }
  else if(is.numeric(num) & num<=nrow(filtered)) {
    y<-lapply(split(x,x$State),function(x) {x[order(x[,3], x[,1]),]})
    row<- num

  }
  
  z <- lapply(y, function(x) x[row,])
  result <- cbind(do.call(rbind.data.frame, z), names(z)) 
  result <- result[,c(1,4)]
  names(result) <- c("hospital", "state")
  result

}