# Load the required packages
library(tidyverse)
library(forecast)

# Read in the data
genome_s <- read.csv("sequencing-costs.csv")

head(genome_s)
dim(genome_s)
str(genome_s)

# Convert the date column to a date format
genome_s$Date <- as.Date(genome_s$Date, format = "%Y-%m-%d")

# Create a time series object
ts_genome_s <- ts(genome_s$Cost.per.Mb, start = c(year(genome_s$Date[1]), month(genome_s$Date[1])), frequency = 12)

# Plot the time series
plot(ts_genome_s, main = "Cost per Mb over time", xlab = "Year", ylab = "Cost per Mb")

# Decompose the time series into trend, seasonal, and remainder components
decomp <- decompose(ts_genome_s)

# Plot the decomposed time series
plot(decomp)

# Create a forecast for the next 12 months
forecast_data <- forecast(ts_genome_s, h = 12)

# Plot the forecast
plot(forecast_data, main = "Forecast of Cost per Mb", xlab = "Year", ylab = "Cost per Mb")
