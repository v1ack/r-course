# Kirilkin Vladimir PI18-2
install.packages("readxl")
install.packages("corrgram")
library("readxl")
library("ggplot2")
library("psych")
library("corrgram")

#task 1
avia_rate <- read_excel("Занятие 18.xlsx", sheet = 1)
names(avia_rate) <- c("number", "rate", "security")
cor.test(~rate + security, avia_rate)

#task 2
indexes <- read_excel("Занятие 18.xlsx", sheet = 2)
names(indexes) <- c("retail", "factory", "unknown")
ggplot(indexes, aes(retail, factory)) +
  geom_point()
cor.test(~retail + factory, indexes)

ggplot(indexes, aes(log(retail), log(factory))) +
  geom_point()

cor.test(~log(retail) + log(factory), indexes)

#task 3
regions <- read_excel("Занятие 18.xlsx", sheet = 3)
names(regions) <- c("number", "minimum", "salary")
cor.test(~minimum + salary, regions)
ggplot(regions, aes(minimum, salary)) +
  geom_point() +
  geom_smooth(method = "lm")
summary(lm(salary ~ minimum, regions))
# salary = 76.9765 + minimum * 0.9204
# 0.9 > cor > 0.7 - связь Высокая

#task 4
sessions <- read_excel("Занятие 18.xlsx", sheet = 4)
names(sessions) <- c("number", "x", "y", "group")
summary(lm(y ~ x, sessions))
cor.test(~x + y, data = sessions)
cor.test(~x + y, data = sessions, subset = group == "А")
cor.test(~x + y, data = sessions, subset = group == "Б")
mean(subset(sessions, group == "А")$x) - mean(subset(sessions, group == "Б")$x)

#task 5
eat <- read_excel("Занятие 18.xlsx", sheet = 5)
names(eat) <- c("number", "city", "eat", "look", "service", "sum", "price")
describeBy(eat, group = "city")
summary(subset(eat, city == "NYC"))
summary(subset(eat, city == "LI"))

corrgram(eat, lower.panel = panel.pie)