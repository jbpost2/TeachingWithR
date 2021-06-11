## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)

## ----------------------------------------------
temp <- cbind(iris, extra = rep("a", 150))
str(temp)


## ----------------------------------------------
iris$extra <- rep("a", 150)
str(iris)


## ----eval=TRUE---------------------------------
library(fivethirtyeight)
fandango


## ----------------------------------------------
##Create an average rottentomatoes score variable
fandango %>% mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2)


## ----------------------------------------------
#can't see it!
fandango %>% mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2) %>% 
  select(film, year, avgRotten, everything())


## ----------------------------------------------
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2, 
         avgMeta = (metacritic_norm + metacritic_user_nom)/2) %>%
  select(film, year, avgRotten, avgMeta, everything())


## ----------------------------------------------
#transmute will keep the new variable(s) only
fandango %>% transmute(avgRotten = (rottentomatoes + rottentomatoes_user)/2)


## ----------------------------------------------
#transmute will keep the new variable(s) only
fandango %>% transmute(avgRotten = (rottentomatoes + rottentomatoes_user)/2, 
                       avgMeta = (metacritic_norm + metacritic_user_nom)/2) 


## ----------------------------------------------
fandango %>% select(rottentomatoes) %>% mutate(cumulativeSum = cumsum(rottentomatoes))


## ----------------------------------------------
fandango %>% select(rottentomatoes) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ----------------------------------------------
fandango %>% select(year, rottentomatoes) %>% 
  group_by(year) %>% mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))

## ----------------------------------------------
airquality <- as_tibble(airquality)
airquality

## ---- error = TRUE, message = TRUE, warning = TRUE----
if(airquality$Wind >= 15) { 
  "High Wind"
  }

## ----------------------------------------------
for (i in 1:10){
  print(i)
}


## ----------------------------------------------
for (index in c("cat","hat","worm")){
  print(index)
}


## ----------------------------------------------
status<-vector() #initialize vector to save results

for (i in 1:nrow(airquality)){
  if(airquality$Wind[i] >= 15){
    status[i] <- "HighWind"
  } else if (airquality$Wind[i] >= 10){
    status[i] <- "Windy"
  } else if (airquality$Wind[i] >= 6){
    status[i] <- "LightWind"
  } else if (airquality$Wind[i] >= 0){
    status[i] <- "Calm"
  } else {
    status[i] <- "Error"
  }
}


## ----------------------------------------------
airquality$status <- status
airquality$status


## ----------------------------------------------
for (i in 1:5){
	if (i == 3){ 
	  break 
	  }
  print(i)
}


## ----------------------------------------------
for (i in 1:5){
	if (i == 3){
	  next
	} 
  print(i)
}


## ----------------------------------------------
ifelse(airquality$Wind >= 15, "HighWind",
          ifelse(airquality$Wind >= 10, "Windy",
                 ifelse(airquality$Wind >= 6, "LightWind", "Calm")))


## ----------------------------------------------
mutate(airquality, status = ifelse(airquality$Wind >= 15, "HighWind",
                                ifelse(airquality$Wind >= 10, "Windy",
                                       ifelse(airquality$Wind >= 6, "LightWind", "Calm")))
)


## ----------------------------------------------
#install if needed
library(microbenchmark)


## ----------------------------------------------
loopTime <- microbenchmark(
  for (i in 1:nrow(airquality)){
    if(airquality$Wind[i] >= 15){
      status[i] <- "HighWind"
    } else if (airquality$Wind[i] >= 10){
      status[i] <- "Windy"
    } else if (airquality$Wind[i] >= 6){
      status[i] <- "LightWind"
    } else if (airquality$Wind[i] >= 0){
      status[i] <- "Calm"
    } else{
      status[i] <- "Error"
    }
  }
, unit = "us")


## ----------------------------------------------
vectorTime <- microbenchmark(
  ifelse(airquality$Wind >= 15, "HighWind",
            ifelse(airquality$Wind >= 10, "Windy",
                   ifelse(airquality$Wind >= 6, "LightWind", "Calm")))
, unit = "us")


## ----------------------------------------------
loopTime
vectorTime

