library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  titlePanel("Bonus Cost Estimator"),
  sidebarLayout(
    
    # BEGIN - Side Bar Panel
    sidebarPanel( sliderInput("input_mean",
                              label = h5("Input Expected Mean Attainment in %"),
                              min = 20,
                              max = 150,
                              step = 1,
                              value = 100),
                  sliderInput("input_nbr",
                              label = h5("Input Number of Salesperson"),
                              min = 100,
                              max = 1000,
                              step = 20,
                              value = 100),
                  sliderInput("input_base",
                              label = h5("Input Base Pay in $"),
                              min = 5000,
                              max = 100000,
                              step = 1000,
                              value = 20000)
                ), # End - Side Bar Panel

    # BEGIN - Main Panel 
    mainPanel(
      textOutput ("aText"),
      tabsetPanel( tabPanel("Bonus Distribution", plotOutput ("aGraph")),
                   tabPanel("Bonus vs Attainment", plotOutput("bGraph")),
                   tabPanel("Simulation Data", tableOutput("aTable"))
                 )
              ) # End - Tab Set Panel
    ) # End - Main Panel
  ) # End - Fluid Page
) # End - Final Closure
