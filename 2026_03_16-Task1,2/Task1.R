install.packages("ggcorrplot")
library(ggcorrplot)
data("ToothGrowth")

# Convert supplement to numeric
ToothGrowth$supp_num <- ifelse(ToothGrowth$supp == "OJ", 1, 0)

# Select numeric columns
tg_data <- ToothGrowth[, c("len", "dose", "supp_num")]

# Correlation matrix
corr_mat <- cor(tg_data)

ggcorrplot(corr_mat,
           lab = TRUE,
           type = "full",
           colors = c("#d9fdd3", "#74c69d", "#1b4332"),
           outline.col="white")