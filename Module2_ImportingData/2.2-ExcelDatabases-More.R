## ---- echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)
library(RSQLite)
library(methods)

## ---- warning = FALSE--------------------------
#install package if necessary
library(readxl)
#reads first sheet by default
edData <- read_excel("../datasets/censusEd.xlsx")
edData


## ----------------------------------------------
excel_sheets("../datasets/censusEd.xlsx")

## ----------------------------------------------
edData <- read_excel("../datasets/censusEd.xlsx", sheet = "EDU01A", 
                   range = cell_cols("A:D"))
edData


## ----eval=TRUE---------------------------------
#install if necessary
library(haven)
smokeData <- read_sas("https://www4.stat.ncsu.edu/~online/datasets/smoke2003.sas7bdat")
smokeData


## ----------------------------------------------
str(smokeData)


## ----------------------------------------------
attr(smokeData$SDDSRVYR, "label")


## ----eval=TRUE---------------------------------
bodyFatData <- read_spss("https://www4.stat.ncsu.edu/~online/datasets/bodyFat.sav")
bodyFatData

## ----------------------------------------------
baseURL <- "https://www.potterapi.com/v1/"
value <- "spells?"
key <- "key=$2a$10$UMvDCH.93fa2KOjKbJYkOOPMNzdzQpJ0gMnVEtcHzW5Ic04HUmcsa"
URL <- paste0(baseURL, value, key)
spellData <- RCurl::getURL(URL)


## ---- eval = FALSE-----------------------------
spellData

## ---- echo = FALSE-----------------------------
substr(spellData, 1, 100) 


## ---- warning = FALSE, message = FALSE---------
spellDataDF <- jsonlite::fromJSON(spellData)
as_tibble(spellDataDF)


## ---- echo = FALSE, eval = TRUE, message = FALSE, warning = FALSE----
library(XML)
returned <- ZillowR::GetDeepSearchResults(address = '14707 W SUNNY DR', citystatezip = "Los Angeles, CA", zws_id = "...") #you'll need to get your own id for this to work


## ---- eval = FALSE-----------------------------
returned <- ZillowR::GetDeepSearchResults(address = "14707 W SUNNY DR",
                               citystatezip = "Los Angeles, CA", zws_id = "...")

## ---- eval = TRUE, echo = TRUE-----------------
returned


## ---- eval = TRUE, echo = TRUE-----------------
returned$response


## ----------------------------------------------
#parse it via xml functions
rawDataValues <- xmlChildren(xmlChildren(xmlChildren(returned$response)$results)$result)

rawDataValues


## ----------------------------------------------
#simplify the remaining xml structure to a vector
rawDataVector <- unlist(sapply(xmlToList, X = rawDataValues))

#grab data of interest if it is there by using names
dataVector <- rawDataVector[c("address.street", "address.zipcode", "address.city", 
			                   "useCode", "taxAssessmentYear")]
dataVector


## ---- eval = FALSE-----------------------------
con <- DBI::dbConnect(RMySQL::MySQL(),
  host = "hostname.website",
  user = "username",
  password = rstudioapi::askForPassword("DB password")
)


## ---- eval = FALSE-----------------------------
tbl(con, "name_of_table")


## ---- eval = FALSE-----------------------------
#devtools::install_github("r-dbi/bigrquery")
library(DBI)
con <- dbConnect(
  bigrquery::bigquery(),
  project = "publicdata",
  dataset = "samples",
  billing = "your-project-id-here"
  )


## ---- eval = FALSE-----------------------------
dbListTables(con)
natality <- tbl(con, "natality")

natality %>%
  select(starts_with("mother"), year, cigarette_use, weight_pounds) %>%
  collect()

dbDisconnect(con)

