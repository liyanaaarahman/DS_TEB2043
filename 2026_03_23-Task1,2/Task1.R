data("Theoph")
head(Theoph)

# CREATE MODEL
# Predictor and response
x <- Theoph$Wt
y <- Theoph$Dose

# Linear model
model <- lm(y ~ x)
print(model)
print(summary(model))


#PREDICT MULTIPLE VALUES
# Predict for weight 90, 95, 100
new_weight <- data.frame(x = c(90, 95, 100))
result <- predict(model, new_weight)
print(result)

# plot
plot(y, x,
     col = "maroon",
     main = "Dose vs Weight Regression",
     xlab = "Dose (mg/kg)",
     ylab = "Weight (kg)",
     pch = 16)

# Regression line
abline(lm(x ~ y), col = "pink", lwd = 2)

# Smooth scatter plot
scatter.smooth(y, x,
               col = "darkblue",
               main = "Dose vs Weight (Smooth)",
               xlab = "Dose",
               ylab = "Weight")