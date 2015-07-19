## FUNCTION: rankhospital(state, outcome, num = "best")
## Return: the hospital that has the best, worst or num of ranking of 30-day mortality for the specified outcome in that state
rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outcome_data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  valid_outcome <- c("heart attack", "heart failure", "pneumonia")
  col <- integer()
  
  ## check if inputs are valid
  if (!(is.element(state, outcome_data$State))) stop("Invalid state")
  if (!(outcome %in% valid_outcome)) stop("Invalid outcome")
  
  ## get index of outcome
  if(outcome =="heart attack") col <- 11
  else if (outcome =="heart failure") col <- 17
  else if (outcome =="pneumonia") col <- 23
  else col <- 0
  
  #Convert measure col into numeric, ignore worning
  outcome_data[,col] <- suppressWarnings(as.numeric(outcome_data[,col]))
  
  #subsetting
  filtered <- outcome_data[outcome_data$State ==state,c(2, col)]
  filtered <- filtered[complete.cases(filtered),]
  
  if (is.numeric(num) & nrow(filtered) < num) return(NA)
  
  #sorting
  if(num=="best") {
    sorted <- filtered[order(filtered[,2], filtered[,1]),]
    result <- as.vector(sorted[1,1])
  }
  else if(num == "worst") {
    sorted <- filtered[order(-filtered[,2], filtered[,1]),]
    result <- as.vector(sorted[1,1])
  }
  else if(is.numeric(num) & num<=nrow(filtered)) {
    sorted <- filtered[order(filtered[,2], filtered[,1]),]
    result <- as.vector(sorted[num,1])
  }
  else return(NA)
  
  result
  #sorted
}