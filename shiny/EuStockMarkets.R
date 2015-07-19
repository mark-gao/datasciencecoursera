library(MASS)
data("EuStockMarkets")
dax <- EuStockMarkets[1:365, 1]
plot(dax, type="l", xlab="day", ylab= "Stock Price")
abline(v = 100, col="green")