# Kirilkin Vladimir PI18-2
#task 1
letters[rep(c(T,F), times=13)]
letters[rep(c(F,T), times=13)]
#task 2
n <- 3
letters[rep(c(rep(F, times=n-1), T), times=26)[1:26]]
#task 3
l <- 25
m <- matrix(letters, nrow=l, ncol=l-1, byrow=T)
m <- append(m, m[2:l, 1])
m <- append(m, m[1])
m <- matrix(m, nrow = l)
m