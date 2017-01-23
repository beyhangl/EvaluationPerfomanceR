titanic <- read.csv("C:\\Users\\asus\\Desktop\\DataScience\\Kaggle\\titanic\\train.csv", head=T)
n <- nrow(titanic)

shuffled <- titanic[sample(n), ]
train_indices <- 1:round(0.7 * n)

train <- shuffled[train_indices, ]
test_indices <- (round(0.7 * n) + 1):n
test <- shuffled[test_indices, ]

library(rpart)

train<-as.data.frame(train)
test<-as.data.frame(test)
tree <- rpart(Survived ~ ., data = mydata, method = "class")

pred <- predict(tree, test, type = "class")

conf<-table(test$Survived, pred)
conf
pred
#   0   1
#0 150  13
#1  11  93
