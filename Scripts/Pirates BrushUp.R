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


