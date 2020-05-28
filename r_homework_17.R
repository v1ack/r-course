# Kirilkin Vladimir PI18-2
library(ggplot2)
library(Hmisc)
evals <- read.csv("evals.csv", encoding = "UTF-8", stringsAsFactors = TRUE)
head(evals)

#task 1
evals$score <- factor(ifelse(evals$score > mean(evals$score), "high", "low"))

ev1 <- table(evals$score)
ev2 <- table(evals$score, evals$language)
ev3 <- table(evals$score, evals$rank)
prop.table(ev2)
prop.table(ev2, 2)
prop.table(ev2, 1)

barplot(ev1)
barplot(ev2)
barplot(ev2, legend.text = TRUE)
barplot(ev3, legend.text = TRUE, beside = TRUE)

mosaicplot(ev3)

binom.test(ev1)
chisq.test(ev1)
fisher.test(ev2)


#task 2
mtcars$cyl <- factor(mtcars$cyl)
mtcars$gear <- factor(mtcars$gear)
mtcars$am <- factor(mtcars$am)
mtcars$vs <- factor(mtcars$vs)
mtcars$carb <- factor(mtcars$carb)

hist(mtcars$mpg)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(fill = "white", col = "black", binwidth = 1.5)

ggplot(mtcars, aes(x = mpg)) +
  geom_histogram(fill = "white", col = "black", binwidth = 1.5) +
  facet_grid(am ~ .)

ggplot(mtcars, aes(x = mpg, col = am)) +
  geom_density()
ggplot(mtcars, aes(am, mpg)) +
  geom_boxplot()

#task 3
head(iris)
iris_sub <- subset(iris, Species != "versicolor")

ggplot(iris_sub, aes(Petal.Length)) +
  geom_histogram(fill = "white", col = "black", binwidth = 1.5)

ggplot(iris_sub, aes(x = Petal.Length)) +
  geom_histogram(fill = "white", col = "black", binwidth = 1.5) +
  facet_grid(Species ~ .)

ggplot(iris_sub, aes(x = Petal.Length, col = Species)) +
  geom_density()

ggplot(iris_sub, aes(Species, Petal.Length)) +
  geom_boxplot()

shapiro.test(x = iris_sub$Petal.Length)
shapiro.test(x = iris_sub$Petal.Length[iris_sub$Species == "setosa"])
bartlett.test(Petal.Length ~ Species, iris_sub)

t.test(Petal.Length ~ Species, iris_sub)

ggplot(iris_sub, aes(Species, Petal.Length)) +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2)

ggplot(iris_sub, aes(Species, Petal.Length)) +
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar", width = 0.2) +
  stat_summary(fun = mean, geom = "point", size = 4)
