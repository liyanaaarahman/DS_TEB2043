install.packages("dplyr")
install.packages("readr")
library(dplyr)
library(readr)

student_data <- read.csv("C:\\Users\\Mohamad Hafiz\\Documents\\Data Science 2Y2S\\Lecture W8\\student_data.csv", header = TRUE, stringsAsFactors = FALSE)
mydata<- student_data %>% select(student_id,coursework_mark,final_exam_mark)
mydata2<- student_data %>% 
  mutate(Total_Mark=(coursework_mark+final_exam_mark)/200*100)
View(mydata)
glimpse(mydata)
print(mydata)
View(mydata2)