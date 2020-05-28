# Kirilkin Vladimir PI18-2
library(ggplot2) 
 
#task 2 
plot_with_label <- function(x) ggplot(mtcars, aes(hp, drat)) + geom_point() + scale_x_continuous(x) 
plot_with_label(quote(a ^ 2))
plot_with_label(quote(b[2]))
plot_with_label(quote(a != b))
plot_with_label(quote(a %==% b))
plot_with_label(quote(a <= b))
plot_with_label(quote(a >= b))
plot_with_label(quote(paste(a * degree, b)))
plot_with_label(quote(paste(a, infinity, b)))
 
#task 3 
ggplot(mtcars, aes(hp, drat)) + geom_point() + labs(x = NULL, y = NULL) 
 
#task 4 
ggplot(mtcars, aes(hp, drat)) + geom_point() + scale_x_log10(minor_breaks = 100) 
 
#task 5 
ggplot(mtcars, aes(hp, drat)) + geom_point() + scale_x_continuous(breaks = 100, labels = "here") 
 
#task 6 
ggplot(mtcars, aes(hp, drat, colour = hp)) + geom_point() + scale_colour_continuous(name="Horse power", labels=scales::unit_format(unit="hp")) 
 
#task 7 
ggplot(mtcars, aes(hp, qsec, colour = qsec)) + geom_point() + labs(x = NULL, y = NULL) + scale_colour_continuous(name = "Разгон", labels = scales::unit_format(unit = "seq")) 
ggplot(mtcars, aes(hp, qsec, colour = qsec)) + geom_point() + labs(x = NULL, y = NULL) + scale_colour_continuous(name = "Разгон", labels = scales::unit_format(unit = "seq")) + theme(legend.position = "bottom") 
ggplot(mtcars, aes(hp, qsec, colour = qsec)) + geom_point() + labs(x = NULL, y = NULL) + scale_colour_continuous(name = "Разгон", labels = scales::unit_format(unit = "seq")) + theme(legend.position = "left") 
ggplot(mtcars, aes(hp, qsec, colour = qsec)) + geom_point() + labs(x = NULL, y = NULL) + scale_colour_continuous(name = "Разгон", labels = scales::unit_format(unit = "seq")) + theme(legend.position = c(0.4, 0.2)) 
 
#task 8 
ggplot(mtcars, aes(hp, wt, colour = wt, size = hp)) + geom_tile() + labs(x = NULL, y = NULL) + scale_colour_continuous(labels = NULL, name = "Вес")

#task 9 
ggplot(mtcars, aes(hp, mpg * 0.43 * 46.78, colour = mpg * 0.43 * 46.78)) + geom_point() + labs(x = NULL, y = NULL) + scale_colour_continuous(labels = scales::unit_format(unit = "Р"), name = "Плата за 100км")

#task 10
ggplot(mtcars, aes(hp, drat)) + geom_point() + scale_x_continuous(minor_breaks = mtcars$hp) + scale_y_continuous(minor_breaks = mtcars$drat)

#task 11
mtcars$gear <- as.factor(mtcars$gear)
ggplot(mtcars, aes(hp, drat, colour = qsec, shape = gear)) + geom_point() + geom_segment(aes(x = hp, xend = hp, y = 0, yend = drat))

#task 12
(g <- ggplot(mtcars, aes(hp,drat)) + geom_point(aes(colour = qsec)))
g + theme_dark()
g + theme_linedraw()
g + theme(panel.background = element_rect(fill = "#FF00FF", colour = "grey50"))

#task 13
ggplot(mtcars, aes(hp,drat)) + geom_point() + coord_flip()
ggplot(mtcars, aes(hp,drat)) + geom_point() + coord_cartesian()
ggplot(mtcars, aes(hp,drat)) + geom_point() + coord_fixed(1 * max(mtcars$hp) / max(mtcars$drat))