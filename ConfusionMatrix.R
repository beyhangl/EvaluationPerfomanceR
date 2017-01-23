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
#   0   1
#0 150  13
#1  11  93

##acc=(TP+TN)/(TP+FN+FP+TN)
##alttakide hesaplýyor accuracy
acc<-sum(diag(conf))/sum(conf)
print(acc)

#prec=(TP)/(TP+FP)
#print(prec)

#rec=TP/(TP+FN)
#print(rec)



set.seed(1)
tree <- rpart(Survived ~ ., train, method = "class", control = rpart.control(cp=0.00001))

fancyRpartPlot(tree)

pruned<-prune(tree,cp=0.01)

# Aðacý buduyoruz. Çok fazla overfit oldu. Yani bias deðeri büyüyecek
fancyRpartPlot(pruned)



