# Kirilkin Vladimir PI18-2
library(maps)
library(viridis)
library(dplyr)
library(ggplot2)

#task 2
# map_data("world") содержит 99338 записей о границах суши
# каждая строка сожержит координаты, названия региона id региона

#task 3
ggplot(map_data("world"), aes(x = long, y = lat, group = group)) +
  geom_polygon(fill = "white", colour = "blue")

#task 4
eu_countries <- c("Russia", "Ukraine", "France", "Spain", "Sweden", "Norway", "Germany", "Finland", "Poland", "Italy", "United Kingdom", "Romania", "Belarus", "Kazakhstan", "Greece", "Bulgaria", "Iceland", "Hungary", "Portugal", "Austria", "Czechia", "Serbia", "Ireland", "Lithuania", "Latvia", "Croatia", "Bosnia and Herzegovina", "Slovakia", "Estonia", "Denmark", "Switzerland", "Netherlands", "Moldova", "Belgium", "Armenia", "Albania", "North Macedonia", "Turkey", "Slovenia", "Montenegro", "Kosovo", "Cyprus", "Azerbaijan", "Luxembourg", "Georgia", "Andorra", "Malta", "Liechtenstein", "San Marino", "Monaco", "Vatican City")
map <- map_data("world", region = eu_countries)
regions <- map %>%
  group_by(region) %>%
  summarise(long = mean(long), lat = mean(lat))
ggplot(map, aes(x = long, y = lat)) +
  geom_polygon(aes(group = group, fill = region)) +
  geom_label(aes(label = region), data = regions) +
  scale_fill_viridis_d() +
  theme_void() +
  theme(legend.position = "hidden")

#task 5
arrests <- USArrests
arrests$region <- tolower(rownames(USArrests))
head(regions, 10)
# Содержит количество убийств, грабежей, изнасилований и ещё чегото того, что не знает переводчик по каждому из штатов

states_map <- map_data("state")
arrests_map <- left_join(states_map, arrests, by = "region")
regions <- states_map %>%
  group_by(region) %>%
  summarise(long = mean(long), lat = mean(lat))
ggplot(arrests_map, aes(long, lat)) +
  geom_polygon(aes(fill = Murder, group = group), color = "white") +
  geom_label(aes(label = region), data = regions) +
  scale_fill_viridis_c(option = "C")
ggplot(arrests_map, aes(long, lat)) +
  geom_polygon(aes(fill = Assault, group = group), color = "white") +
  geom_label(aes(label = region), data = regions) +
  scale_fill_viridis_c(option = "C")

#task 6
install.packages("devtools")
library(devtools)
install_github("expersso/WHO")
library(WHO)
life.exp <- get_data("WHOSIS_000001")
life.exp <- life.exp %>%
  filter(year == 2015 & sex == "Both sexes") %>%
  select(country, value) %>%
  rename(region = country, lifeExp = value) %>%
  # Заменяем название на США потому, что в map_data("world") США именуется как USA
  mutate(
    region = ifelse(region == "United States of America", "USA", region)
  )
life.exp.map <- left_join(life.exp, map_data("world"), by = "region")
ggplot(life.exp.map, aes(long, lat, group = group)) +
  geom_polygon(aes(fill = lifeExp), color = "white") +
  scale_fill_viridis_c(option = "C")