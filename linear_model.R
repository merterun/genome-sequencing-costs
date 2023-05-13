# Fit a linear regression model
model <- lm(Cost.per.Genome ~ Cost.per.Mb, data = genome_s)
summary(model)

# Check the assumptions
plot(model)

# predictions
genome_lm <- data.frame(Cost.per.Mb = c(1000, 2000, 3000))
predictions <- predict(model, newdata = genome_lm)
predictions

# Visualize the model
plot(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, main = "Linear Regression Model", xlab = "Cost per Mb", ylab = "Cost per Genome")
abline(model, col = "red")

# Get predicted values
predicted <- predict(model)

# Calculate residuals
residuals <- genome_s$Cost.per.Genome - predicted






# Calculate R-squared
SSR <- sum((predicted - mean(genome_s$Cost.per.Genome))^2)
SSE <- sum(residuals^2)
SST <- SSR + SSE
R2 <- SSR/SST

# Calculate adjusted R-squared
n <- nrow(genome_s)
p <- length(model$coefficients) - 1
adjR2 <- 1 - (SSE/(n - p - 1))/(SST/(n - 1))

# Calculate root mean squared error (RMSE)
RMSE <- sqrt(mean(residuals^2))

# Print scores
cat("R-squared:", round(R2, 4), "\n")
cat("Adjusted R-squared:", round(adjR2, 4), "\n")
cat("RMSE:", round(RMSE, 2), "\n")

