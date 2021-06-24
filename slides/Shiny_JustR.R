## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(shiny)
library(dplyr)
library(knitr)
library(ggplot2)
opts_chunk$set(echo = FALSE)


## ----eruptions----------------------------
inputPanel(
  selectInput("n_breaks", label = "Number of bins:",
              choices = c(10, 20, 35, 50), selected = 20),
  
  sliderInput("bw_adjust", label = "Bandwidth adjustment:",
              min = 0.2, max = 2, value = 1, step = 0.2)
)

renderPlot({
  hist(faithful$eruptions, probability = TRUE, breaks = as.numeric(input$n_breaks),
       xlab = "Duration (minutes)", main = "Geyser eruption duration")
  
  dens <- density(faithful$eruptions, adjust = input$bw_adjust)
  lines(dens, col = "blue")
})


## ---- echo = FALSE, fig.align='center', out.width="40%"----
knitr::include_graphics("shinyDoc.PNG")


## ---- out.width = "85%", fig.align='center'----
knitr::include_graphics("widgets.PNG")


## ---- eval = FALSE, echo = TRUE-----------
## numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
## sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- echo = FALSE------------------------
numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- out.width = "85%", fig.align='center'----
knitr::include_graphics("tags.PNG")


## ---- eval = FALSE, echo = TRUE-----------
## h2("First App title!")
## a("RStudio link", href = "https://www.RStudio.com")
## numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
## sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- echo = FALSE------------------------
h2("First App title!")
a("RStudio link", href = "https://www.RStudio.com")
numericInput("num", "Enter a Number", value = 0, min = 0, max = 100)
sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)


## ---- echo = TRUE, eval = FALSE-----------
## h2("First App title!")
## 
## inputPanel(
##   a("RStudio link", href = "https://www.RStudio.com"),
##   numericInput("num", "Enter a Number", value = 0, min = 0, max = 100),
##   sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)
## )


## ---- echo = FALSE------------------------
h2("First App title!")

inputPanel(
  a("RStudio link", href = "https://www.RStudio.com"),
  numericInput("num", "Enter a Number", value = 0, min = 0, max = 100),
  sliderInput("slide", label = "A Slider!", min = 0, max = 1, value = 0.5, step = 0.05)
)


## ---- fig.align='center', out.width="60%"----
knitr::include_graphics("render.PNG")


## ---- echo = TRUE, eval = FALSE-----------
## inputPanel(
##   checkboxInput("addColor", "Color")
## )
## 
## renderPlot({
##   g <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width))
##   if(input$addColor){
##     g + geom_point(aes(color = Species))
##   } else {
##       g + geom_point()
##   }
## })


## ---- echo = FALSE, fig.width=5-----------
inputPanel(
  checkboxInput("addColor", "Color")
)

renderPlot({
  g <- ggplot(iris, aes(x = Sepal.Length, y = Sepal.Width)) 
  if(input$addColor){g + geom_point(aes(color = Species))} else {g + geom_point()}
})


## ---- echo = TRUE, message = FALSE, warning = FALSE----
simData <- replicate(1000, rexp(n = 50, rate = 1)) %>% 
  as_tibble()
simData


## ---- echo = TRUE, eval = FALSE-----------
## inputPanel(
##   numericInput("sampleSize", label = "Sample Size",
##                min = 2, max = 50, value = 10, step = 1),
##   sliderInput("numSamples", label = "Number of Simulations",
##               min = 1, max = 1000, value = 1, step = 1,
##               animate = animationOptions(interval = 325))
## )
## 
## renderPlot({
##       ggplot(simData %>%
##                slice_head(n = input$sampleSize) %>%
##                select(1:input$numSamples) %>%
##                colMeans() %>%
##                as_tibble(),
##              aes(x = value)) +
##         geom_histogram(color = "Blue", size = 2)
##     })


## ---- echo = FALSE, out.width=4-----------
inputPanel(
  numericInput("sampleSize", label = "Sample Size", min = 2, max = 50, value = 10, step = 1),
  sliderInput("numSamples", label = "Number of Simulations", min = 1, max = 1000, value = 1, step = 1, animate = animationOptions(interval = 325))
)

renderPlot({
      ggplot(simData %>% 
               slice_head(n = input$sampleSize) %>% 
               select(1:input$numSamples) %>% 
               colMeans() %>% 
               as_tibble(), 
             aes(x = value)) + 
        geom_histogram(color = "Blue", size = 2)  
    })

