a = "hello world"
c <- b <- a
c
переменная <- 123
переменная
t <- T <- f <- F <- q <- a
t; T; f; F; q

sqrt(4)
print(a)
rainbow(5, alpha = 0)
rm(list = ls())

? q
? T
? t

a <- list(12, 5.1, 123214, "edad")
sapply(a, is.double)
sapply(a, is.integer)
sapply(a, is.character)

is.integer(4)
is.numeric(-4.32)
is.integer(as.integer(4))
as.integer(-4.32)

a <- logical()
a
a <- T
T == TRUE
as.logical(3)
sapply(list(123, 0, -12, "wea", NULL, Inf), as.logical)

(l <- sapply(list(123, 0, -4234, 2.231, 1.342e12, NA, NULL, - Inf, NaN, T, FALSE), as.character))
sapply(l, as.logical)
sapply(l, as.integer)
sapply(l, as.numeric)
sapply(l, as.double)

a <- 123
mode(a) <- 'logical'; a
mode(a) <- 'integer'; a
mode(a) <- 'character'; a
mode(a) <- 'double'; a
mode(a) <- 'factor'; a
a <- "asd"
mode(a) <- 'integer'; a
a <- Inf
mode(a) <- 'character'; a
mode(a) <- 'double'; a
mode(a) <- 'factor'; a


sapply(list(123, 0, -4234, 2.231, 1.342e12, NA, NULL, - Inf, NaN, T, FALSE, "dfks", vector(), list()), mode)
l <- list(Inf, NA, NaN, NULL)
sapply(l, is.na)
sapply(l, is.nan)
sapply(l, is.null)
sapply(l, is.finite)
sapply(l, is.infinite)