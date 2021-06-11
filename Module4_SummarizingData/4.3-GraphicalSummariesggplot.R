## ---- echo = FALSE, message = FALSE, warning = FALSE----
library(tidyverse)
library(haven)
library(knitr)

## ----echo=TRUE---------------------------------
titanicData <- read_csv("../datasets/titanic.csv")
#convert survival status to a factor
titanicData$survived <- as.factor(titanicData$survived)
levels(titanicData$survived) #R knows it isn't numeric now


## ----------------------------------------------
titanicData$survived[1] <- "5"


## ----factorLevel, error = TRUE-----------------
#overwrite with another possible level
levels(titanicData$survived) <- c(levels(titanicData$survived), "5")
levels(titanicData$survived)

#no error
titanicData$survived[1] <- "5" 


## ----reread,echo = TRUE------------------------
levels(titanicData$survived) <- c("Died", "Survived", "Other")
levels(titanicData$survived)


## ----reread2,echo = TRUE-----------------------
levels(titanicData$survived) <- c("Died", "Survived", "Other")
levels(titanicData$survived)


## ----factorOrder,echo=TRUE, eval = TRUE--------
#or use ordered()
titanicData$survived <- factor(titanicData$survived,
                                  levels(titanicData$survived)[c(3, 2, 1)])
levels(titanicData$survived)


## ----echo=TRUE---------------------------------
titanicData <- read_csv("../datasets/titanic.csv")
titanicData$survived <- as.factor(titanicData$survived)
levels(titanicData$survived) <- c("Died", "Survived")
titanicData


## ---- eval=TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived))


## ----eval=TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived)) + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = survived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = survived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## g <- ggplot(data = titanicData, aes(x = survived))
## g + geom_bar()


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## #global
## ggplot(data = titanicData, aes(x = survived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = survived))


## ----eval = FALSE, out.width = "450px", fig.align='center'----
## #global
## ggplot(data = titanicData, aes(x = survived)) + geom_bar()
## #local
## ggplot() + geom_bar(data = titanicData, aes(x = survived))


## ----eval = TRUE, out.width = "450px", fig.align='center'----
titanicData <- titanicData %>% drop_na(survived, sex, embarked)
g <- ggplot(data = titanicData, aes(x = survived))
g + geom_bar()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = as.character(survived))) + 
  geom_bar() + 
  labs(x = "Survival Status", title = "Bar Plot of Survival for Titanic Passengers")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + geom_bar()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + 
  geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") +
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male"))


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + geom_bar() +
  labs(x = "Survival Status", 
       title = "Bar Plot of Survival Status for Titanic Passengers") + 
  scale_x_discrete(labels = c("Person Died", "Person Survived")) + 
  scale_fill_discrete(name = "Sex", labels = c("Female", "Male")) + 
  coord_flip()


## ----eval=FALSE,echo=TRUE----------------------
## ggplot(data = titanicData, aes(x = survived, fill = sex)) + geom_bar()
## ggplot(data = titanicData, aes(x = survived, fill = sex)) + stat_count() ```


## ----eval = TRUE, out.width = "450px", fig.align='center'----
sumData <- titanicData %>% group_by(survived, sex) %>% summarize(count = n())
ggplot(sumData, aes(x = survived, y = count, fill = sex)) + 
  geom_bar(stat = "identity")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + 
  geom_bar(position = "dodge")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived, fill = sex)) + 
  geom_bar(position = "fill")


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived)) + 
  geom_bar(aes(fill =sex), position = "dodge") +
  facet_wrap(~ embarked)


## ----eval = TRUE, out.width = "450px", fig.align='center'----
ggplot(data = titanicData, aes(x = survived)) + 
  geom_bar(aes(fill =sex), position = "dodge") +
  facet_grid(pclass ~ embarked)


## ----------------------------------------------
CO2 <- as_tibble(CO2)
CO2


## ----eval = TRUE, out.width = "450px", fig.align='center'----
g <- ggplot(CO2, aes(x = uptake))
g + geom_histogram()


## ----eval = TRUE, out.width = "450px", fig.align='center'----
g + geom_histogram(color = "blue", fill = "red", size = 2, binwidth = 3)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = uptake)) + geom_density()


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = uptake)) +
  geom_density(adjust = 0.5, alpha = 0.5, aes(fill = Treatment))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = uptake)) + 
  geom_density(adjust = 0.5, alpha = 0.5, position = "stack", aes(fill = Treatment))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2) + 
  geom_histogram(aes(y = ..density.., x = uptake, fill = Treatment)) +
  geom_density(adjust = 0.25, alpha = 0.5, position = "stack", 
               aes(x = uptake, fill = Treatment)) 


## ----eval=FALSE,echo=TRUE,message=FALSE--------
## ggplot(CO2, aes(x = uptake, fill = Treatment)) +
##   geom_histogram(aes(y = ..density..)) +
##   geom_density(adjust = 0.25, alpha = 0.5, position = "stack")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g <- ggplot(CO2, aes(x = Treatment, y = uptake))
g + geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = Treatment, y = uptake)) + 
  geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = Treatment, y = uptake)) + 
  geom_jitter(width = 0.1) + 
  geom_boxplot(fill = "grey")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = Treatment, y = uptake)) + geom_boxplot(fill = "grey") +
  geom_jitter(width = 0.1) + facet_wrap(~ Type)


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
g <- ggplot(CO2, aes(x = conc, y = uptake)) 
g + geom_point()


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = conc, y = uptake)) + geom_point() +  
  geom_smooth(aes(col = "loess")) +
  geom_smooth(method = lm, aes(col = "linear")) + 
  scale_colour_manual(name = 'Smoother', values =c('linear'='red', 'loess'='purple'), 
                      labels = c('Linear','GAM'), guide = 'legend')


## ----------------------------------------------
paste("Hi", "What", "Is", "Going", "On", "?", sep = " ")
paste("Hi", "What", "Is", "Going", "On", "?", sep = ".")
paste0("Hi", "What", "Is", "Going", "On", "?")


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
correlation <- cor(CO2$conc, CO2$uptake)
ggplot(CO2, aes(x = conc, y = uptake)) + geom_point() +
  geom_smooth(method = lm, col = "Red") + 
  geom_text(x = 750, y = 10, size = 5, 
            label = paste0("Correlation = ", round(correlation, 2)))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = conc, y = uptake)) + 
  geom_text(aes(label = Plant))


## ---- echo = TRUE, out.width = "500px", fig.align='center'----
ggplot(CO2, aes(x = conc, y = uptake)) + 
  geom_point(aes(color = Type), size = 2.5) +
  facet_wrap(~ Treatment)


## ---- echo = TRUE, out.width = "600px", fig.align='center', message = FALSE, warning = FALSE----
library(GGally) #install GGally if needed
ggpairs(iris, aes(colour = Species, alpha = 0.4))

