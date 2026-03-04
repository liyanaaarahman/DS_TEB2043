install.packages("dplyr")
install.packages("readr")
library(dplyr)
library(readr)

data<-iris

student_data <- read.csv("C:\\Users\\Mohamad Hafiz\\Documents\\Data Science 2Y2S\\student_data.csv", header = TRUE, stringsAsFactors = FALSE)
final_exam<- student_data %>% select(student_id,coursework_mark,final_exam_mark)
View(mydata)
mydata<-student_data %>% filter(final_exam>40) %>% arrange(final_exam_mark)