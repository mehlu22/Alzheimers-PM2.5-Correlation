# Load the required packages
library(ggplot2)

# Read the CSV file
data <- read.csv(file.choose())

# Create a scatter plot
ggplot(data, aes(x = PM2.5Levels, y = Alzheimers)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, color = "red") + # add line of best fit
  labs(x = "PM2.5 concentration (μg/m3)", y = "Alzheimer's Mortality (per 100,000 people)",
       subtitle = "R-squared from Machine Learning Algorithm: 0.3319258988694511",) +
  ggtitle("Correlation of PM2.5 levels to Alzheimer's Mortality in the United States using the Machine Learning Algorithm of Linear Regression")

install.packages(c("dplyr"))
