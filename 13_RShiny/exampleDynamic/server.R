#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to draw a histogram
shinyServer(function(input, output, session) {

    data <- reactive({
        params <- c(input$alpha, input$gamma)
        randomValues <- rgamma(input$bins, shape = params[1], rate = params[2])
        list(ran = randomValues, alpha = params[1], gamma = params[2])
    })
    
    observeEvent(input$submit, {print(input$alpha)})
    
    data2 <- eventReactive(input$submit, {
        input$bins
    })
    
    observeEvent(input$submit, {updateSliderInput(session, "bins", max = input$nbins)})
    
    output$distPlot <- renderPlot({

        # generate bins based on input$bins from ui.R
        x    <- faithful[, 2]
        bins <- seq(min(x), max(x), length.out = data2() + 1)

        # draw the histogram with the specified number of bins
        hist(x, breaks = bins, col = 'darkgray', border = 'white')

    })
    
    output$myText <- renderText({
        info <- data()
        paste0("The value of the slider is ", input$bins, ". The alpha parameter is ", info$alpha, " First data value is ", info$ran[1])
    })
    
    output$myTable <- renderTable({
        info <- data()
        data.frame(gamma = info$ran)
    })

})
