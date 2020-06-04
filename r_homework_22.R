# Kirilkin Vladimir PI18-2
install.packages("readxl")
library(readxl)
install.packages("tidyverse")
library(tidyverse)
library(dplyr)

#task 1
population <- read_excel("Численность населения 2018 2.xlsx")
population %>%
  fill('Страна', 'Округ', .direction = "down") %>%
  fill('Страна', 'Округ', .direction = "up") %>%
  fill('Страна', 'Округ', .direction = "downup") %>%
  fill('Страна', 'Округ', .direction = "updown")

population %>%
  pivot_longer(cols = starts_with("2"),
               names_to = "Year", values_to = "Population") %>%
  fill('Страна', 'Округ', .direction = "down")

#task 2
who %>% pivot_longer(cols = new_sp_m014:newrel_f65, names_to = c("diagnosis", "gender", "age"),
                     names_pattern = "new_?(.*)_(.)(.*)", values_to = "count")

#task 3
world_bank_pop %>%
  pivot_longer(cols = starts_with("2"),
               names_to = "year", values_to = "population") %>%
  separate(col = "indicator",
           into = c("rubbish", "area", "variable")) %>%
  .[, -2] %>%
  pivot_wider(names_from = variable, values_from = population)
