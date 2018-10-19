plot(dist ~ speed, data=cars)
cars.lm <- lm(dist ~ speed, data=cars)
abline(cars.lm)
summary(cars.lm)

levene.test(Y, X, location="median")

X1 <- 1:20
X
Y1 <- rnorm(20, 5, 7)
Y



Y1 <- rnorm(30, 5, 2)
points <- data.frame(Y1)
qqPlot(points$Y1)

