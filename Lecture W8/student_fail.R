install.packages("dplyr")
install.packages("readr")
library(dplyr)
library(readr)
student_data <- read.csv("C:\\Users\\Mohamad Hafiz\\Documents\\Data Science 2Y2S\\Lecture W8\\student_data.csv", header = TRUE, stringsAsFactors = FALSE)

#intro
View(student_data)
summary(student_data)
head(student_data)
student_fail<-student_data[student_data$final_exam_mark<40,]
View(student_fail)