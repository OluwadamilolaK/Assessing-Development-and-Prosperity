#importing necessary library 
library(readr)
library(dplyr)
library(moments)
library(psych)
library(ggcorrplot)

library(readr)
data <- read_csv("worlddata.csv")
View(data)

# Check the structure of your data to ensure that the variables are numeric
str(data)

library(dplyr)

data <- data %>%
  mutate(
    Year = as.numeric(Year),
    Mortalityrate = as.numeric(Mortalityrate),
    Literacyrate = as.numeric(Literacyrate),
    Individualinternet = as.numeric(Individualinternet),
    Grossnationalexpenditure = as.numeric(Grossnationalexpenditure),
    Populationgrowth = as.numeric(Populationgrowth),
    Affishvalue = as.numeric(Affishvalue)
  )

# Handling missing values by replacing them with the mean of each column
data <- data %>%
  mutate(
    Year = ifelse(is.na(Year), mean(Year, na.rm = TRUE), Year),
    Mortalityrate = ifelse(is.na(Mortalityrate), mean(Mortalityrate, na.rm = TRUE), Mortalityrate),
    Literacyrate = ifelse(is.na(Literacyrate), mean(Literacyrate, na.rm = TRUE), Literacyrate),
    Individualinternet = ifelse(is.na(Individualinternet), mean(Individualinternet, na.rm = TRUE), Individualinternet),
    Grossnationalexpenditure = ifelse(is.na(Grossnationalexpenditure), mean(Grossnationalexpenditure, na.rm = TRUE), Grossnationalexpenditure),
    Populationgrowth = ifelse(is.na(Populationgrowth), mean(Populationgrowth, na.rm = TRUE), Populationgrowth),
    Affishvalue = ifelse(is.na(Affishvalue), mean(Affishvalue, na.rm = TRUE), Affishvalue)
  )

stats <- summary(data)
# Print the basic descriptive analysis 
print(stats)

# Skewness and Kurtosis

# Calculate skewness for all the numeric columns
sapply(data[, sapply(data, is.numeric)], skewness, na.rm = TRUE)

# Calculate kurtosis for all the numeric columns
sapply(data[, sapply(data, is.numeric)], kurtosis, na.rm = TRUE)


# Calculate the correlation matrix
correlation_matrix <- cor(data %>% select(Mortalityrate, Literacyrate, Individualinternet, Grossnationalexpenditure, Populationgrowth, Affishvalue), use = "complete.obs")

# View the correlation matrix
print(correlation_matrix)

library(tidyverse)

# Hypothesis 1: There is a significant correlation between infant mortality rates and Gross National Income per capita across the countries.
hypothesis1_result <- cor.test(data$Mortalityrate, data$Grossnationalexpenditure, method = "pearson")
print(hypothesis1_result)

# Hypothesis 2: There is a significant correlation between the literacy rate and individual internet usage.
hypothesis2_result <- cor.test(data$Literacyrate, data$Individualinternet, method = "pearson")
print(hypothesis2_result)

# linear regression 
mortality_model <- lm(Mortalityrate ~ Literacyrate + Individualinternet + Grossnationalexpenditure + Populationgrowth + Affishvalue, data = data)

summary(mortality_model)


library(forecast)
library(tseries)
# Convert Year to Date class assuming the mortality rate is recorded yearly and starts on the first day of each year
data <- data %>%
  mutate(Year = as.Date(paste0(Year, "-01-01")))

# Now, suppose we want to analyze the mortality rate.
# First, convert it to a time series object.
mortality_ts <- ts(data$Mortalityrate, start = c(2020, 12), frequency = 12)

# Check for stationarity
adf.test(mortality_ts)

# If not stationary, difference the data
mortality_diff <- diff(mortality_ts)

# Finding the best ARIMA model for the mortality rate time series
mortality_arima_fit <- auto.arima(mortality_ts)

# Summary of the ARIMA model
summary(mortality_arima_fit)

# Forecasting the future mortality rate
mortality_forecast <- forecast(mortality_arima_fit, h=5) # forecasting 5 years ahead

# Plot the forecast
plot(mortality_forecast)