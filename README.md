# Assessing-Development-and-Prosperity
# Overview
This research provides a detailed analysis of global development, examining the interplay between Infant Mortality Rate, Literacy Rate, Internet Usage, Gross National Income per Capita, Population Growth, and Agriculture, Forestry, and Fishing's contribution to GDPfrom 2013 to 2022. It employs a blend of qualitative, quantitative, and domain-specific methodologies to offer a holistic view of growh systems across various socioeconomic contexts. This study sets the stage for an in-depth examination of how these indicators not only reflect current states but also hint at future trajectories. It is positioned at the intersection of quantitative analysis and policy implications, aiming to unearth trends, challenges, and opportunities that could steer nations towards sustainable development and inclusive growth.

# Data Cleaning and Transformation
The dataset, sourced from the World Bank, encompasses 6 indicators across 10 countries. Missing values were replaced with the mean of their respective columns using the mutate() and ifelse() functions. This approach assumes that the missingness is random and that the mean is a reasonable estimate for the missing values. This approach ensured the preservation of the original data distribution and robustness against outliers.

# EDA/Analysis
The analysis encompassed descriptive statistics to understand data distribution and properties. Statistical measures such as mean, median, mode, standard deviation, skewness, kurtosis, range, IQR, variance, and quantiles were calculated. Visual EDA included boxplots, histograms, scatterplots, and multivariate plots to understand data distribution, outliers, and relationships among variables.

# Results
Key findings from various statistical analyses include:
# Correlation Analysis:
A strong positive correlation between Population Growth and Affishvalue would suggest that countries with higher population growth also have a higher contribution from agriculture, forestry, and fishing to their economy, which aligns with the objective of investigating sectoral contributions to the economy.
# Hypothesis Testing:
These hypotheses reflect the objectives to investigate the impact of living standards on child health and the influence of digital connectivity on education.
# Regression Analysis:
The regression analysis results show a multiple linear regression model where the dependent variable is likely to be an indicator of socio-economic status or development, given the nature of the independent variables included. The coefficients for Populationgrowth and Affishvalue are significant, with p-values less than 0.05, indicating a statistically significant relationship with the dependent variable. Specifically, Populationgrowth has a positive relationship, while Affishvalue has a slightly positive effect. The significance codes denote that these variables are strong predictors within the model.
# Time Series Analysis:
The ARIMA forecast plot showed the future values for the mortality rate, along with confidence intervals that widened over time, reflecting increasing uncertainty. The forecast model's coefficients and error measures, such as the AIC (Akaike Information Criterion), were used to evaluate the model's fit to the historical data.

# Conclusion
From the statistical analyses, it can be concluded that:
There is variability among countries in key socioeconomic indicators.
Some indicators are strongly correlated, suggesting potential causal relationships or common influencing factors.
The regression analysis identified significant predictors of mortality rates, providing a quantitative basis for understanding this complex issue.
The time series analysis highlighted the dynamic nature of the mortality rate over time and provided a forecast for future trends.
These findings have important implications. Policymakers can use the insights from the correlation and regression analyses to design targeted interventions. The time series forecast can aid in long-term planning and preparedness for future socioeconomic challenges.
