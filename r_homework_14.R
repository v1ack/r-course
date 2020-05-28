# Kirilkin Vladimir PI18-2
#task 1
apply(data.frame(v1 = "2", v2 = 2, v3 = NaN, v4 = 3.2), MARGIN = 2, FUN = function(x) {
  print(x)
  if (is.nan(x)) return("NAN")
  if (is.integer(x)) return(x)
  if (is.character(x)) return(length(x))
  return(0)
})

#task 2
out <- function(x) {
  v <- length(x[abs(x - mean(x)) > 2 * sd(x)])
  ifelse(v > 0, v, "Нет выбросов")
}
apply(iris[-5], 2, out)

#task 3
out <- function(x)  {
  v <- x[abs(x - mean(x)) > 2 * sd(x)]
  return(v)
}
apply(iris[-5], 2, out)

#task 4
a <- matrix(c(1, 2, 3, 4, 5, 6, 0, 3, 1, 0, 7, 4, 4, 4, 3, 3, 1, 1, -2, 2, 2, 2, -2, 2, 1, 0, 9, 0, 8, 0, 1, -3, 5, -5, 3, 2), ncol = 6)
sum_a <- apply(a, 2, sum)
max_a <- which(sum_a == max(sum_a))
a[, max_a]

#task 5
apply(mtcars, 2, mean)
lapply(mtcars, mean)

#task 6
sapply(airquality, mean)
sapply(na.omit(airquality), mean)

#task 7
set.seed(0)
x <- sample(1:10, 4)
a <- outer(x, x, "*")

(a <- matrix(sapply(a, function(x) ifelse(x %% 2 != 0, NaN, x)), ncol = 4))
(a <- matrix(sapply(a, function(x) ifelse(is.nan(x), "0", x)), ncol = 4))

#task 8
replicate(2, rnorm(3, mean = 0, sd = 1))

#task 9
tapply(mtcars$disp, mtcars$carb, mean)
by(mtcars$disp, mtcars$carb, mean)

#task 10
y <- 1:9 -> y
outer(y, x, { function(x, y) paste0(x, "*", y, "=", x * y) })
