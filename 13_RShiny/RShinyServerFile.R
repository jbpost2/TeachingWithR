## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(dplyr)
options(dplyr.print_min = 5)
library(knitr)
library(readr)
library(plotly)
library(DT)
opts_chunk$set(echo = FALSE)


## ----server-basics, eval=FALSE,echo=TRUE---------
## ## set up server
## shinyServer(function(input, output, session) {
##   # add stuff
## })


## ----server-basics2, eval=FALSE,echo=TRUE--------
## ## set up server
## shinyServer(function(input, output, session) {
##   # add stuff
## })


## ----server-syntax,echo=TRUE,eval=FALSE----------
## shinyServer(function(input,output){
##   output$nameOfOutputObject <- renderPlot(
##     #code that will return a plot
##   )
## 
##   output$otherOutput <- renderText(
##     #code that will return something that R can coerce to a string
##   )
## })
## 
## #in ui.r file, reference would look like
## plotOutput("nameOfOutputObject")
## textOutput("otherOutput")


## ----input-ref,echo=TRUE,eval=FALSE--------------
## input$inputId


## ----input-ref2,echo=TRUE,eval=FALSE-------------
## input$inputId


## ----input-ref-ex,echo=TRUE,eval=FALSE-----------
## #input widget code from ui.r file
## sliderInput(inputId = "slide",label = "Select the Range Here",min = 0,max = 1,
##             value = c(0,1))
## #reference in server.r might look like
## output$userPlot<-renderPlot({
##   range<-input$slide
##   #create plot that changes based on user input
##   plot(data,xlim=range)
## })


## ----naming,echo=TRUE,eval=FALSE-----------------
## output$nameOfOutputObject <- renderPlot(...)


## ----naming2,echo=TRUE,eval=FALSE----------------
## output$nameOfOutputObject <- renderPlot(...)


## ----accessing,echo=TRUE,eval=FALSE--------------
## output$nameOfOutputObject <- renderPlot(
##    range <- input$slide
##    ...
## )


## ----reactivity,echo=TRUE,eval=FALSE-------------
## 
## ##code chunk "reacts" to and re-evaluates if
## ##input$sampleSize or input$otherInput changes
## 
## output$dataPlot <- renderPlot({
## 
##   n <- input$sampleSize
##   input$otherInput #not used anywhere else, but entire
##                    #renderPlot chunk still re-evaluates
##                    #if changed
## 
##   hist(rbinom(n = 1, size = n, prob = 0.4))
## 
## })


## ----bad-reactivity,echo=TRUE,eval=FALSE---------
## shinyApp(ui <- fluidPage(
##                 numericInput("NI", "Give me a number", value = 10),
##                 textOutput("string")
##                 ),
## 
##          shinyServer(function(input, output){
##                 print(input$NI + 10)
##                 output$string <- renderText(paste("value plus 10 is", input$NI + 10))
##          }
## ))


## ----reactive,echo=TRUE,eval=FALSE---------------
## shinyServer(function(input,output){
##   #Creates a new reactive variable
##   newVar <- reactive({
##     value <- c(input$NI + 10, input$NI * 3)
##   })
## 
##   output$textString <- renderText({
##     value <- newVar()  #access like a function!
##     paste0("Input plus 10 is ", value[1], " and Input times 3 is ", value[2])
##   })
## 
##   output$otherString <- renderText({
##   	value <- newVar()
##   	paste0(value[1], ",", value[2])
##   })
## })


## ----reactiveValues,echo=TRUE,eval=FALSE---------
## shinyServer(function(input,output){
##   #Creates a new reactive values
##   vals <- reactiveValues(data = rnorm(150), initial = 0)
## 
##   output$textString <- renderText({
##     paste0("The value of initial is ", vals$initial)
##   })
## 
##   output$hist <- renderPlot({
##     hist(vals$data)
##   })
## })


## ----correct-reactivity,echo=TRUE,eval=FALSE-----
## shinyServer(function(input,output){
##   #would now print to console
##   observe({print(input$NI+10)})
## 
## 	#update UI
## 	observe({
## 		input$noPitch
## 		updateCheckboxGroupInput(session, "pitchTypeChoice", selected = c(""))
## 	})
## })


## ----correct-reactivity2,echo=TRUE,eval=FALSE----
## shinyServer(function(input,output){
##   #would now print to console
##   observeEvent(input$NI, {print(input$data)})
## 
## 	#update UI
## 	observe({
## 		input$noPitch
## 		updateCheckboxGroupInput(session, "pitchTypeChoice", selected = c(""))
## 	})
## })


## ---- echo = TRUE--------------------------------
shinyServer(function(input,output){
  #would now print to console
  update <- eventReactive(input$submit, {list(gamma = input$gamma, alpha = input$alpha)})

	#update UI
	output$gammaDist <- renderText({
	  paste0("The parameters are ", update())
	})
})

