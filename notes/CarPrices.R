cars <- read.csv("CarPrices.csv", header=TRUE)

View(cars)
cars2 <- subset(cars, Make=="SAAB")
mplot(cars2)

lm2 <- lm()
abline(predict(h=lm2, data.frame(Mileage=20000, Type="Coupe"), interval="predict"))
