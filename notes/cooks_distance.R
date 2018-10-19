cars.lm <- lm(dist ~ speed, data=cars)
cooks.distance(cars.lm)
plot(cooks.distance(cars.lm))

library(MASS)
lmR <- rlm(dist ~ speed, data=cars)
cooks.distance(lmR)
plot(lmR$w)
lmR$w

## giving weight of 0 to point 49. 
cars.lm2 <- lm(dist ~ speed, data=cars, weights=c(rep(1,48),0,1))
plot(dist ~ speed, data=cars)
abline(cars.lm)
abline(cars.lm2, col="red")
