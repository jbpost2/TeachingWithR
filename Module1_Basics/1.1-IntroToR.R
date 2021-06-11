## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)

## ----calc2, echo=TRUE--------------------------
#simple math operations
# <-- is a comment - code not evaluated
3 + 7
10 * exp(3) #exp is exponential function
log(pi^2) #log is natural log by default


## ----basic, echo = TRUE, out.width = "400px", fig.align='center'----
mean(cars$speed)
hist(cars$speed)


## ----save,echo=TRUE----------------------------
#save for later
avg <- (5 + 7 + 6) / 3
#call avg object
avg
#strings (text) can be saved as well
words <- c("Hello there!", "How are you?")
words


## ----ls, echo = TRUE---------------------------
ls()


## ----rm, echo = TRUE---------------------------
rm(avg)
ls()


## ----builtin, echo = TRUE----------------------
letters
head(cars, n = 3)


## ----panes, out.width = "700px",echo=FALSE, fig.align = "center"----
knitr::include_graphics("../img/panes.png")


## ----str1, echo = TRUE-------------------------
class(cars)


## ----str2, echo = TRUE-------------------------
class(exp)


## ----plot1, echo = TRUE, fig.align = 'center', out.width = '350px'----
plot(cars)


## ----plot2, echo = TRUE, fig.align = 'center', out.width = '350px'----
plot(exp)


## ----create, echo = TRUE-----------------------
vec <- c(1, 4, 10)
class(vec)

fit <- lm(dist ~ speed, data = cars)
class(fit)


## ----obj2, echo = TRUE-------------------------
class(cars)


## ----obj3, echo = TRUE-------------------------
typeof(cars)


## ----obj1, echo = TRUE-------------------------
str(cars)

