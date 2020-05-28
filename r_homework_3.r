# Kirilkin Vladimir PI18-2
#task 1
a <- c(1,1,2)
b <- c(0, -4,3)
-4*a+5*b
2*(a*b)*a-3*abs(b)*b
#task 2
(a <- c(2,0,-3))
(b <- c(6,1,4))
as.numeric(a%*%b)   
norm(a, type='2')
#task 3 
a <- c(1, 1, 2, 2, 3, 3, 4, 4)
b <- c(-2, -1, 0, 1, 2, 3, 4, 5)
norm(a, type='2')
norm(b, type='2')
sum(a*b)
cos <- (a%*%b)/(norm(a, type = '2')*norm(b,type='2'))
cos
#task 4
mat <- matrix(c(
    1, 2, 3, 4, 5, 6,
    0, 3, 1, 0, 7, 4,
    4, 4, 3, 3, 1, 1,
    -2, 2, 2, 2, -2, 2,
    1, 0, 9, 0, 8, 0,
    1, -3, 5, -5, 3, 2
), ncol=6, byrow=T)

a <- 0
for (i in 1:6){
    a = max(a, norm(mat[i,], type='2'))
}
a
#task 5
for (i in 1:5)
    for (j in (i + 1):6)
        if (sum(mat[i,]*mat[j,]) == 0)
            print(c(i, j))
#task 6
Q <- matrix(c(
    -1, 2, 0,
    3, -1, 0,
    1, 4, 1
), ncol=3, byrow=T)
E <- matrix(c(
    1, 0, 0,
    0, 1, 0,
    0, 0, 1
), ncol=3, byrow=T)
P <- matrix(c(
    0, 0, 0, 0, -3, 4,
    1, 1, 1, 1, 1, 1,
    2, 2, 2, 2, 2, 2
), ncol=6,byrow=T)
#task 6.1
dim(Q)
dim(E)
dim(P)
#task 6.2
-4*Q+5*E
#task 6.3
t(Q)*Q-E
#task 6.4
Q%*%Q%*%Q 
#task 6.5
det(Q)
det(Q%*%Q)
#task 6.6
# install.packages("expm")
library(expm)
sqrtm(Q-2*E)
#task 6.7
solve(Q)
#task 6.8
rankMatrix(P)[1]
