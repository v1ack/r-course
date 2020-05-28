# Kirilkin Vladimir PI18-2
library(datasets)
library(ggplot2)

#task 1
ggplot(quakes, aes(long, lat)) +
  labs(x = "Широта", y = "Долгота") +
  geom_point(aes(color = depth, size = mag, alpha = 0.1)) +
  scale_colour_continuous(labels = scales::unit_format(unit = "м"), name = "Глубина") +
  scale_size_continuous(name = "Магнитуда") +
  scale_alpha(guide = "none") +
  ggtitle("Координаты землятресений")

#task 2
install.packages("nasapower")
library(nasapower)
daily_single_ag <- get_power(
  community = "AG",
  lonlat = c(60.59, 56.84),
  pars = c("RH2M", "T2M", "PRECTOT"),
  dates = c("1995-04-01", "1995-04-30"),
  temporal_average = "DAILY"
)
ggplot(daily_single_ag, aes(x = YYYYMMDD, y = RH2M)) +
  geom_point() +
  geom_line()

mounthly_single_ag <- get_power(
  community = "AG",
  lonlat = c(60.59, 56.84),
  pars = c("RH2M", "T2M", "PRECTOT"),
  dates = c("1995-04-01", "1997-04-30"),
  temporal_average = "INTERANNUAL"
)
mounthly_single_ag_formatted <- mounthly_single_ag %>% filter(PARAMETER == "RH2M")

df <- data.frame(DATE = double(), RH2M = double(), stringsAsFactors = F)
for (i in row.names(mounthly_single_ag_formatted)) {
  row <- mounthly_single_ag_formatted[i,]
  for (month in c("JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"))
    df[nrow(df) + 1,] = list(DATE = as.Date(paste(row$YEAR, month, "01"), format = "%Y %B %d"), RH2M = row[[month]])
}
ggplot(df, aes(x = as.Date(DATE, origin = "1970-01-01"), y = RH2M)) +
  geom_bar(stat = "identity") +
  labs(x = "Month", y = "RH2M")

#task 3
ggplot(
  storms %>%
    group_by(name) %>%
    filter(name == "Igor"), aes(x = pressure, y = wind, color = status)
) +
  geom_point() +
  geom_rug()

#task 4
install.packages("eurostat")
library(eurostat)
library(tidyr)
library(magrittr)

tables <- c('tet00034', 'tet00033', 'tet00032', 'tet00031', 'tet00030', 'tet00029')
trades <- lapply(tables, function(x) {
  get_eurostat(id = x, , time_format = 'num') %>% label_eurostat()
})
trades %<>%
  bind_rows() %>%
  select(-geo) %>%
  filter(stringr::str_detect(indic_et, 'Exports in|Imports in')) %>%
  pivot_wider(names_from = indic_et, values_from = values) %>%
  rename(export = `Exports in million of ECU/EURO`,
         import = `Imports in million of ECU/EURO`) %>%
  mutate(partner = as.factor(partner))
ggplot(trades %>%
         group_by(time) %>%
         summarise(export = sum(export), import = sum(import))) +
  geom_line(aes(x = time, y = export, color = "Export"), size = 2) +
  geom_label(aes(x = time, y = export, label = export), size = 3, hjust = 0.5) +
  geom_line(aes(x = time, y = import, color = "Import"), size = 2) +
  geom_label(aes(x = time, y = import, label = import), size = 3, hjust = 0.5) +
  labs(x = "Date", y = "Millions Euro") +
  scale_colour_discrete("Type")
