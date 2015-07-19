## FUNCTION: best(state, outcome)
## Return: the hospital that has the best ( lowest ) 30-day mortality for the specified outcome in that state
best <- function(state, outcome) {
  
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
    
    #sorting
    sorted <- filtered[order(filtered[,2], filtered[,1]),]
    
    as.vector(sorted[1,1])
}