## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(dplyr)
options(dplyr.print_min = 5)
library(knitr)
library(readr)
library(plotly)
library(DT)
opts_chunk$set(echo = FALSE)


## ----session,echo=TRUE,eval=FALSE----------------
## shinyServer(function(input, output, session) {
##   ##  do stuff
## })


## ----session2,echo=TRUE,eval=FALSE---------------
## shinyServer(function(input, output, session) {
##   ##  do stuff
## })


## ----update, echo = TRUE, eval = FALSE-----------
## numericInput(inputId, label, value, min = NA, max = NA, step = NA,
##   width = NULL)
## 
## updateNumericInput(session, inputId, label = NULL, value = NULL,
##   min = NULL, max = NULL, step = NULL)


## ----update2, echo = TRUE, eval = FALSE----------
## numericInput(inputId, label, value, min = NA, max = NA, step = NA,
##   width = NULL)
## 
## updateNumericInput(session, inputId, label = NULL, value = NULL,
##   min = NULL, max = NULL, step = NULL)


## ----update-ftns, eval = TRUE, echo = FALSE------
library(shiny)
shinyApp(
  # Define UI for application that draws a histogram
  ui <- fluidPage(
     # Application title
     titlePanel("Old Faithful Geyser Data"),
     # Sidebar with a slider input for number of bins 
     sidebarLayout(
        sidebarPanel(
           sliderInput("bins", 
                       "Number of bins:", 
                       min = 1, 
                       max = 50, 
                       value = 30), 
           numericInput("maxBins",label="Set Maximum Number of Bins", value = 50, min = 1, max = 100)
        ),
        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
     )
  ),
  # Define server logic required to draw a histogram
  server <- function(input, output, session) {
     output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2] 
        bins <- seq(min(x), max(x), length.out = input$bins + 1)
        
        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')
     })
     
     observe({updateSliderInput(session,"bins",max=input$maxBins)})
  }
)


## ----updateslider,eval=FALSE,echo=TRUE-----------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##            sliderInput("bins", "Number of bins:",
##                        min = 1, max = 50, value = 30),
##            numericInput("maxBins", label = "Set Maximum Number of Bins",
##                         value = 50, min = 1, max = 100)
##         ),
##         ...
##   ),
##   server <- function(input, output, session) {
##       ...
##       updateSliderInput(session, "bins", max = input$maxBins)
##   }
## )


## ----updateslider2,eval=FALSE,echo=TRUE----------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##            sliderInput("bins", "Number of bins:",
##                        min = 1, max = 50, value = 30),
##            numericInput("maxBins", label = "Set Maximum Number of Bins",
##                         value = 50, min = 1, max = 100)
##         ),
##         ...
##   )
##   server <- function(input, output, session) {
##       ...
##       observe({updateSliderInput(session, "bins", max = input$maxBins)})
##   }


## ----html,echo=TRUE,eval=TRUE--------------------
print(fluidPage(titlePanel(title = "Hi"),
                sidebarLayout(sidebarPanel(), mainPanel())))


## ----html2,echo=TRUE,eval=TRUE-------------------
print(numericInput("id", "Label User Sees", value = 10))


## ----renderui-widget,eval=FALSE,echo=TRUE--------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##             uiOutput("slider"),
##             numericInput("maxBins", label = "Set Maximum Number of Bins",
##                          value = 50, min = 1, max = 100)
##         ),
##         ...
##   ),
##   server <- function(input, output, session) {
##       ...
##       output$slider <- renderUI({
##           sliderInput("bins", "Number of bins:", min = 1,
##                       max = input$maxBins, value = 30)
##       })
##   }


## ----renderui-info,eval=FALSE,echo=TRUE----------
##   ui <- fluidPage(
##         ...
##         sidebarPanel(
##              uiOutput("info"),
##              numericInput("purchase", label = "How Many?",
##                           value = 50, min = 0, max = 100)
##         ),
##         ...
##   ),
##   server <- function(input, output, session) {
##       ...
##         output$info <- renderUI({
##           text <- paste0("You have selected to buy ", input$purchase)
##           h3(text)
##         })
##   }


## ----renderui-ex,eval=TRUE,echo=FALSE------------
library(shiny)

shinyApp(
  # Define UI for application that draws a histogram
  shinyUI(fluidPage(
    
    # Application title
    titlePanel("Graph is Meaningless Here!"),
    
    # Sidebar 
    sidebarLayout(
      sidebarPanel(
         uiOutput("info"),
         numericInput("purchase",label="How Many?",
                      value=50,min=0,max=100)
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
    )
  )),
  shinyServer(function(input, output,session) {
   
    output$distPlot <- renderPlot({
  
      # draw the histogram with the specified number of bins
      hist(rnorm(input$purchase), col = 'darkgray', border = 'white')
      
    })
    
    output$info<-renderUI({
      text<-paste0("You have selected to buy ",input$purchase)
      h3(text)
    })

  })
)


## ----cond-panel-ex,echo=FALSE,eval=TRUE,message=FALSE----
library(shiny)
library(ggplot2)
library(dplyr)
data2<-filter(diamonds,(diamonds$depth>55)&(diamonds$depth<70))
shinyApp(
  # Define UI for application that draws a histogram
  shinyUI(fluidPage(
    
    # Application title
    titlePanel("Plots of Diamonds Data"),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
      sidebarPanel(
        selectInput("plotType", "Plot Type",
                    c(Scatter = "scatter",Histogram = "hist")),
        
        # Only show this panel if the plot type is a histogram
        conditionalPanel(condition = "input.plotType == 'hist'",
                         selectInput("breaks", "Breaks",
                                     c("Sturges","Scott","Freedman-Diaconis","[Custom]" = "custom")),
                         
           # Only show this panel if Custom is selected
          conditionalPanel(
            condition = "input.breaks == 'custom'",
            sliderInput("breakCount", "Break Count", min=1, max=200, value=40)
          )
        )
      ),
      
      # Show a plot of the generated distribution
      mainPanel(
         plotOutput("distPlot")
      )
    )
  )),
  # Define server logic required to draw a histogram
  shinyServer(function(input, output,session) {
     
    output$distPlot <- renderPlot({
  
      #depending on plot type create hist or scatterplot
      if(input$plotType=="scatter"){
        plot(x=data2$carat,y=data2$depth,xlab="Carat",ylab="Depth")
      } else {
        if(input$breaks=="custom"){
          hist(data2$depth,breaks=input$breakCount)
        } else {
          hist(data2$depth,breaks=input$breaks,xlab="Depth")
        }
      }
  
    })
    
  })
)


## ----cond-panel-syntax,echo=TRUE,eval=FALSE------
## ...
## sidebarPanel(
##   selectInput("plotType", "Plot Type",
##             c(Scatter = "scatter", Histogram = "hist")),
## 
##   # Only show this panel if the plot type is a histogram
##   conditionalPanel(condition = "input.plotType == 'hist'",
##           selectInput("breaks", "Breaks",
##                c("Sturges", "Scott", "Freedman-Diaconis", "[Custom]" = "custom")),
## 
##       # Secondary conditonalPanel, Only show this panel if Custom is selected
##       conditionalPanel(
##           condition = "input.breaks == 'custom'",
##           sliderInput("breakCount", "Break Count", min = 1, max = 200, value = 40)
##       )
##   )
## )


## ----custom-layout,eval=TRUE,echo=FALSE----------
shinyUI(fluidPage(
  fluidRow(
    column(2,"fluidRow with columns-----------------------------------------------------------------------"),
    column(6,"2nd column------------------------------------------------------------------------------------------------------------------------"),
    column(4,"column widths in a given row should add to 12-------------------------------------------------------------")),
  fluidRow(tags$hr()),
  fluidRow(
    column(6,"2nd fluidRow below above row--------------------------------------------------------------------------------------------"),
    column(6,
           fluidRow("Columns can contain their own fluidRow as well, allowing for a lot of customization of layouts!"),
           fluidRow(
             column(3,"subcol --------------------------------------------"),
             column(9,"subcol ----------------------------------------------------------------------------------------------------------------")
           ))
  )
))


## ----custom-layout2,eval=FALSE,echo=TRUE---------
## shinyUI(fluidPage(
##   fluidRow(
##     column(2,"fluidRow with columns--------...---------"),
##     column(6,"2nd column------------...--------"),
##     column(4,"column widths in a given row must add to 12------...---------")),
##   fluidRow(tags$hr()),
##   fluidRow(
##     column(6,"2nd fluidRow below above row----...-----"),
##     column(6,
##            fluidRow("Columns can contain their own fluidRow as well, allowing for a lot of customization of layouts!"),
##            fluidRow(
##              column(3,"subcol ----...-----"),
##              column(9,"subcol ----...-----")
##            ))
##   )
## ))

