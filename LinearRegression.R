kafein <- c(5,  7,  4,  9, 5, 10, 14, 17, 12, 11, 18, 17, 21, 21, 24, 23, 28, 35, 21, 27, 23)
plot(kafein,col="black")
days <- 1:21
days
kafein_lm <- lm(kafein ~ days)
abline(kafein_lm,col="blue")
future_days <- data.frame(days = 22:24)
future_days

kafein_pred <- predict(kafein_lm, future_days)

plot(kafein ~ days, xlim = c(1, 24))
points(22:24, kafein_pred, col = "green")
abline(kafein_lm,col="blue")

summary(kafein_lm)$sigma