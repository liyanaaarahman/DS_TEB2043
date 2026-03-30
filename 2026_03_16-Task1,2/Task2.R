#Min-Max Scaling
install.packages("caret")
library(caret)

data("mtcars")
head(mtcars)

# Use mpg column as sample
mydata <- mtcars$mpg

# 1. Log Transformation
scaled_log <- log(mydata)
print(scaled_log)

# 2. Standard Scaling
scaled_standard <- as.data.frame(scale(mydata))
print(scaled_standard)

minmax <- preProcess(as.data.frame(mydata), method = c("range"))
scaled_minmax <- predict(minmax, as.data.frame(mydata))
print(scaled_minmax)

#compare summary
summary(mydata)
summary(scaled_log)
summary(scaled_standard)
summary(scaled_minmax)