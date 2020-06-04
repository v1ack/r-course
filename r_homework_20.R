# Vladimir Kirilkin PI18-2
library(ggplot2)
library(dplyr)
library(psych)

df <- mtcars

#task 1
fit <- lm(mpg ~ ., df)
f1 <- step(fit, direction = "backward")
summary(step(fit, direction = "backward"))

#task 2
pairs(df)
ggplot(df, aes(mpg, wt)) +
  geom_point() +
  geom_smooth()
ggplot(df, aes(mpg)) + geom_histogram()
ggplot(df, aes(wt)) + geom_histogram()
f2 <- lm(mpg ~ wt + am + qsec, df)
summary(lm(mpg ~ wt + am + qsec, df))

anova(f1, f2)

df$lm1_fitted <- f1$fitted
df$lm1_resid <- f1$residuals
ggplot(df, aes(mpg, wt)) +
  geom_point() +
  geom_line(aes(x = lm1_fitted, y = wt), col = "blue") +
  geom_line(aes(x = mpg, y = wt), col = "red") +
  geom_smooth()

#task 3
ggplot(df, aes(lm1_fitted, lm1_resid)) +
  geom_point() +
  geom_smooth()

hist(df$lm1_resid)
