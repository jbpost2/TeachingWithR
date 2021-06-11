## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)

## ---- eval = FALSE-----------------------------
tempsData <- read_table2(file = "https://www4.stat.ncsu.edu/~online/datasets/cityTemps.txt")
tempsData

## ---- echo = FALSE-----------------------------
tempsData


## ----------------------------------------------
tempsData %>% pivot_longer(cols = 2:8, names_to = "day", values_to = "temp")


## ----------------------------------------------
newTempsData <- tempsData %>% 
  pivot_longer(cols = sun:sat, names_to = "day", values_to = "temp")
newTempsData


## ----------------------------------------------
newTempsData %>% pivot_wider(names_from = "day", values_from = "temp")


## ---- eval = FALSE-----------------------------
chicagoData <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/Chicago.csv")
chicagoData

## ----------------------------------------------
chicagoData %>% separate(date, c("Month", "Day", "Year"), sep = "/", 
												 convert = TRUE, remove = FALSE)


## ----------------------------------------------
chicagoData %>% separate(date, c("Month", "Day", "Year"), sep = "/", 
												 convert = TRUE, remove = FALSE) %>%
  unite(MonthDay, Month, Day, sep = "-")

