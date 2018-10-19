#2
View(airquality)
air.lm <- lm(Ozone ~ Wind, data=na.omit(airquality))
summary(air.lm)
plot(Ozone ~ Wind, data=na.omit(airquality))
abline(air.lm)
plot(air.lm$residuals ~ Day, data=na.omit(airquality))
plot(air.lm, which=1:1)



#3

X = c(2,3,8,9,11)
Y = c(3.2,5.1,6.8,8.1,9.2)
mylm <-lm(Y ~ X)
predict(mylm, data.frame(X=5), interval="confidence")
  

#6

cars.lm <- lm(dist ~ speed, data=cars)
cars.lm$coefficients

# 11
plot(weight ~ height, data=Davis)
mylm <- lm(weight ~ height, data=Davis)
abline(mylm)
summary(mylm)
summary(lm(weight ~ height, data=Davis))


#12
plot(IQbio ~ IQfoster, data=Burt)
mylm <- lm(IQbio ~ IQfoster, data=Burt)
abline(mylm)
plot(mylm, which=1:2)
summary(mylm)
?Burt

#13
View(Blackmore)
plot(exercise ~ age, data=Blackmore)
mylm <- lm(exercise ~ age, data=Blackmore)
abline(mylm)
plot(mylm, which=1:2)

#14
plot(rate ~ slim, data=Highway1, xlab="Speed Limit", ylab="Accident Rate per Million Vehicle Miles", main="1973 Minnesota Highway Accident Records")
summary(lm(rate ~ slim, data=Highway1))   
summary(lm(I(rate^2) ~ slim, data=Highway1))
summary(lm(I(log(rate)) ~ slim, data=Highway1))
summary(lm(rate^(-1/2) ~ slim, data=Highway1))
plot(I(log(rate)) ~ slim, data=Highway1)

#15
summary(lm(speed ~ dist, data=cars))
cars.lm <- lm(speed ~ dist, data=cars)
cars.lm$fitted.values

#17
mylm <- lm(kwh ~ ccf, data=Utilities)
summary(lm(kwh ~ ccf, data=Utilities))
confint(mylm)

#18
View(KidsFeet)
View(MyKidsFeet)
MyKidsFeet <- subset(KidsFeet, sex=="B")
mylm <- lm(width ~ length, data=MyKidsFeet)
predict(mylm, data.frame(length=25), interval="confidence")

#19
View(Orange)
mylm <- lm(circumference ~ age, data=Orange)
boxCox(mylm)
summary(mylm)


#20
View(Orange)
mylm <- lm(circumference ~ age, data=Orange)
boxCox(mylm)
summary(mylm)
plot(mylm, which=1:2)

plot(circumference ~ age, data=Orange)

plot(Orange$age, type='b', pch=16, cex=0.8)


#22
X <- c(1,2,3,4,5)
Y <- c(8,4,7,5,2)
plot(Y ~ X)
mylm<-lm(Y ~ X)
abline(mylm)
summary(mylm)

#24
pt(-2.601, 48)
2*pt(2.601, 48, lower.tail = FALSE)

2*pt(9.464, 48, lower.tail = FALSE)
