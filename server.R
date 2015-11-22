library(shiny)
library(markdown)
library(data.table)

set.seed(1000)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  new_data = reactive({ dist = rnorm(n = input$input_nbr, mean = input$input_mean, sd = 30) 
                        x = data.frame(AttainmentPercent = dist)
                        x$BonusAmount = ifelse(x$AttainmentPercent <= 50, 0, 
                                          ifelse(x$AttainmentPercent <= 100, (x$AttainmentPercent - 50) * 2, 
                                             ifelse(x$AttainmentPercent > 150, 300, 
                                                    100 + (x$AttainmentPercent - 100)*4 ))) * input$input_base/100
                        x$PerformanceGroup = ifelse(x$AttainmentPercent <= 50, "Poor - No Bonus", 
                                                    ifelse(x$AttainmentPercent <= 100, "Below Par", 
                                                           ifelse(x$AttainmentPercent > 150, "Top Performer", 
                                                                  "Above Par")))
                        x$AttainmentPercent = round(x$AttainmentPercent, 2)
                        x$BonusAmount = round(x$BonusAmount,0)
                        x = x[order(x$AttainmentPercent), ]
                        x
                     })
  
  output$aText = renderText({
                         this_data = new_data()
                         paste("Estimated Total Bonus is $", round(sum(this_data$BonusAmount),0))
                           })  
  
  
  output$aGraph = renderPlot({
                        this_data = new_data()
                        hist(this_data$BonusAmount,
                             main = "",
                             xlab = "Expected Bonus in US$",
                             col = "lightblue")
                             })
  
  output$bGraph = renderPlot({
                        this_data = new_data()
                        plot(x = this_data$AttainmentPercent,
                             y = this_data$BonusAmount,
                             main = "",
                             xlab = "Attainment %",
                             ylab = "Bonus $",
                             type = "l")
                      })
  
  output$aTable = renderDataTable({
                        this_data = new_data()
                        names(this_data) = c("Attainment %", "Bnous $", "Performance Group")
                        this_data
                             })

})