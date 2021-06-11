## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)

## ----readCSVhidden, echo = FALSE, eval = TRUE----
neuralgiaData <- read.csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")

## ----printCSV----------------------------------
head(neuralgiaData)

## ----getwd-------------------------------------
getwd()

## ----readCSV2, eval = TRUE---------------------
head(neuralgiaData)


## ----install1, eval=FALSE----------------------
## install.packages("readr")
## #can do multiple packages at once
## install.packages(c("readr", "readxl", "haven", "DBI", "httr"))

## ----libreq1-----------------------------------
library("readr")
require("haven")


## ----libreq2,error=TRUE,warning=TRUE-----------
library("notAPackage")
require("notAPackage")


## ----tidy, eval=FALSE--------------------------
## install.packages("tidyverse")

## ----loadTidy, message = TRUE------------------
library(tidyverse)


## ----readCSVex, eval = TRUE--------------------
dplyr::filter(neuralgiaData, Treatment == "P")


## ----readCSVex2, eval = TRUE, message = TRUE----
neuralgiaData2 <- readr::read_csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")


## ----viewData----------------------------------
neuralgiaData2


## ----class-------------------------------------
class(neuralgiaData2)


## ----simplify----------------------------------
neuralgiaData[,1]
neuralgiaData2[,1]


## ----pull--------------------------------------
pull(neuralgiaData2, 1) #or pull(neuralgiaData2, Treatment)
neuralgiaData2$Treatment 


## ----helpcsv, eval = FALSE---------------------
## help(read_csv)


## ----readSpace---------------------------------
read_table2("https://www4.stat.ncsu.edu/~online/datasets/chemical.txt")


## ----readTab-----------------------------------
read_tsv("https://www4.stat.ncsu.edu/~online/datasets/crabs.txt")


## ----readGeneral-------------------------------
read_delim("https://www4.stat.ncsu.edu/~online/datasets/umps2012.txt", delim = ">",
           col_names = c("Year", "Month", "Day", "Home", "Away", "HPUmpire"))

