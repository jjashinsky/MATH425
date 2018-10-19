# Load library
library(plotly)

# fit model
mylo <- loess(mpg ~ wt + disp, data = mtcars)

# predict over sensible grid of values
wts <- unique(mtcars$wt)
disps <- unique(mtcars$disp)
grid <- expand.grid(wts, disps)
d <- setNames(data.frame(grid), c("wt", "disp"))
vals <- predict(mylo, newdata = d)

# form matrix and give to plotly
m <- matrix(vals, nrow = length(d$wt), ncol = length(d$disp))

plot_ly() %>% add_markers(data=data.frame(d, vals), x=~wt, y=~disp, z=~vals, marker=list(size=2)) %>% add_markers(data=mtcars, x=~wt, y=~disp, z=~mpg)

x <- c(10,17,21,7,6)
y <- 5 + 2*x + rnorm(5, 0, 0.3)
plot(y ~ x)
x <- c(x, 8, 15)
y <- c(y, 40, 20)
plot(y ~ x)
mylm <- lm(y ~ x)
abline(mylm)
mylmo <- lm(y[1:5] ~ x[1:5])
abline(mylmo, col="red")
mylmw <- lm(y ~ x, weights=c(1,1,1,1,1,0.5,0.5))
abline(mylmw, col="green")
mylmw <- lm(y ~ x, weights=c(1,1,1,1,1,2.5,2.5))
abline(mylmw, col="orange")
MAD <- 1/0.6745*median( abs(mylm$res - median(mylm$res)) )
MAD
u <- mylm$res / MAD
u
mylm$residuals
w <- rep(1, 7)
w <- 1.345/abs(u)
w[abs(u)<=1.345] <- 1
w
mylmH <- lm(y ~ x, weights=w)
abline(mylmH, col="blue")
MAD <- 1/0.6745*median( abs(mylmH$res - median(mylmH$res)) )
u <- mylmH$res / MAD
w <- 1.345/abs(u)
w[abs(u)<=1.345] <- 1
mylmH2 <- lm(y ~ x, weights=w)
abline(mylmH2, col="blue", lwd=2)
w
MAD <- 1/0.6745*median( abs(mylmH2$res - median(mylmH2$res)) )
u <- mylmH2$res / MAD
w <- 1.345/abs(u)
w[abs(u)<=1.345] <- 1
mylmH3 <- lm(y ~ x, weights=w)
abline(mylmH3, col="blue", lwd=3)
plot(mylm, which=1)
plot(mylmH, which=1)
plot(mylmH2, which=1)
plot(mylmH3, which=1)
mylmR <- rlm(y ~ x)
?rlm
??rlm
library(MASS)
mylmR <- rlm(y ~ x)
abline(mylmR, col="red", lwd=2)
mylmR$w
?rlm
plot(wt ~ repwt, data=Davis)
library(car)
plot(wt ~ repwt, data=Davis)
View(Davis)
plot(weight ~ repwt, data=Davis)
Davis.lm <- lm(weight ~ repwt, data=Davis)
abline(Davis.lm)
Davis.lmR <- rlm(weight ~ repwt, data=Davis)
abline(Davis.lmR, col="blue")
library(mosaic)
plot(price ~ carat, data=diamonds)
d.lm <- lm(price ~ carat, data=diamonds)
abline(d.lm)
abline(d.lm, col="red")
d.lmr <- rlm(price ~ carat, data=diamonds)
abline(d.lmr, col="green")
points(weight ~ repwt, data=Davis, col=rgb(d.lmr$w, d.lmr$w, d.lmr$w))
points(price ~ carat, data=diamonds, col=rgb(d.lmr$w, d.lmr$w, d.lmr$w))
abline(d.lmr, col="green")
abline(d.lm, col="red")
