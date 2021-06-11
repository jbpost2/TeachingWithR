## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)

## ----------------------------------------------
"hi" == " hi" #== is comparison
"hi" == "hi"
4 >= 1


## ----------------------------------------------
4 != 1
sqrt(3)^2  == 3
dplyr::near(sqrt(3)^2, 3)


## ----------------------------------------------
#use of is. functions
is.numeric("Word")
is.numeric(10)


## ----------------------------------------------
is.character("10")
is.na(c(1:2, NA, 3))
is.matrix(c("hello", "world"))


## ----------------------------------------------
head(iris)


## ----eval=FALSE--------------------------------
iris[iris$Species == "setosa", ]


## ----------------------------------------------
iris$Species == "setosa" #vector indicating setosa values


## ----------------------------------------------
iris[iris$Species == "setosa", ]


## ----------------------------------------------
subset(iris, Species == "setosa")


## ----------------------------------------------
filter(iris, Species == "setosa")


## ----------------------------------------------
set.seed(3)
x <- runif(n = 10, min = 0, max = 1); x
(x < 0.25) | (x > 0.75)
(x < 0.25) || (x > 0.75)


## ----------------------------------------------
(iris$Petal.Length > 1.5) & (iris$Petal.Width > 0.3) & (iris$Species == "setosa")


## ---- eval = TRUE------------------------------
iris[(iris$Petal.Length > 1.5) & (iris$Petal.Width > 0.3) & (iris$Species == "setosa"), ]


## ----------------------------------------------
filter(iris, (Petal.Length > 1.5) & (Petal.Width > 0.3) & (Species == "setosa"))


## ----eval=TRUE---------------------------------
#install.packages("Lahman")
library(Lahman)
head(Batting, n = 4) #look at just first 4 observations


## ----------------------------------------------
Batting <- as_tibble(Batting)
Batting


## ----------------------------------------------
filter(Batting, teamID == "PIT")


## ----------------------------------------------
filter(Batting, teamID == "PIT" & yearID == 2000)


## ----------------------------------------------
#reorder by teamID
arrange(Batting, teamID)


## ----------------------------------------------
#get secondary arrangement as well
arrange(Batting, teamID, G)


## ----------------------------------------------
#descending instead
arrange(Batting, teamID, desc(G))


## ----------------------------------------------
#Choose a single column by name
select(Batting, X2B)


## ----------------------------------------------
#Choose a single column by name
select(Batting, playerID, X2B)


## ----------------------------------------------
arrange(select(filter(Batting, teamID == "PIT"), playerID, G, X2B), desc(X2B))


## ----------------------------------------------
Batting %>% filter(teamID == "PIT") %>% select(playerID, G, X2B) %>% arrange(desc(X2B)) 


## ----------------------------------------------
#all columns between
Batting %>% select(X2B:HR)


## ----------------------------------------------
#all columns containing
Batting %>% select(contains("X"))


## ----------------------------------------------
#all columns starting with
Batting %>% select(starts_with("X"))


## ----------------------------------------------
#multiple selections
Batting %>% select(starts_with("X"), ends_with("ID"), G)


## ----------------------------------------------
#reorder
Batting %>% select(playerID, HR, everything())


## ----------------------------------------------
#rename our previous
Batting %>% 
  select(starts_with("X"), ends_with("ID"), G) %>% 
  rename("Doubles" = X2B, "Triples" = X3B)

