library(car)
dim(Highway1)
View(Highway1)
?Highway1
set.seed(48)
testSample <- sample(1:39, 25)
testSample
Train <- Highway1[testSample, ] #Use this to build the model
View(Train)
Test <- Highway1[-testSample, ] #Leave this alone until we have a model
View(Test)


### Build the Model

plot(rate ~ slim, data=Train)

pairs(Train) # rate is Y.
slim.lm <- lm(rate ~ slim, data=Train)
abline(slim.lm)
summary(slim.lm)
boxCox(slim.lm)

slimP.lm <- lm(log(rate) ~ slim, data=Train)
b <- coef(slimP.lm)
plot(rate ~ slim, data=Train)
curve(exp(b[1] + b[2]*x), add=TRUE)
summary(slimP.lm) #Say this is the final model.



### Test the Model (Several Ways)

## One Way
summary(lm(log(rate) ~ slim, data=Test))

## Another Way
yhatTest <- predict(slimP.lm, Test)
SSPE <- sum( (yhatTest - log(Test$rate))^2 ) ##Compare to anova(slimP.lm)
SSPE/length(yhatTest)

## Even another Way
plot(rate ~ slim, data=Test)
curve(exp(b[1] + b[2]*x), add=TRUE)
b2 <- lm(log(rate) ~ slim, data=Test)$coef
curve(exp(b2[1] + b2[2]*x), add=TRUE, col="firebrick")

## Back in the linear space
plot(log(rate) ~ slim, data=Test)
curve(b[1] + b[2]*x, add=TRUE)
b2 <- lm(log(rate) ~ slim, data=Test)$coef
curve(b2[1] + b2[2]*x, add=TRUE, col="firebrick")

ggplot(Train, aes(x=slim, y=log(rate))) + 
  geom_point() +
  geom_smooth(method="lm") +
  geom_smooth(data=Test, aes(x=slim, y=log(rate)), method="lm", color="firebrick")