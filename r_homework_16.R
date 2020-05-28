# Kirilkin Vladimir PI18-2
library(ggplot2)
head(mtcars)

#task 1
mtcars$cyl <- factor(mtcars$cyl)
mtcars$vs <- factor(mtcars$vs)
mtcars$am <- factor(mtcars$am)
mtcars$gear <- factor(mtcars$gear)
mtcars$carb <- factor(mtcars$carb)
mtcars_numeric <- mtcars[c(1, 3:7)]
pairs(mtcars_numeric)

ggplot(mtcars, aes(mpg, disp)) +
  geom_point() +
  geom_smooth(method = "lm")

ggplot(mtcars, aes(hp, disp, color = cyl)) +
  geom_point() +
  geom_smooth(method = "lm")

lm_res <- lm(disp ~ hp, mtcars)
predict(lm_res, data.frame(hp = c(10, 20, 50, 100)))

#task 2
lm(mpg ~ am, mtcars)
ggplot(mtcars, aes(am, mpg)) +
  geom_point() +
  geom_smooth(method = "lm")

#task 3
cor(mtcars_numeric)

#task 4
head(swiss)
pairs(swiss)

ggplot(swiss, aes(Examination, Education)) +
  geom_point() +
  geom_smooth(method = "lm")
(lm_res <- lm(Education ~ Examination, swiss))
summary(lm_res)
# Examination имеет прямую зависимость с Education, p-value < 0.001
# При единичном изменении Education Examination увеличивается на 0.8418

ggplot(swiss, aes(Catholic, Infant.Mortality)) +
  geom_point() +
  geom_smooth(method = "lm")

summary(lm(Fertility ~ Infant.Mortality +
  Examination +
  Catholic +
  Education, data = swiss))

#task 5
evals <- read.csv("evals.csv")
head(evals)
str(evals)
evals_numeric <- evals[sapply(evals, is.numeric)]
cors <- cor(evals_numeric)
which(1 > cors & cors > 0.5, arr.ind = T)

ggplot(evals, aes(cls_students, cls_did_eval)) +
  geom_point() +
  geom_smooth(method = "lm")