library(shiny)

# http://rstudio.github.io/shiny/tutorial/#tabsets

# Define UI for application that plots 1991 DAX stock Indices 
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Welcome to Mark Gao Shiny site!"),
  
  # Sidebar with a slider input for day of the year
  sidebarPanel(
    h3("Daily Closing Prices of DAX Stock Indices, 1991"),
    
    sliderInput("obs", 
                "Day of the Year 1991:", 
                min = 1,
                max = 365, 
                value = 100),
  
    br(),
    h3("Documentation - User Guide"),
    p("This shiny app provides DAX daily stock index prices in 1991 (for demonstration purpose only)."),
    br(),
    p("Sliding the slider on the left side of User Interface to select from Day 1 to Day 365, the calendar date and the closing price index of that day will be shown on the right side of the User Interface. A plot of the whole year indices is provided, too. The green line on the plot is the date selected on the left. "),
    br(),
    p("Dataset: MASS"),
    p("Data:EuStockMarkets")
    ),
  # Show a plot of the generated distribution
  mainPanel(
    h3("Day of the Year 1991:"),
    verbatimTextOutput("day"),
    h3("Price:"),
    verbatimTextOutput("price"),
    plotOutput("distPlot")
  )
))