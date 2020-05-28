# Kirilkin Vladimir PI18-2
# install.packages("dplyr")
library(dplyr)

#task 1
hist(quakes$mag)
hist(quakes$depth)

plot(
    quakes$mag, 
    quakes$depth, 
    col="red", 
    xlab="Магнитуда", 
    ylab = "Глубина", 
    main = "Магнитуда/глубина землетрясений"
)

#task 2
df <- data.frame(read.csv("data.csv", encoding = "UTF-8"))
filtered <- select(filter(df, naimenovanie_pokazatelya == "Площадь земель, занятых лесными насаждениями (покрытых лесной растительностью), всего"), c("preobladayushchie_drevesnye_i_kustarnikovye_porody", "znachenie_pokazatelya"))
barplot(height = filtered$znachenie_pokazatelya, horiz = T, col=rainbow(nrow(filtered), legend=filtered$preobladayushchie_drevesnye_i_kustarnikovye_porody)

#task 3
stormamy <- filter(storms, name == "Amy")
plot(
    stormamy$lat, 
    stormamy$long,
    type = "l",
    col = "red"
)
text(
    stormamy$lat, 
    stormamy$long,
    labels = stormamy$wind,
    cex = 0.55,
    pos = 4
)
points(stormamy$lat, stormamy$long, pch = 20, col = "blue", cex = stormamy$wind/30)

grid()

#task 4
df <- data.frame(read.csv("okruga.csv", encoding = "UTF-8"))
years <- c(2005,c(2010:2013))
colunms <- paste0("X", years)
colors <- rainbow(nrow(df))
plot(
    range(years), 
    range(df[, colunms]), 
    type = "n", 
    main = "Население федеральных округов России", 
    xlab = "Год", 
    ylab = "Тыс.чел.",
    cex.axis = 0.9, 
    cex.lab = 0.7, 
    cex.main = 0.9, 
    col.lab = "grey50", 
    fg = "grey40"
)

for (region in rownames(df)){
    points(years, df[region, colunms], pch = 20, col = colors[as.numeric(region)])
    lines(years, df[region, colunms], pch = 20, col = colors[as.numeric(region)])
}
legend("bottomleft", legend = df[, "Регион"], title = "Регион", fill = colors, bg = "#FFFFFFE0")

pie(df$X2005, df$Регион, col=colors)