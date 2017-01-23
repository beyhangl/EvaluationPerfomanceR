titanic <- read.csv("C:\\Users\\asus\\Desktop\\DataScience\\Kaggle\\titanic\\train.csv", head=T)
n <- nrow(titanic)

shuffled <- titanic[sample(n), ]
train_indices <- 1:round(0.7 * n)

train <- shuffled[train_indices, ]
test_indices <- (round(0.7 * n) + 1):n
test <- shuffled[test_indices, ]


set.seed(1)
tree <- rpart(Survived ~ ., train, method = "class")
probs <- predict(tree, test, type = "prob")[,2]

library(ROCR)
pred<-prediction(probs,test$Survived)
perf<-performance(pred,"tpr","fpr")

plot(perf)

perf<-performance(pred,"auc")
auc<-perf@y.values[[1]]
# Print auc
print(auc)
