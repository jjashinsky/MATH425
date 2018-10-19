pairs(CO2)

library(GGally)
library(leaps)
library(qpcR)

ggpairs(CO2)

summary(lm(uptake ~ conc, data=CO2))
summary(lm(uptake ~ Type, data=CO2))
summary(lm(uptake ~ Plant, data=CO2))


X1 <- runif(100, 0 , 50)
X2 <- 10*rexp(100, 2)
X3 <- 5*rgamma(100, 30,20)

beta0 <- 20
beta1 <- 6.3
beta2 <- 6
beta3 <- 1.2
beta4 <- 2

Y <- beta0 + beta1*X2 + beta2*X3 + beta3*X1*X2 + rnorm(100, 0, 6)
X5 <- 5 + 2*X1 + rnorm(100, 0, 20)

data <- data.frame(Y = Y, X1 = X1, X2 = X2, X3=X3, X5=X5)

library(MASS)
fit <- lm(Y~X1+X2+X3+X5,data=data)
step <- stepAIC(fit, direction="forward")
step$anova # display results

pairs(data)
makeTable9.3(data)
cor(data)

hist(X1)
hist(X2)
hist(X3)

null=lm(Y ~ X2, data=data)
full=lm(Y ~ X1+X2+X3+X5, data=data)
step(null, scope=list(lower=null, upper=full), direction="forward")
