# Kirilkin Vladimir PI18-2
library(rootSolve)
#task 1
from <- 0
to <- 10
func <- function(x) sin(x + pi/4)
(roots <- uniroot.all(func, lower = from, upper = to))
plot(func, from, to)
abline(h = 0, lty = "dotted")
points(roots, y = rep(0, length(roots)))

#task 2
from <- -6
to <- -2
func <- function(x) log(x^2 + 8*x + 16, base = 3)
(roots <- uniroot.all(func, lower = from, upper = to))
plot(func, from, to)
abline(h = 0, lty = "dotted")
points(roots, y = rep(0, length(roots)))

#task 3
to <- 7
a <- 5
if (a <= 0)
    stop("a is equal or lower than zero")
func <- function(x) 1 / x^2
lines(plot(func, 0, to), type = "h")
abline(h = 0, v = 0, lty = "dotted")
integrate(func, a, Inf)

#task 4
func <- function(x) x*sqrt(9 - x^2)
plot(func, -10, 10, xlab="x", ylab="y", col="red")
abline(h = 0, v = 0, lty = "dotted")
roots <- uniroot.all(func, lower = -3, upper = 3)
lines(plot(func, 0, max(roots), add = T), type = 'h')
integrate(func, 0, roots[3])

#task 5
from <- -3
func_one <- function(x) 4 - x^2
func_two <- function(x) x^2 - 2*x
func_both <- function(x) 4 - x^2 - x^2 + 2*x
plot(func_one, from, -from)
plot(func_two, from, -from, add = T)
# plot(func_both, from, -from, add = T)
abline(h = 0, v = 0, lty = "dotted")
roots_one <- uniroot.all(func_one, lower = from, upper = -from)
roots_two <- uniroot.all(func_two, lower = from, upper = -from)
roots_both <- uniroot.all(func_both, lower = from, upper = -from)
roots_one; roots_two; roots_both
as.numeric(integrate(func_one, roots_both[1], roots_one[2])["value"]) - 
as.numeric(integrate(func_two, roots_two[1], roots_two[2])["value"]) - 
as.numeric(integrate(func_two, roots_both[1], roots_two[1])["value"])

#task 6
from <- -5
func <- function(x) sin(x) * cos(x)^2
plot(func, from, -from)
abline(h = 0, v = 0, lty = 3)
abline(v = pi / 2, lty = 1)
integrate(func, lower = sort(uniroot.all(func, lower = from, upper = -from))[2], upper = pi / 2)["value"]

#task 7
from <- -5
func <- function(x) -(x ^ 2) + 5
roots <- uniroot.all(func, lower = from, upper = -from)
plot(func, from, -from)
abline(h = 0, v = 0, lty = "dotted")
abline(h = 0, v = -4, lty = "dotted")
abline(h = 0, v = -2, lty = "dotted")
abline(h = 0, v = 3, lty = "dotted")
abline(h = 0, v = 4, lty = "dotted")
lines(plot(func, -4, roots[2], add = T), type = 'h')
lines(seq(3, 4, by = 0.05), apply(t(seq(3, 4, by = 0.05)), 1, func), type = 'h')

a <- abs(as.numeric(integrate(func, lower = -4, upper = roots[1])$value))
b <- abs(as.numeric(integrate(func, lower = roots[1], upper = roots[2])$value))
c <- abs(as.numeric(integrate(func, lower = 3, upper = 4)$value))

paste("Площадь первой", a)
paste("Площадь второй", b)
paste("Площадь третьей", c)
paste("Площадь общая", a + b + c)

#task 8
x1 <- -10

#task 8.1
f <- function(x) x ^ 3 - 12 * x - 4
plot(f, x1, -x1)
abline(h = 0, v = 0, lty = 3)
optim(0, f, method = 'BFGS')$par

#task 8.2
f2 <- function(x) (x + 1) / ((x - 1) ^ 2)
plot(f2, x1, -x1)
abline(h = 0, v = 0, lty = 3)
optim(0.7, f2, method = 'Nelder-Mead')$par
optim(0.9, f2, method = 'Nelder-Mead')$par

#task 8.3
f8_3 <- function(x) x / (9 - x)
plot(f8_3, x1, -x1)
abline(h = 0, v = 0, lty = 3)
optim(0, f8_3, method = 'BFGS')$par

#task 8.4
f8_4 <- function(x) (x ^ 2) / (4 * x ^ 2 + 1)
plot(f8_4, x1, -x1)
abline(h = 0, v = 0, lty = 3)
optim(0, f8_4, method = 'BFGS')$par

# task 9, 10
x <- 3
y <- 5

z <- expression(sin(cos(4 * x + 23 * x ^ y) ^ 4) - 12 * x)
z
D(z, 'x')
eval(z)

v <- expression(tan(x * 12 ^ y) - 8 * x ^ 4 + 14 * y - 7)
v
D(v, 'x')
eval(v)