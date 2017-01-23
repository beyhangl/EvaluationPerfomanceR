set.seed(1)
head(iris)
my_iris <- iris[-5]
species <- iris$Species
kmeans_iris<-kmeans(my_iris,5)
table(species,kmeans_iris$cluster)
plot(Petal.Length ~ Petal.Width, data = my_iris, col = kmeans_iris$cluster)

