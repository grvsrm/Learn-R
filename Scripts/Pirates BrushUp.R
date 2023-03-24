# Date: 22-03-2023
# Title : Learning R Basics with Pirates Book
# Author - Gaurav S


a <- 1:50
a
mean(a)
install.packages("yarrr")
library(yarrr)
library(tidyverse)

head(pirates)
tail(pirates)

summary(pirates)
names(pirates)
View(pirates)
summary(pirates$headband)

mean(pirates$age)
max(pirates$height)
table(pirates$sex)
table(pirates$headband)

pirates %>% 
    aggregate(age~sex, mean)
library(tidyverse)

mean(pirates$age)

t.test(age~headband, data = pirates)
cor.test(~height+weight, data = pirates)


# Run Regression
reg.model <- lm(pirates$tchests ~ age+weight+tattoos, data = pirates)

summary(reg.model)

install.packages("BayesFactor")

names(movies)
movies %>% names()

sample(1:100, 10, 0.5)
?distributions
rnorm(100)

set.seed(1000)
rnorm(10)
rnorm(50, mean = 20, sd = 2) %>% table()

runif(25, -100, 50)

c(seq(1:10), NA, sample(1:10, 4)) %>% mean(na.rm = T)

a <- sample(1:500, 100)
a.z <- (a-mean(a))/sd(a)
a.z %>% sd()

t.movies <- c("Whatever Works",
              "It Follows",
              "Love and Mercy",
              "The Goonies",
              "Jiro Dreams of Sushi",
              "There Will be Blood",
              "Moon",
              "Spice World",
              "Serenity",
              "Finding Vivian Maier")

t.year <- c(2009,
            2015,
            2015,
            1985,
            2012,
            2007,
            2009,
            1988,
            2005,
            2014)

t.boxoffice <- c(35,
                 15,
                 15,
                 62,
                 3,
                 10,
                 321,
                 79,
                 39,
                 1.5)

t.genre <- c("Comedy",
             'Horror',
             'Drama',
             "Adventure",
             'Documentary',
             "Drama",
             'Science Fiction',
             "Comedy",
             "Science Fiction",
             "Documentary")
t.time <- c(92,
            97,
            120,
            90,
            81,
            158,
            97,
            -84,
            119,
            84)
t.rating <- c("PG-13",
              "R",
              "R",
              "PG",
              "G",
              "R",
              "R",
              "PG-13",
              "PG-13",
              "Unrated")

t.movies[10]
t.genre[1:4]
t.movies[t.movies == "Spice World"] <- "The Naked Gun"
t.movies[t.year>1990]
t.movies[t.genre=="Drama"]


t.time[t.time<10] <- NA
mean(t.time, na.rm = T)

t.movies[t.genre== "Comedy" & t.boxoffice < 50]
str(movies)


str(PlantGrowth)
dim(PlantGrowth)
names(ToothGrowth)
dim(ToothGrowth)
ToothGrowth %>% 
    subset(dose==2) %>% 
    select(supp) %>% dim()
ToothGrowth$dose %>% table()


list.files()
ls()
save.image("pirate.Rdata")
load(file = "pirate.Rdata")


iris %>% filter(Petal.Length>2.0) %>% 
    group_by(Species) %>% 
    summarise(Mean1 = mean(Petal.Length),
              Mean2 = mean(Petal.Width),
              Freq = n())
iris %>% rowSums()
