library(shiny)
library(MASS)
data("EuStockMarkets")

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output) {
  
  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically 
  #     re-executed when inputs change
  #  2) Its output type is a plot 
  #
  output$day <- renderPrint(format(as.Date(input$obs - 1, origin = "1991-01-01") , "%B %d-%Y"))
  output$price <- renderPrint(EuStockMarkets[input$obs, 1])
  output$distPlot <- renderPlot({
    
    # generate an rnorm distribution and plot it
    # dist <- rnorm(input$obs)
    # hist(dist)
      dax <- EuStockMarkets[1:365, 1]
      plot(dax, type="l", xlab="Day of the Year 1991", ylab= "Stock Price")
      abline(v = input$obs, col="green")
  })
})