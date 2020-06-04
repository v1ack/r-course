# Kirilkin Vladimir PI18-2

# Модель логистической регрессии в R
# загружаем данные
train <- read.csv('train.csv')
# создаем обучающую и тестовую выборки из наших данных
install.packages('caTools')
library(caTools)
set.seed(88)
split <- sample.split(train$Recommended, SplitRatio = 0.75)
# создаем обучающую и тестовую выборки
dresstrain <- subset(train, split == TRUE)
dresstest <- subset(train, split == FALSE)
# модель логистической регрессии
model <- glm(Recommended ~ . - ID, data = dresstrain, family = binomial)
summary(model)
predict <- predict(model, type = 'response')
# матрица ошибок
table(dresstrain$Recommended, predict > 0.5)
# ROCR-кривая
library(ROCR)
ROCRpred <- prediction(predict, dresstrain$Recommended)
ROCRperf <- performance(ROCRpred, 'tpr', 'fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2, 1.7))
# строим график glm
library(ggplot2)
ggplot(dresstrain, aes(x = Rating, y = Recommended)) +
  geom_point() +
  stat_smooth(method = "glm", family = "binomial", se = FALSE)
# ROCR
# Инсталлируйте пакет ROCR
# пример 1
data(ROCR.simple)
pred <- prediction(ROCR.simple$predictions, ROCR.simple$labels)
perf <- performance(pred, "tpr", "fpr")
plot(perf)
# пример 2
perf <- performance(pred, "acc")
plot(perf)
# пример 3
perf <- performance(pred, "ecost")
plot(perf)
# пример 4
perf <- performance(pred, "auc")
# пример 5
# Пример с одной выборкой
perf <- performance(pred, "tpr", "fpr")
par(bg = "lightblue", mai = c(1.2, 1.5, 1, 1))
plot(perf, main = "ROCR fingerpainting toolkit", colorize = TRUE, xlab = "fpr", ylab = "tpr",
     box.lty = 7, box.lwd = 5, xaxis.col = "blue", xaxis.col.axis = "blue", yaxis.col = "blue",
     yaxis.at = c(0, 0.5, 0.8, 0.85, 0.9, 1), yaxis.las = 1, xaxis.lwd = 2, yaxis.lwd = 2, yaxis.col.axis = "blue",
     cex.lab = 2, cex.main = 2)
# 3. ROCR
# Пример с несколькими выборками
# пример 1
data(ROCR.xval)
pred <- prediction(ROCR.xval$predictions, ROCR.xval$labels)
perf <- performance(pred, "tpr", "fpr")
plot(perf, col = "black", lty = 3)
# пример 2
plot(perf, lwd = 3, avg = "vertical", spread.estimate = "boxplot", add = TRUE)