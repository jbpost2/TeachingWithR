#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

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
            numericInput("alpha", "Alpha parameter", value = 1),
            numericInput("gamma", "Gamma parameter", value = 5),
            br(),
            actionButton("submit", "Change something"),
            numericInput("nbins", "Max # of bins", value = 50, min = 1)
        ),

        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("distPlot"),
            textOutput("myText"),
            tableOutput("myTable")
        )
    )
))
