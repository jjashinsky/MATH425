library(broom)


pluton <- read.table("http://www.stat.ufl.edu/~rrandles/sta4210/Rclassnotes/data/textdatasets/KutnerData/Chapter%20%203%20Data%20Sets/CH03TA10.txt", header=FALSE)
colnames(pluton) <- c("AlphaCount","PlutoniumActivity")


pluton2 <- subset(pluton, AlphaCount != .106)

pluton.lm <- lm(AlphaCount ~ PlutoniumActivity, data=pluton2)

plutontable <- tidy(pluton.lm)
pluton.d.f <- glance(pluton.lm)
pluton.aug <-augment(pluton.lm)