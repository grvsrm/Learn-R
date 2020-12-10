# Pre requisites
library(tidyverse)
library(lubridate)
library(here)
library(waffle)
library(ragg)

# Loading Fonts

library(showtext)
library(showtextdb)
# google_fonts("Nerko One") %>% 
#     font_install()
showtext_auto(enable = T)

# Prepare Data

life_data <- tibble(months = rep(month.abb, 72),
       year = rep(1985:2056, each = 12),
       age = rep(1:72, each = 12)) %>% 
    mutate(months = factor(months),
           row_name = row_number(),
           eras = fct_inorder(case_when(row_name < 188 ~ "Childhood",
                            row_name < 235 ~ "High School",
                            row_name < 284 ~ "College",
                            row_name < 412 ~ "First Job",
                            row_name < (year(Sys.Date()) - 1985)*12 + month(Sys.Date()) ~ "Unemployed",
                            TRUE ~ "Time Left"))) %>% 
    select(row_name, everything())



# Plot


life_data %>%
    count(eras) %>% ## the count of each era is the number of months in that era
    ggplot(aes(fill = eras, values = n)) +
    geom_waffle(color = "#F7F7F7",size = 1, n_rows = 12, flip = T, show.legend = F) + ## make each row a year/12 months
    scale_fill_manual(name = "", values = c("#EF476F","#FCA311","#FFD166","#0EAD69","#4ECDC4","#118AB2")) +  ## assign colors to the eras
    coord_equal() +
    theme_minimal() +
    expand_limits(x = c(-5,30)) +
    theme_enhance_waffle() +
    annotate("text", x = 20, y = 9, label = "Childhood",
             family = "Nerko One",size = 20, color = "#EF476F") +
    annotate("text", x = 20, y = 17, label = "High School",
             family = "Nerko One",size = 20, color = "#FCA311") +
    annotate("text", x = 20, y = 21, label = "College",
             family = "Nerko One",size = 20, color = "#FFD166") +
    annotate("text", x = 20, y = 30, label = "First Job",
             family = "Nerko One",size = 20, color = "#0EAD69") +
    annotate("text", x = 20, y = 35, label = "Unemployed",
             family = "Nerko One",size = 20, color = "#4ECDC4") +
    annotate("text", x = 20, y = 55, label = "~ Life Left",
             family = "Nerko One",size = 20, color = "#118AB2") +
    labs(title = "My Life in Months") +
    theme(plot.background = element_rect(fill = "#F7F7F7", color = "#F7F7F7"),
          plot.title = element_text(family="Nerko One", size = 120, hjust = 0.5, margin = margin(30,0,0,0),color = "#333666"))
    


# Save the plot
ggsave(here("plots", "life plot.png"),
           width = 10,
           height = 25,
           units = "in", 
           dpi = 180,
           type = "cairo",
           device = agg_png())

dev.off()
