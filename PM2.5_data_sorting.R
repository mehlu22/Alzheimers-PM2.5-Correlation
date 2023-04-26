# Install required packages
#install.packages(c("tidyverse", "ggplot2", "ggrepel", "ggmap", "maps"))

# Load the packages
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggmap)

# Read in the CSV file
data <- read.csv(file.choose())

# Sort the first column in ascending order
sorted_data <- data[order(data[,2]),]

# Write the sorted data back to the CSV file, overwriting the original
write.csv(sorted_data, file = "county_alzheimer's.csv", row.names = FALSE)
