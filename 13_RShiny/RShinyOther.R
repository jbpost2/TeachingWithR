## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(dplyr)
options(dplyr.print_min = 5)
library(knitr)
library(readr)
library(plotly)
library(DT)
opts_chunk$set(echo = FALSE)


## ----common-code,eval=FALSE,echo=TRUE------------
## ## Code here that you only need to evaluate once.
## ## This can include reading in data, creation of
## ##      functions common to all sessions, and
## ##      reading of other common r scripts.
## 
## shinyServer(function(input, output) {
## 
## ## Code here that can be reactive.  Differs for
## ##      every instance of your app that runs.
## 
## })


## ----include-files, eval=F,echo=TRUE-------------
## ##  top of server.R, output from here is common to all users
## 
## #data set only read in once
## dat <- read_csv("dataset.csv")
## 
## #function created and not modified
## helper <- function(item1, item2) {item1 + item2}
## 
## shinyServer(function(input, output) {
##   ## reactive things, instance of app dependent
## })


## ----source, eval=F,echo=TRUE--------------------
## ##  top of server.R
## source("helpers.R")
## 
## shinyServer(function(input, output) {
##   ##  do stuff
## })


## ----isolate,echo=TRUE,eval=FALSE----------------
## renderPlot({
##          input$submit  # Do take a dependency on input$submit
##          hist(data, breaks = isolate(input$slider)) #don't depend on slider
## })


## ---- echo = TRUE, eval = FALSE------------------
## data <- reactive({
##   req("input$dist")
##   if(input$dist == "norm"){
##     dataVals <- rnorm(100)
##   } else if (input$dist == "unif"){
##     dataVals <- runif(100)
##   }
## })
## 
## output$plot <- renderPlot({
##   hist(data())
## })


## ----withMathJax,echo=TRUE,eval=FALSE------------
## fluidRow(
##     #add in latex functionality if needed
##     withMathJax(),
##           ...


## ----echo=TRUE,eval=FALSE------------------------
## shinyServer(function(input,output){
## 
##   #would now print to console
##   observe({print(input$NI + 10)})
## 
## }


## ----echo=TRUE,eval=FALSE------------------------
## shiny::runApp(app, display.mode="showcase")


## ----echo=TRUE,eval=FALSE------------------------
## options(shiny.error = browser)

