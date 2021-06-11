## ---- echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)

## ----echo=FALSE--------------------------------
titanicData <- read_csv("../datasets/titanic.csv")
titanicData


## ----------------------------------------------
table(titanicData$embarked)


## ----------------------------------------------
table(titanicData$survived)
table(titanicData$sex)


## ----------------------------------------------
table(titanicData$survived,
      titanicData$sex)


## ----------------------------------------------
table(titanicData$survived,
      titanicData$embarked)
table(titanicData$sex,
      titanicData$embarked)


## ----------------------------------------------
table(titanicData$sex, titanicData$embarked, titanicData$survived)


## ----------------------------------------------
tab <- table(titanicData$sex, titanicData$embarked, titanicData$survived)

str(tab)


## ----echo=FALSE--------------------------------
str(tab)

## ----------------------------------------------
#returns embarked vs survived table for females
tab[1, , ]


## ----echo=FALSE--------------------------------
str(tab)

## ----------------------------------------------
#returns embarked vs survived table for males
tab[2, , ]


## ----echo=FALSE--------------------------------
str(tab)

## ----------------------------------------------
#returns survived vs sex table for embarked "C"
tab[, 1, ]


## ----echo=FALSE--------------------------------
str(tab)

## ----------------------------------------------
#Survived status for males that embarked at "Q"
tab[2, 2, ]


## ----------------------------------------------
CO2 <- tbl_df(CO2)
CO2


## ----------------------------------------------
mean(CO2$uptake)
#note you can easily get a trimmed mean
mean(CO2$uptake, trim = 0.05) #5% trimmed mean
median(CO2$uptake)


## ----------------------------------------------
#quartiles and mean
summary(CO2$uptake)


## ----------------------------------------------
var(CO2$uptake)
sd(CO2$uptake)


## ----------------------------------------------
IQR(CO2$uptake)
quantile(CO2$uptake, probs = c(0.1, 0.2))


## ----------------------------------------------
cov(CO2$conc, CO2$uptake)
cor(CO2$conc, CO2$uptake)


## ----------------------------------------------
CO2 %>% group_by(Treatment) %>% 
	summarise(avg = mean(uptake), med = median(uptake), var = var(uptake))


## ----------------------------------------------
CO2 %>% group_by(Treatment, conc) %>% 
		summarise(avg = mean(uptake), med = median(uptake), var = var(uptake))


## ----------------------------------------------
aggregate(x = CO2$uptake, by = list(CO2$Treatment), FUN = summary)


## ----------------------------------------------
aggregate(uptake ~ Treatment, data = CO2, FUN = summary)


## ---- eval = FALSE-----------------------------
## aggregate(uptake ~ Treatment, data = CO2, FUN = summary)


## ---- eval = FALSE-----------------------------
## aggregate(uptake ~ Treatment + conc, data = CO2, FUN = summary)


## ----------------------------------------------
aggregate(uptake ~ Treatment + conc, data = CO2, FUN = summary)

