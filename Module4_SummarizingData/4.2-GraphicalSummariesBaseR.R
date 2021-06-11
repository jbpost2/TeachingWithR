## ---- echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)

## ----echo=FALSE--------------------------------
titanicData <- read_csv("../datasets/titanic.csv")
titanicData


## ----------------------------------------------
table(titanicData$survived)


## ---- echo = TRUE, out.width = "450px", fig.align='center'----
barplot(table(titanicData$survived))


## ---- out.width = "450px", fig.align='center'----
twoTable <- table(titanicData$survived, titanicData$sex)
barplot(twoTable)


## ---- out.width = "450px", fig.align='center'----
twoTable <- table(titanicData$survived, titanicData$sex)
barplot(twoTable, legend = TRUE, args.legend = list(title="Survived"))


## ---- out.width = "450px", fig.align='center'----
twoTable <- table(titanicData$survived, titanicData$sex)
barplot(twoTable, beside = TRUE, legend = TRUE, args.legend=list(title="Survived"))


## ---- out.width = "450px", fig.align='center'----
barplot(twoTable, beside = TRUE, legend = c("Died", "Survived"),
        args.legend=list(title="Survived"))


## ----------------------------------------------
CO2 <- as_tibble(CO2)
CO2


## ----eval = TRUE, out.width = "450px", fig.align='center'----
hist(CO2$uptake)


## ----eval = TRUE, out.width = "450px", fig.align='center'----
hist(CO2$uptake, main = "Histogram of Uptake Values", breaks = 15, col = "Red")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
hist(CO2$uptake, main = "Histogram of Uptake Values", breaks = 15, col = "Red")
abline(v = mean(CO2$uptake), lwd = 3, lty = 2, col = "Blue")


## ---- echo = FALSE, out.width = "500px", fig.align='center'----
knitr::include_graphics("../img/kernel.png")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
plot(density(CO2$uptake), lwd = 3, col = "Blue", lty = 3)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
hist(CO2$uptake, main = "Histogram of Uptake Values", col = "Red", freq = FALSE)
lines(density(CO2$uptake), lwd = 3, col = "Blue", lty = 3)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
boxplot(uptake ~ Treatment, data = CO2, main = "Boxplot of Uptake by Treatment")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
boxplot(uptake ~ Treatment, data = CO2, 
        main = "Boxplot of Uptake by Treatment", horizontal = TRUE)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
boxplot(uptake ~ Treatment, data = CO2, 
        main = "Boxplot of Uptake by Treatment", col = "Grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
plot(x = CO2$conc, y = CO2$uptake) 


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
plot(x = CO2$conc, y = CO2$uptake, xlab = "Concentration", ylab = "Uptake",
     main = "Scatter Plot of Concentration and Uptake", pch = 2,
     ylim = c(0, max(CO2$uptake)))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
symbols <- ifelse(CO2$Treatment == "chilled", 3, 2)
plot(x = CO2$conc, y = CO2$uptake, pch = symbols)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
plot(x = CO2$conc, y = CO2$uptake, pch = symbols)
legend(x = 810, y = 18, legend = c("Chilled", "Non-Chilled"), pch = c(3, 2))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
plot(x = CO2$conc, y = CO2$uptake, xlab = "Concentration", ylab = "Uptake",
     main = "Scatter Plot of Concentration and Uptake", ylim = c(0, max(CO2$uptake)))
abline(lm(uptake ~ conc, data = CO2), lwd = 2, col = "Blue")


## ----------------------------------------------
paste("Hi", "What", "Is", "Going", "On", "?", sep = " ")
paste("Hi", "What", "Is", "Going", "On", "?", sep = ".")
paste0("Hi", "What", "Is", "Going", "On", "?")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
correlation <- cor(CO2$conc, CO2$uptake)
plot(x = CO2$conc, y = CO2$uptake, xlab = "Concentration", ylab = "Uptake",
     main = "Scatter Plot of Concentration and Uptake", ylim = c(0, max(CO2$uptake)))
abline(lm(uptake ~ conc, data = CO2), lwd = 2, col = "Blue")
text(x = 750, y = 10, cex = 2, 
     label = paste0("Correlation = ", round(correlation, 2)))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
plot(NULL, xlim = c(min(CO2$conc), max(CO2$conc)), ylim = c(min(CO2$uptake), max(CO2$uptake)), 
     main = "Scatter Plot of Concentration and Uptake", xlab = "Conc", ylab = "Uptake")
text(x = CO2$conc, y = CO2$uptake, label = CO2$Plant)


## ---- echo = TRUE, out.width = "600px", fig.align='center', message = FALSE, warning = FALSE----
pairs(iris)

