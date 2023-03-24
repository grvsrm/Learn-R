# Date : 23-03-2023
# Author - Gaurav Sharma
# Title - Course Brushup using ModernDive Book  



###################################################

library(tidyverse)
library(nycflights13)
library(knitr)

flights %>% glimpse()
flights %>% view()
flights %>% kable()
###################################################


flights %>% 
    filter(carrier == "AS") %>% 
    ggplot(aes(arr_delay,dep_delay)) +
    geom_jitter(alpha = 0.2)

flights$dest %>% unique()


flights %>% 
    ggplot(aes(time_hour,air_time)) +
    geom_line()

weather %>% 
    ggplot(aes(temp)) +
    geom_histogram(fill = "red", color = "green") + 
    facet_wrap(~month, nrow = 2)

weather %>% 
    ggplot(aes(factor(month), temp)) +
    geom_boxplot()


flights %>%
    ggplot(aes(x=carrier, fill = origin)) +
    geom_bar()

###################################################

diamonds %>% 
    group_by(cut, color, clarity) %>% 
    mutate(xyz = sum(x,y,z)) %>% 
    summarise(mean_depth = mean(depth),
              mean_price = mean(price),
              max_table = max(table), 
              freq = n(),
              mean_xyz = mean(xyz))
