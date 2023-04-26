# Load the required packages
library(ggplot2)

# Read the CSV file
data <- read.csv(file.choose())

# Conduct linear regression
regression <- lm(alzheimers_mortality ~ pm2.5, data = data)

# Report the R2 value
R2 <- summary(regression)$r.squared
cat("R-squared value is: ", R2, "\n")

# Create a scatter plot
ggplot(data, aes(x = pm2.5, y = alzheimers_mortality)) +
  geom_point() +
  annotate(geom="label", x=4.65, y=50, label="R2 =",size = 4) +
  annotate(geom="label", x=5, y=50, label=R2,size = 4) +
  geom_smooth(method = lm, se = FALSE, color = "red") + # add line of best fit
  labs(x = "PM2.5 concentration (μg/m3)", y = "Alzheimer's Mortality (per 100,000 people)") +
  ggtitle("Correlation of PM2.5 levels to Alzheimer's Mortality in the United States")

# ANOVA table
anova_table <- anova(regression)
cat("\nANOVA table is: \n")
print(anova_table)