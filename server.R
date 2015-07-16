library(shiny)
library(maps)

planes = read.csv("data/PlaneCrashDataFinal.csv")


library(maps)


shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      color <- switch(input$Var, 
                      "2004" = "darkgreen",
                      "2005" = "blue",
                      "2006" = "darkorange",
                      "2007" = "darkviolet",
                      "2008" = "darkblue",
                      "2009" = "orange",
                      "2010" = "darkred",
                      "2011" = "green",
                      "2012" = "purple",
                      "2013" = "blue",
                      "2014" = "red")
      
      tempData = subset(planes, Year == as.numeric(input$Var))
      
      map('world')
      points(y = tempData$Latitude, x = tempData$Longitude, col = color, pch = "x", cex = 1.65)
      
    })
   
    
    output$text1 <- renderText({
      
      paste("Commercial Airline Crashes in ", input$Var)
      
    })
    
    output$all <- renderPlot({
      
      map('world')
      points(y = planes$Latitude, x = planes$Longitude, col = "red", pch = "x" ,cex = 0.8)
      
    })
    
    output$text2 <- renderText({
      
      paste("Commercial Airline Crashes 2004 - 2014")
      
    })
    
  }
  
)