## ----setup, echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(knitr)
knitr::opts_chunk$set(echo = TRUE, eval = TRUE, message = FALSE, warning = FALSE)


## ----calc2, echo=TRUE----------
#simple math operations
# <-- is a comment - code not evaluated
3 + 7
10 * exp(3) #exp is exponential function
log(pi^2) #log is natural log by default


## ----basic, echo = TRUE, out.width = "400px", fig.align='center'----
mean(cars$speed)
hist(cars$speed)


## ----save,echo=TRUE------------
#save for later
avg <- (5 + 7 + 6) / 3
#call avg object
avg
#strings (text) can be saved as well
words <- c("Hello there!", "How are you?")
words


## ----ls, echo = TRUE-----------
ls()


## ----rm, echo = TRUE-----------
rm(avg)
ls()
#rm(list = ls()) cleans up environment


## ----builtin, echo = TRUE------
letters
head(cars, n = 3)


## ----create, echo = TRUE-------
vec <- c(1, 4, 10)
vec


## ----create2, echo = TRUE------
fit <- lm(dist ~ speed, data = cars)
fit


## ----obj1, echo = TRUE---------
str(cars)


## ----vectorVis, echo = FALSE, fig.align='center', out.width = '650px'----
knitr::include_graphics("../img/vectorVisualF.png")


## ----vecs----------------------
#vectors (1 dimensional) objects
x <- c(17, 22, 1, 3, -3)
y <- c("cat", "dog", "bird", "frog")
x
y


## ----seq1----------------------
v <- seq(from = 1, to = 10, by = 2)
v
1:10


## ----dfVis, echo = FALSE, out.width = "500px", fig.align= 'center'----
knitr::include_graphics("../img/dfVisualF.png")


## ----df1,echo=TRUE-------------
x <- c("a", "b", "c", "d", "e", "f")
y <- c(1, 3, 4, -1, 5, 6)
z <- 10:15
data.frame(x, y, z)


## ----df2,echo=TRUE,eval=TRUE----
data.frame(char = x, data1 = y, data2 = z)


## ----csv, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/commaDelim.png")


## ----space, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/spaceDelim.png")


## ----tab, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/tabDelim.png")


## ----general, fig.align = 'left', out.width = '205px', out.height = "249px", eval = TRUE, echo = FALSE----
knitr::include_graphics("../img/generalDelim.png")


## ----loadR, fig.align = 'center', out.width = "250px", echo = FALSE----
include_graphics("../img/loadR.png")


## ---- eval = FALSE-------------
## install.packages("readr")


## ----install2, out.width = "800px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/packages.png")


## ----libreq1-------------------
library("readr")


## ----tidy, eval=FALSE----------
## install.packages("tidyverse")


## ----tidy2, eval=FALSE---------
## install.packages("tidyverse")


## ----loadTidy, message = TRUE----
library(tidyverse)


## ----readCSVex, eval = TRUE----
#stats::filter(...) calls time-series function from stats package
dplyr::filter(iris, Species == "virginica")


## ------------------------------
getwd()
#change with setwd()
#better to use R projects!


## ---- eval = FALSE-------------
## neuralgiaData <- read_csv("neuralgia.csv")


## ----readCSV2, eval = TRUE-----
neuralgiaData <- read_csv("https://www4.stat.ncsu.edu/~online/datasets/neuralgia.csv")
neuralgiaData


## ----class---------------------
str(neuralgiaData)


## ----pull----------------------
pull(neuralgiaData, 1) #or pull(neuralgiaData, Treatment)
neuralgiaData$Treatment 


## ---- echo = FALSE, fig.align='center', out.width = "500px"----
knitr::include_graphics("../img/filterVisualF.png")


## ---- echo = FALSE, fig.align='center', out.width = "400px"----
knitr::include_graphics("../img/selectVisualF.png")


## ---- echo = FALSE, fig.align='center', out.width = "520px"----
knitr::include_graphics("../img/createVarVisualF.png")


## ----startMD.png, out.width = "700px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMD.png")


## ----startMDDoc.png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMDDoc.png")


## ----startMDPres.png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMDPres.png")


## ----startMDShiny.png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/startMDShiny.png")


## ----chunk_png, out.width = "500px",echo=FALSE, fig.align='center'----
knitr::include_graphics("../img/chunk.png")


## ---- fig.align='center', message = FALSE, out.width=275, echo = FALSE----
knitr::include_graphics("../img/codeChunkGear.PNG")


## ---- echo = FALSE, fig.align='center'----
knitr::include_graphics("../img/compile.png")


## ----knit, echo=FALSE, fig.align='center', out.width='150px'----
knitr::include_graphics("../img/knit.png")


## ----leafletP, echo = TRUE, eval = FALSE----
## library(leaflet)
## leaflet() %>%
##   setView(174.764, -36.877, zoom = 16) %>%
##   addTiles() %>%
##   addMarkers(174.764, -36.877, popup = "Maungawhau")


## ----leafletE, echo = FALSE, eval = TRUE, fig.align='center'----
library(leaflet)
leaflet() %>%
  setView(174.764, -36.877, zoom = 16) %>% 
  addTiles() %>%
  addMarkers(174.764, -36.877, popup = "Maungawhau") 


## ----eval=TRUE-----------------
#install.packages("Lahman")
library(Lahman)
head(Batting, n = 4) #look at just first 4 observations


## ----eval=TRUE-----------------
myBatting <- as_tibble(Batting); myBatting


## ---- echo = FALSE, fig.align='center', out.width = "500px"----
knitr::include_graphics("../img/filterVisualF.png")


## ------------------------------
"hi" == " hi" #== is comparison
"hi" == "hi"
4 >= 1


## ------------------------------
4 != 1
sqrt(3)^2  == 3
dplyr::near(sqrt(3)^2, 3)


## ------------------------------
#use of is. functions
is.numeric("Word")
is.numeric(10)


## ------------------------------
is.character("10")
is.na(c(1:2, NA, 3))
is.matrix(c("hello", "world"))


## ------------------------------
myBatting$G > 20 #vector indicating Games > 20


## ------------------------------
filter(myBatting, G > 20)


## ------------------------------
(myBatting$G > 20) & (myBatting$yearID == 2015)


## ------------------------------
filter(myBatting, (G > 20) & (yearID == 2015))


## ------------------------------
#reorder by teamID
arrange(myBatting, teamID)


## ------------------------------
#get secondary arrangement as well
arrange(myBatting, teamID, G)


## ------------------------------
#descending instead
arrange(myBatting, teamID, desc(G))


## ---- echo = FALSE, fig.align='center', out.width = "400px"----
knitr::include_graphics("../img/selectVisualF.png")


## ------------------------------
#Choose a single column by name
select(myBatting, X2B)


## ------------------------------
#Choose more than one column by name
select(myBatting, playerID, X2B)


## ------------------------------
arrange(select(filter(myBatting, teamID == "PIT"), playerID, G, X2B), desc(X2B))


## ------------------------------
myBatting %>% 
  filter(teamID == "PIT") %>% 
  select(playerID, G, X2B) %>% 
  arrange(desc(X2B)) 


## ------------------------------
#all columns between
myBatting %>% 
  select(X2B:HR)


## ------------------------------
#all columns containing
myBatting %>% 
  select(contains("X"))


## ------------------------------
#all columns starting with
myBatting %>% 
  select(starts_with("X"))


## ------------------------------
#multiple selections
myBatting %>% 
  select(starts_with("X"), ends_with("ID"), G)


## ------------------------------
#reorder
myBatting %>% 
  select(playerID, HR, everything())


## ------------------------------
#rename our previous
myBatting %>% 
  select(starts_with("X"), ends_with("ID"), G) %>% 
  rename("Doubles" = X2B, "Triples" = X3B)


## ---- echo = FALSE, fig.align='center', out.width = "500px"----
knitr::include_graphics("../img/createVarVisualF.png")


## ----eval=TRUE-----------------
library(fivethirtyeight)
fandango


## ------------------------------
##Create an average rottentomatoes score variable
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2)


## ------------------------------
#can't see it!
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2) %>% 
  select(film, year, avgRotten, everything())


## ------------------------------
fandango %>% 
  mutate(avgRotten = (rottentomatoes + rottentomatoes_user)/2, 
         avgMeta = (metacritic_norm + metacritic_user_nom)/2) %>%
  select(film, year, avgRotten, avgMeta, everything())


## ------------------------------
fandango %>% 
  select(rottentomatoes) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ------------------------------
fandango %>% 
  select(year, rottentomatoes) %>% 
  group_by(year) %>% 
  mutate(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ------------------------------
fandango %>% 
  select(year, rottentomatoes) %>% 
  group_by(year) %>% 
  summarize(avg = mean(rottentomatoes), sd = sd(rottentomatoes))


## ------------------------------
myAirquality <- as_tibble(airquality)
myAirquality


## ------------------------------
myAirquality <- myAirquality %>% 
  mutate(Status = if_else(Wind >= 15, "HighWind",
                          if_else(Wind >= 10, "Windy",
                                  if_else(Wind >= 6, "LightWind", "Calm"))))
myAirquality


## ---- out.width="450px", echo = FALSE, fig.align='center'----
knitr::include_graphics("../img/longWideF.png")


## ----echo=TRUE-----------------
titanicData <- read_csv("titanic.csv")
#convert survival status to a factor
titanicData$survived <- as.factor(titanicData$survived)
levels(titanicData$survived) #R knows it isn't numeric now


## ---- error=TRUE, error = TRUE, message = TRUE, warning=TRUE----
titanicData$survived[1] <- "5"


## ----reread,echo = TRUE--------
levels(titanicData$survived) <- c("Died", "Survived")
levels(titanicData$survived)


## ----echo=TRUE-----------------
titanicData <- read_csv("titanic.csv")
titanicData$mySurvived <- as.factor(titanicData$survived)
levels(titanicData$mySurvived) <- c("Died", "Survived")
titanicData$myEmbarked <- as.factor(titanicData$embarked)
levels(titanicData$myEmbarked) <- c("Cherbourg", "Queenstown", "Southampton")
titanicData <- titanicData %>% drop_na(mySurvived, sex, myEmbarked)


## ---- eval=TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived))


## ----eval=TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived)) + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = mySurvived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = mySurvived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = mySurvived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## #global
## ggplot(data = titanicData, aes(x = mySurvived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = mySurvived))


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## #global
## ggplot(data = titanicData, aes(x = mySurvived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = mySurvived))


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived)) + 
  geom_bar() + 
  labs(x = "Survival Status", title = "Bar Plot of Survival for Titanic Passengers")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + geom_bar()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + 
  geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") +
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male"))


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") + 
  scale_x_discrete(labels = c("Person Died", "Person Survived")) + 
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male")) + 
  coord_flip()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + 
  geom_bar(position = "dodge")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived, fill = sex)) + 
  geom_bar(position = "fill")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = mySurvived)) + 
  geom_bar(aes(fill =sex), position = "dodge") +
  facet_wrap(~ myEmbarked)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g <- ggplot(titanicData, aes(x = age))
g + geom_density()


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g + geom_density(adjust = 0.5, alpha = 0.5, aes(fill = mySurvived))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g + geom_density(adjust = 0.5, alpha = 0.5, position = "stack", aes(fill = mySurvived))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g <- ggplot(titanicData, aes(x = mySurvived, y = age))
g + geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g + 
  geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1, alpha = 0.3)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g + 
  geom_jitter(width = 0.1, alpha = 0.3) + 
  geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g + geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1, alpha = 0.3) + 
  facet_wrap(~ myEmbarked)

