install.packages("dplyr")
install.packages("readr")
library(dplyr)
library(readr)

student_data <- read.csv("C:\\Users\\Mohamad Hafiz\\Documents\\Data Science 2Y2S\\Lecture W8\\student_data.csv", header = TRUE, stringsAsFactors = FALSE)
data<-iris
head(data)
tail(data)
str(data) #describe structure of data
#min & max value of data
min(data$Sepal.Length)
max(data$Sepal.Length)
#min max value in range
range(data$Sepal.Length)
#standard deviation and variance
sd(data$Sepal.Length)
var(data$Sepal.Length)
#mean med
mean(data$Sepal.Length)
median(data$Sepal.Length)
#generate useful descriptive
summary(data)
summary(data$Sepal.Length)
A<-c(170.2,181.5,188.9,163.9,166.4,163.7,160.4,175.8,181.5)
quantile(A)
sort(A)
#for specific val
quantile(A,0.25)
IQR(A)

#Graph
    #histogram
hist(data$Sepal.Length,
     main = "Histogram of Sepal Length",
     xlab = "Sepal Length",
     ylab = "Frequency",
     col = "lightblue",
     border = "black")

    #boxplot
boxplot(Sepal.Length ~ Species,
        data = data,
        main = "Sepal Length by Species",
        xlab = "Species",
        ylab = "Sepal Length",
        col = c("pink", "lightblue", "lightgreen"))
plot(data$Sepal.Length,
     data$Petal.Length,
     col = as.factor(data$Species),
     pch = 19,
     main = "Sepal Length vs Petal Length by Species",
     xlab = "Sepal Length",
     ylab = "Petal Length")
  
    #scatter plot
legend("topleft",
       legend = levels(as.factor(data$Species)),
       col = 1:3,
       pch = 19)

#Outliers
data<- c(30,24,26,28,29,28,27,26,32,34,15,14,31,29,28,24,25,30,34,35,27,30,34,44,48)
boxplot(data,main="Boxplot")
#Handling outliers
first_q<- quantile(data,0.25)
third_q<- quantile(data,0.75)
iqr<-IQR(data)
le = first_q - 1.5*iqr
ue = third_q +1.5*iqr