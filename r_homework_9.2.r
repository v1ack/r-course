# Kirilkin Vladimir PI18-2
library(ggplot2)

mtcars$vs <- as.factor(mtcars$vs)
mtcars$gear <- as.factor(mtcars$gear)
mtcars$cyl <- as.factor(mtcars$cyl)

#task 2
qplot(log(mpg), log(hp), geom = "point", data = mtcars)
qplot(log(mpg), log(hp), geom = c("point"), data = mtcars, colour = qsec)
qplot(log(mpg), log(hp), geom = c("point", "smooth"), data = mtcars, colour = qsec)

#task 3
qplot(vs, log(wt), data = mtcars, geom = "jitter", alpha = I(0.3))
qplot(gear, log(wt), data = mtcars, geom = "jitter", alpha = I(0.7))

#task 4
qplot(vs, log(wt), data = mtcars, geom = "boxplot")
qplot(gear, log(wt), data = mtcars, geom = "boxplot", fill = vs)

#task 5
qplot(hp, data = mtcars, geom = "histogram")
qplot(hp, data = mtcars, geom = "histogram", binwidth = 10)
qplot(carb, data = mtcars, geom = "histogram")

#task 6
qplot(cyl, data = mtcars, geom = "bar")
qplot(cyl, data = mtcars, geom = "bar", weight = mpg)

#task 7
qplot(log(drat), data = mtcars, geom = "freqpoly")
qplot(log(drat), data = mtcars, geom = "freqpoly", binwidth = 0.01)
qplot(log(drat), data = mtcars, geom = "freqpoly", binwidth = 0.01, colour = cyl)

#task 8
qplot(drat, data = mtcars, geom = "density", colour=gear)

#task 9
qplot(cyl, data = mtcars, geom = "bar", fill = gear)

#task 10
qplot(cyl, data = mtcars, geom = "bar", fill = gear, facets = vs ~ .)
qplot(gear, wt, data = mtcars, geom = "boxplot", fill = drat, facets = cyl ~ .)
