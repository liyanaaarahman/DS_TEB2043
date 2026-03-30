install.packages("readxl")
install.packages("dplyr")
install.packages("plotrix")
library(plotrix)
library(readxl)
library(dplyr)

titanic_cleaned <- read_excel("C:/Users/Mohamad Hafiz/Documents/Data Science 2Y2S/Lab8/2026-03-09/Titanic_Cleaned.xlsx")
# Check data
View(titanic_cleaned)

# Visualization 1: Survival by Gender
gender_table <- table(titanic_cleaned$Sex, titanic_cleaned$Survived)
barplot(gender_table,
        col = c("red","green"),
        beside = TRUE,
        legend = c("Died","Survived"),
        main = "Titanic Survival by Gender",
        xlab = "Gender",
        ylab = "Number of Passengers")

## Visualization 2: Age Distribution

hist(titanic_cleaned$Age,
     col = "lightblue",
     border = "black",
     main = "Age Distribution of Titanic Passengers",
     xlab = "Age",
     ylab = "Frequency",
     breaks = 10)

# Visualization 3: Passenger Class Distribution
class_table <- table(titanic_cleaned$Pclass)

pie3D(class_table,
      labels = names(class_table),
      explode = 0.1,
      main = "Passenger Class Distribution",
      col = rainbow(length(class_table)))

#Question 2
data("AirPassengers")

df <- data.frame(
  Month = as.numeric(time(AirPassengers)),
  Passengers = as.numeric(AirPassengers)
)
#showTrend over time
plot(df$Month, df$Passengers,
     type = "l",
     col = "maroon",
     main = "Monthly Airline Passenger Trend (1949–1960)",
     xlab = "Year",
     ylab = "Number of Passengers")

#shOw distribution of passengers
hist(df$Passengers,
     col = "lightpink",
     main = "Distribution of Airline Passengers",
     xlab = "Number of Passengers",
     ylab = "Frequency",
     breaks = 10)
print("The AirPassengers dataset shows a strong increasing trend in airline travel from 1949 to 1960, indicating growing demand for air transportation over time. The distribution shows that passenger numbers are concentrated at lower to mid values, with fewer extreme high values in the early years.")
