seq(1, 10)
seq(10, 1)
seq(0, 1, 0.1)
rep(c(T, F), 10)
rep(1, 10)
seq(0, 1, 0.1)
seq(10, 1, length.out= 4)

LETTERS[1:10]
letters[1:10]
rev(letters[1:10])

c(1:10)

letters[2]
letters[-2]
letters[1:2]
letters[-(1:2)]
letters[c(1,3,4)]
a <- c(1,2,3)
names(a) <- c("one", "two", "three")
a["two"]

matrix(1:10, 2)
a <- as.matrix(1:10, 2)
dim(a) <- c(2, 5)
a

rbind(a, a)
cbind(a, a)

colnames(a) <- letters[1:dim(a)[2]]
rownames(a) <- letters[1:dim(a)[1]]

a[1,2]
a[,2]
a[1,]
a[1:2, 3:4]
a[c(1,2), c(1,3)]
a["a", "c"]
a[a>5]
a[a<2 | a>6]
a[a==3]
a[a %in% c(3,4,5)]

# Шахматы
matrix(sapply(1:8, function(i) paste0(letters[1:8], i)), nrow = 8, ncol = 8, dimnames = list(1:8, letters[1:8]))
matrix(paste0(rep(letters[1:8], each=8), rep(8:1, times=8)), nrow = 8, ncol = 8, dimnames = list(8:1, letters[1:8]))

# Таблица умножения
matrix(sapply(1:9, function(i) 1:9 * i), 9, dimnames = list(1:9, 1:9))

a <- matrix(nrow = 9, ncol = 9, dimnames = list(1:9, 1:9))
for (i in 1:9)
  for (j in 1:9)
    a[j, i] <- j * i
a

# Сдвиг строки
matrix(sapply(1:26, function(n) letters[c((26 - n + 1):26, 1:(26 - n +1))][-1]), 26, byrow = T)

a <- matrix(nrow = 26, ncol = 26)
n <- 0
for (i in 1:26) {
  a[i,] <- letters[c((26-n):26, 1:(26-n))][-1]
  n=n+1
}
a
