# Kirilkin Vladimir PI18-2
library(ggplot2)
library(dplyr)

#task 1
columns_names <- c("cat", "name", "X2014", "X2015", "X2016", "X2017", "prod")

prod <- read.csv("Цены на продовольственные товары.csv", sep = ";", dec = ",")
prod$prod <- "prod"
names(prod) <- columns_names

nonprod <- read.csv("Цены на непродовольственные товары.csv", sep = ";", dec = ",")
nonprod$prod <- "nonprod"
names(nonprod) <- columns_names

df <- rbind(prod, nonprod)
df$prod <- factor(df$prod)

#task 1.2
ggplot(df, aes(prod, X2017)) +
  geom_boxplot()

summary(aov(X2017 ~ prod, data = df))
# p-value > 0.05 => зависимостей нет

#task 1.3
ggplot(df, aes(X2017, cat)) +
  geom_boxplot()

summary(aov(X2017 ~ cat, data = df))
# p-value < 0.05 => зависимости обнаружены

#task 1.4
pd <- position_dodge(0.1)
ggplot(df, aes(X2017, cat, color = prod, group = prod)) +
  stat_summary(fun.data = mean_cl_boot, geom = 'errorbar', width = 0.2, lwd = 0.8, position = pd) +
  stat_summary(fun.data = mean_cl_boot, geom = 'line', size = 1.5, position = pd) +
  stat_summary(fun.data = mean_cl_boot, geom = 'point', size = 5, position = pd, pch = 15) +
  theme_bw()
summary(aov(X2017 ~ cat * prod, data = df))
# p-value < 0.05 => зависимости обнаружены

#task 2
head(ChickWeight)

summary(
  aov(
    weight ~ (Time * Diet) + Error(Chick / Time) + (Diet),
    data = ChickWeight
  )
)

#task 3
titanic <- read.csv("titanic.csv")

ggplot(titanic, aes(
  x = factor(Survived, labels = c("Погиб", "Выжил")),
  y = Age,
  fill = factor(Survived, labels = c("Погиб", "Выжил")))
) +
  geom_boxplot() +
  guides(fill = guide_legend(title = NULL)) +
  xlab(NULL)

tbl <- data.frame(table(titanic$Pclass, titanic$Sex, titanic$Survived))

# Не выжили
ggplot(subset(tbl, Var3 == 0), aes(Var1, Var2, fill = Freq)) +
  geom_tile() +
  xlab("Класс") +
  ylab("Пол")

# Выжили
ggplot(subset(tbl, Var3 == 1), aes(Var1, Var2, fill = Freq)) +
  geom_tile() +
  xlab("Класс") +
  ylab("Пол")
