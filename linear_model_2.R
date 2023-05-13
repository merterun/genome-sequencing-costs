# Build a linear regression model to predict Cost per Genome based on Cost per Mb
model_g <- lm(Cost.per.Genome ~ Cost.per.Mb, data = genome_s)

# Calculate the predicted values and residuals
pred_g <- predict(model_g)
resid_g <- genome_s$Cost.per.Genome - pred_g

# Calculate the evaluation metrics
mse_g <- mean(resid_g^2)
rmse_g <- sqrt(mse_g)
r2_g <- summary(model_g)$r.squared

# Plot the actual vs predicted values
plot(genome_s$Cost.per.Mb, genome_s$Cost.per.Genome, col = "blue", main = "Actual vs Predicted Cost per Genome", xlab = "Cost per Mb", ylab = "Cost per Genome")
points(genome_s$Cost.per.Mb, pred_g, col = "red")
abline(model_g, col = "red")
legend("topright", legend = c("Actual", "Predicted"), col = c("blue", "red"), lty = c(NA, 1), pch = c(1, NA), cex = 0.8)

# Print the evaluation metrics
cat("Cost per Genome model:\n")
cat(paste0("MSE: ", mse_g, "\n"))
cat(paste0("RMSE: ", rmse_g, "\n"))
cat(paste0("R-squared: ", r2_g, "\n"))