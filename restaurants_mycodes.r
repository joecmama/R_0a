library(class)
restaurant <- read.csv("restaurants.csv", header=T)
restaurant[1:10, ]
n <- 100
sample_rate <- 0.8
ntest <- n * (1 - sample_rate)
ntest
# To get random sampling for future when another sample might be used:
training_rows <- sample(1:n, sample_rate * n, replace=F)
training_rows
train <- subset(restaurant[training_rows, ], select = c(price, visitors))
train
# Give me, out of 1:n, the set not in training_rows:
testing_rows <- setdiff(1:n, training_rows)
testing_rows
test <- subset(restaurant[testing_rows, ], select=c(price,visitors))
test
restaurant[testing_rows, ]
# Prepare for scores
restaurant[testing_rows, ]$stars
true_stars <- restaurant[testing_rows, ]$stars
train_stars <- restaurant[training_rows, ]$stars
train_stars
# Machine Learning algorithm- K-NN
predicted_stars <- knn(train, test, train_stars, k=3)
predicted_stars
# "Levels" in predicted_stars show the possible values, since predicted_stars is considered as "factors" as R doesn't know exactly what it is?
num_incorrect <- sum(predicted_stars != true_stars)
num_incorrect
# Side commands
ls()	# List variables used
# rm(x)	# Remove x
rm(list=ls())	# Clear our memory


