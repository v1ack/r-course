# Kirilkin Vladimir PI18-2
library(ggplot2)
library(dplyr)

#task 2
my_theme <- theme(
  plot.title = element_text(face = "bold", color = "black", size = 15, margin = margin(b = 15)),
  legend.title = element_text(face = "bold", color = "black", size = 12),
  legend.position = "bottom",
  legend.text = element_text(face = "bold", color = "black"),
  legend.key.size = unit(5, "mm"),
  legend.key = element_rect(fill = "grey"),
  legend.margin = margin(unit(5, "mm"), unit(5, "mm"), unit(5, "mm"), unit(5, "mm")),
  legend.background = element_rect(fill = "white", colour = "white"),
  panel.grid.major = element_line(color = "gray", size = 0.7),
  panel.grid.minor = element_line(color = "gray", size = 0.7),
  axis.text.y = element_text(color = "gray", face = "bold", size = 10, angle = 90),
  axis.text.x = element_text(color = "gray", face = "bold", size = 10, angle = 0),
  axis.title = element_text(color = "gray", face = "bold", size = 15, angle = 0),
  axis.ticks.length = unit("3", "mm"),
  plot.background = element_rect(fill = "white"),
  panel.background = element_rect(color = "grey", fill = "white"),
  aspect.ratio = 4 / 6,
  strip.background = element_rect(fill = "grey"),
  strip.text = element_text(color = "black", face = "bold"),
  panel.spacing.x = unit(5, "mm")
)

#task 3
ggplot(mtcars, aes(hp, drat, color = gear)) +
  geom_point() +
  ggtitle("График") +
  my_theme

#task 4.1
ggplot(mtcars, aes(hp, drat, color = gear)) +
  geom_point() +
  ggtitle("График") +
  facet_wrap(vs ~ .) +
  my_theme

#task 4.2
ggplot(mtcars, aes(hp, drat, color = gear)) +
  geom_point() +
  ggtitle("График") +
  facet_wrap(vs ~ .) +
  my_theme

#task 4.3
ggplot(mtcars, aes(hp, drat, color = gear)) +
  geom_point() +
  ggtitle("График") +
  facet_wrap(vs ~ ., scales = "fixed") +
  my_theme

ggplot(mtcars, aes(hp, drat, color = gear)) +
  geom_point() +
  ggtitle("График") +
  facet_wrap(vs ~ ., scales = "free") +
  my_theme

#task 4.4
ggplot(data = mtcars, aes(mpg, hp)) +
  geom_point() +
  facet_wrap(~vs)

content_sum <- mtcars %>%
  group_by(vs) %>%
  summarise(mpg = mean(mpg), hp = mean(hp)) %>%
  rename(vs2 = vs)
ggplot(data = mtcars, aes(hp, mpg)) +
  geom_point() +
  geom_point(data = content_sum, aes(color = factor(vs2)), size = 5) +
  facet_wrap(~vs)

content_custom <- dplyr::select(mtcars, -vs)
ggplot(mtcars, aes(mpg, hp)) +
  geom_point(data = content_custom, colour = "grey50") +
  geom_point(aes(colour = factor(vs))) +
  facet_wrap(~vs)


#task 5
pdf("plot.pdf", width = 6, height = 6)
ggplot(mtcars, aes(hp, drat, color = gear)) +
  geom_point() +
  ggtitle("Grafic") +
  my_theme
dev.off()

ggplot(mtcars, aes(hp, drat, color = gear)) +
  geom_point() +
  ggtitle("Grafic") +
  my_theme
ggsave("plot.png", width = 6, height = 6)
