library(CausalImpact)
library(ggplot2)
library(plotly)

data2 = read.csv('data/data_general.csv')
names(data2)
data2$FECHA <- as.Date(data2$FECHA, format = "%Y-%m-%d")

df2 <- data2[, c('CONTACTOS', 'GRUPOS')]
str(df2)

df2=zoo(df2,seq.Date(min(data2$FECHA), max(data2$FECHA), "days"))

pre.period <-  as.Date(c("2022-08-01", "2022-10-01") )
post.period <- as.Date(c("2022-10-02", "2023-03-29") )

ci = CausalImpact(df2, pre.period, post.period)

summary(ci)
summary(ci, "report")
plot(ci)


