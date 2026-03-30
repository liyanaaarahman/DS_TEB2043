install.packages("readxl")
install.packages("dplyr")
install.packages("stringr")
install.packages("writexl")
install.packages("ggplot2")

# Load libraries
library(readxl)
library(dplyr)
library(stringr)
library(writexl)
library(ggplot2)

# Import dataset
titanic_raw <- read.csv("C:/Users/Mohamad Hafiz/Documents/Data Science 2Y2S/Lab7/titanic.csv",
  header = TRUE,
  stringsAsFactors = FALSE
)

# View dataset structure
str(titanic_raw)
dim(titanic_raw)
summary(titanic_raw)

titanic_cleaned <- titanic_raw %>%
  
  # Remove extra spaces
  titanic_cleaned <- titanic_raw %>%
  
  mutate(across(where(is.character), str_trim)) %>%
  
  mutate(
    PassengerId = as.numeric(PassengerId),
    Survived = as.numeric(Survived),
    Pclass = as.numeric(Pclass),
    Age = as.numeric(Age),
    SibSp = as.numeric(SibSp),
    Parch = as.numeric(Parch),
    Fare = as.numeric(Fare)
  ) %>%
  
  mutate(
    Sex = str_to_lower(Sex),
    Embarked = str_to_upper(Embarked)
  ) %>%
  
  filter(
    !is.na(Age)
  )

titanic_cleaned$Cabin[titanic_cleaned$Cabin == ""] <- NA
class(titanic_cleaned$Age)
titanic_cleaned$Age <- as.integer(titanic_cleaned$Age)

# Check cleaned data
str(titanic_cleaned)
dim(titanic_cleaned)
head(titanic_cleaned)
View(titanic_cleaned)

# SAVE file
write_xlsx(
  titanic_cleaned,
  "C:/Users/Mohamad Hafiz/Documents/Data Science 2Y2S/Lab7/Titanic_Cleaned.xlsx"
)

# ANALYSIS

# 4.1 Overall survival rate
overall_survival <- titanic_cleaned %>%
  summarise(Survival_Rate = mean(Survived) * 100)

print(overall_survival)
print("Overall survival rate shows the percentage of passengers who survived in the Titanic dataset.")

# 4.2 Survival rate by gender
survival_by_gender <- titanic_cleaned %>%
  group_by(Sex) %>%
  summarise(
    Total_Passengers = n(),
    Survival_Rate = mean(Survived) * 100
  )

print(survival_by_gender)
print("Survival rate by gender shows that females had higher survival rates compared to males.")

# 4.3 Survival rate by passenger class
survival_by_class <- titanic_cleaned %>%
  group_by(Pclass) %>%
  summarise(
    Total_Passengers = n(),
    Survival_Rate = mean(Survived) * 100
  )

print(survival_by_class)
print("Survival rate by passenger class shows that first class passengers had higher survival rates than lower classes.")

# 4.4 Survival rate by embarkation port
survival_by_port <- titanic_cleaned %>%
  group_by(Embarked) %>%
  summarise(
    Total_Passengers = n(),
    Survival_Rate = mean(Survived) * 100
  )

print(survival_by_port)
print("Survival rate by embarkation port shows variation in survival across different boarding locations.")

# 4.5 Passenger class distribution
class_distribution <- titanic_cleaned %>%
  count(Pclass) %>%
  mutate(
    Percentage = (n / sum(n)) * 100
  )

print(class_distribution)
print("Passenger class distribution shows the proportion of passengers in each travel class.")

# 4.6 Average age by survival
age_survival <- titanic_cleaned %>%
  group_by(Survived) %>%
  summarise(
    Average_Age = mean(Age)
  )

print(age_survival)
print("Average age by survival shows differences in age between survivors and non-survivors.")

# 4.7 Average fare by passenger class
fare_class <- titanic_cleaned %>%
  group_by(Pclass) %>%
  summarise(
    Average_Fare = mean(Fare)
  )

print(fare_class)
print("Average fare by passenger class shows that higher classes paid significantly more than lower classes.")

# WRITE A REPORT

write_xlsx(
  list(
    Cleaned_Data = titanic_cleaned,
    Survival_Gender = survival_by_gender,
    Survival_Class = survival_by_class,
    Survival_Port = survival_by_port,
    Class_Distribution = class_distribution,
    Age_Survival = age_survival,
    Fare_Class = fare_class
  ),
  "C:/Users/Mohamad Hafiz/Documents/Data Science 2Y2S/Lab7/Titanic_Report_Output.xlsx"
)

#plot graf
ggplot(titanic_cleaned, aes(x = Embarked, fill = factor(Survived))) +
  geom_bar(position = "fill") +
  labs(
    title = "Survival Rate by Embarkation Port",
    x = "Embarked Port",
    y = "Proportion",
    fill = "Survived"
  )