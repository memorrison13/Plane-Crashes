#install.packages("shiny")
#install.packages("maps")

library(shiny)
library(maps)

shinyUI(navbarPage("Welcome!",
   
   tabPanel("Plane Crashes By Year",                 
  
   headerPanel("Where In The World Do Planes Crash?"),
   
   sidebarLayout(
                     
      sidebarPanel(
                       
          selectInput("Var",  "Select a Year:",
                    choices = list("2004", "2005", "2006", "2007",
                    "2008", "2009", "2010", "2011",
                    "2012", "2013", "2014"))
                       
                     ),
      
      mainPanel(
        
        h2(textOutput("text1")), 
        plotOutput("map")  
      
      )
  
      
   )),
  
  tabPanel("Summary",
    
    headerPanel("Where In The World Do Planes Crash?"),
           
    mainPanel(
      
      h2(textOutput("text2")),
      plotOutput("all")
      
      
    )
    
  )
  
))