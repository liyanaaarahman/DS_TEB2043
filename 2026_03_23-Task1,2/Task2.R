install.packages("caTools")
install.packages("class")
library(caTools)
library(class)

data(ChickWeight)
head(ChickWeight)

# SPLIT DATA (70% TRAIN, 30% TEST)
set.seed(123)
split <- sample.split(ChickWeight$Diet, SplitRatio = 0.7)

train_cl <- subset(ChickWeight, split == TRUE)
test_cl  <- subset(ChickWeight, split == FALSE)

# FEATURE SCALING
train_scale <- scale(train_cl[, c("weight", "Time")])
test_scale  <- scale(test_cl[, c("weight", "Time")])

# KNN MODEL (MULTIPLE K VALUES)

# K = 1
pred1 <- knn(train_scale, test_scale, train_cl$Diet, k = 1)
acc1 <- mean(pred1 == test_cl$Diet)
print(paste("K=1 Accuracy =", acc1))

# K = 3
pred3 <- knn(train_scale, test_scale, train_cl$Diet, k = 3)
acc3 <- mean(pred3 == test_cl$Diet)
print(paste("K=3 Accuracy =", acc3))

# K = 5
pred5 <- knn(train_scale, test_scale, train_cl$Diet, k = 5)
acc5 <- mean(pred5 == test_cl$Diet)
print(paste("K=5 Accuracy =", acc5))

# K = 7
pred7 <- knn(train_scale, test_scale, train_cl$Diet, k = 7)
acc7 <- mean(pred7 == test_cl$Diet)
print(paste("K=7 Accuracy =", acc7))

# K = 15
pred15 <- knn(train_scale, test_scale, train_cl$Diet, k = 15)
acc15 <- mean(pred15 == test_cl$Diet)
print(paste("K=15 Accuracy =", acc15))

# FIND BEST K AUTOMATICALLY
k_values <- c(1, 3, 5, 7, 15)
accuracies <- c(acc1, acc3, acc5, acc7, acc15)

best_k <- k_values[which.max(accuracies)]
print(paste("Best K =", best_k))

# SELECT BEST MODEL
if(best_k == 1) best_model <- pred1
if(best_k == 3) best_model <- pred3
if(best_k == 5) best_model <- pred5
if(best_k == 7) best_model <- pred7
if(best_k == 15) best_model <- pred15

# CONFUSION MATRIX
cm <- table(test_cl$Diet, best_model)
print(cm)

# FINAL ACCURACY
final_accuracy <- mean(best_model == test_cl$Diet)
print(paste("Final Accuracy =", final_accuracy))