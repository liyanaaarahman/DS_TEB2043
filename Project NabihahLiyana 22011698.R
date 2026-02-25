install.packages("dplyr")
install.packages("tidyr")
install.packages("stringr")
library(dplyr)
library(tidyr)
library(stringr)

# Read data
df_raw <- read.csv("C:\\Users\\Mohamad Hafiz\\Documents\\Data Science 2Y2S\\Unclean Dataset.csv", header = TRUE, stringsAsFactors = FALSE)

# Split the merged column into proper columns
df_clean <- df_raw %>%
  separate(Student_ID,
           into = c("Student_ID","First_Name","Last_Name","Age",
                    "Gender","Course","Enrollment_Date","Total_Payments"),
           sep = "\\|") %>%
  
  # Trim extra spaces
  mutate(across(everything(), ~str_trim(.))) %>%
  
  # Convert data types
  mutate(
    Student_ID = as.numeric(Student_ID),
    Age = as.numeric(Age),
    Total_Payments = as.numeric(gsub("[^0-9]", "", Total_Payments)),
    Enrollment_Date = as.Date(Enrollment_Date, format = "%Y-%m-%d")
  ) %>%
  # Remove rows with missing Student_ID
  filter(!is.na(Student_ID)) %>%
  # Fix course names
  mutate(
    Course = case_when(
      Course == "Machine Learnin" ~ "Machine Learning",
      Course == "Web Developmen" ~ "Web Development",
      TRUE ~ Course
    )
  )

# view cleaned data
head(df_clean)

install.packages("writexl")
library(writexl) # nak view all cleaned data

# Write cleaned data to a new Excel file
write_xlsx(df_clean, "C:\\Users\\Mohamad Hafiz\\Documents\\Data Science 2Y2S\\Cleaned_Data.xlsx")
# Check structure
str(df_clean)