# Kirilkin Vladimir PI18-2
#task 1
solve(matrix(c(
    1, -1,
    3, 2
), ncol=2, byrow=T),
matrix(c(
    7,
    16
), ncol=1, byrow=T))
#task 2
solve(matrix(c(
    2, 3, -1,
    3, -1, 2,
    2, 1, 1
), ncol=3, byrow=T),
matrix(c(
    0,
    1,
    4
), ncol=1, byrow=T))
#task 3
solve(matrix(c(
    3, 4, -1,
    2, -1, -2,
    4, 3, -4
), ncol=3, byrow=T),
matrix(c(
    5,
    3,
    1
), ncol=1, byrow=T))
#task 4
# install.packages("rootSolve")
library(rootSolve)
multiroot(f=function(x) c(
        (x[1]*x[2])^2 - 16*x[1]*x[2] + 39, 
        x[1]^2 + x[2]^2 - 10
    ), start=c(-1000, -1000), maxiter=10000000
)["root"]
#task 5
multiroot(f=function(x) c(
        3*x[1]^2*x[2]^2 + 2*x[1]^2 - 3*x[1]*x[2] - 7, 
        10*x[1]^2*x[2]^2 + 3*x[1]^2 - 20*x[1]*x[2] - 3
    ), start=c(-4000, -10000), maxiter=100000000
)["root"]
#task 6
multiroot(f=function(x) c(
        x[1]^2 - 2*x[2]^2 - x[1]*x[2] + 2*x[1] - x[2] + 1,
        2*x[1]^2 - x[2]^2 + x[1]*x[2] + 3*x[2] - 5
    ), start=c(-4000, -10000), maxiter=100000000
)["root"]
#task 7
solve(matrix(c(
    2, 5,
    1, 3
), ncol=2, byrow=T)) %*% matrix(c(
    4, -6,
    2, 1
), ncol=2, byrow=T)
#task 8
solve(matrix(c(
    3, -2,
    5, -4
), ncol=2, byrow=T)) %*% matrix(c(
    -1, 2,
    -5, 6
), ncol=2, byrow=T)
#task 9
solve(matrix(c(
    2, 1,
    3, 2
), ncol=2, byrow=T)) %*%
solve(matrix(c(
    -3, 2,
    5, -3
), ncol=2, byrow=T)) %*%
matrix(c(
    -2, 4,
    3, -1
), ncol=2, byrow=T)
#task 10
A <- matrix(c(
    -1, 2, -3,
    2, 9, -6,
    -3, -6, 0
), ncol=3, byrow=T)
B <- matrix(c(
    1, 1, 1,
    2, 2, 0,
    -3, 4, -5
), ncol=3, byrow=T)
E <- matrix(c(
    1, 0, 0,
    0, 1, 0,
    0, 0, 1
), ncol=3, byrow=T)
(X <- A %*% solve(B %*% B) %*% E)