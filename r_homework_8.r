# Kirilkin Vladimir PI18-2
# install.packages("psych")
library(psych)
library(dplyr)

#task 1
evals <- data.frame(read.csv("evals.csv", encoding = "UTF-8")) 
str(evals)

#task 2
for (i in 1:nrow(evals))
    if (evals$score[i] >= 4.5)
        evals$new_score[i] <- "Высокая"
    else if (evals$score[i] >= 3)
        evals$new_score[i] <- "Средняя"
    else
        evals$new_score[i] <- "Низкая"
head(evals)

#task 3
evals$new_score2 <- ifelse(evals$score >=4.5, "Высокая", ifelse(evals$score >= 3, "Средняя", "Низкая")) 
head(evals)

#task 4
for (i in 1:nrow(evals))
    switch(
        as.character(evals$gender[i]),
        "male" = evals$gender2[i] <- "♂︎",
        "female" = evals$gender2[i] <- "♀︎"
    )
head(evals)

#task 5
aggregate(score ~ gender, evals, length)

#task 6
aggregate(score ~ gender + language, filter(evals, rank == "teaching"), length) 

#task 7
numeric_columns <- sapply(evals, typeof) %in% c("integer", "double") & !sapply(evals, is.factor)
describe(evals[, numeric_columns]) 

#task 8
describeBy(evals[, numeric_columns], group = evals$gender) 

#task 9
describeBy(evals[, numeric_columns], group = list(evals$gender, evals$rank))
