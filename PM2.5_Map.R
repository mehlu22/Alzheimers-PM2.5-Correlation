# Install required packages
#install.packages(c("tidyverse", "ggplot2", "ggrepel", "ggmap", "maps"))

# Load the packages
library(tidyverse)
library(ggplot2)
library(ggrepel)
library(ggmap)

# Load US state boundaries
map_data("state")

# Load Alzheimer's prevalence data from a CSV file
alzheimer_death <- read.csv(file.choose())

# Merge the state boundary data with the prevalence data
us_map_data <- map_data("state") %>%
  left_join(alzheimer_death, by = c("region" = "state"))

# Plot the data on a US map
ggplot(us_map_data, aes(long, lat, map_id = region)) +
  geom_map(map = us_map_data, aes(fill = Final_Mean), color = "white") +
  scale_fill_gradient(low = "skyblue", high = "darkblue", guide = "colorbar") +
  coord_map("albers", lat0 = 38, lat1 = 45) +
  labs(x = "", y = "", title = "PM2.5 Levels By State Averaged from 2015 till 2018",
       subtitle = "Data: Need to put this in",
       fill = "PM2.5 Level") +
  theme_void() +
  theme(legend.position = "right",
        plot.title = element_text(face = "bold", size = 15),
        plot.subtitle = element_text(size = 10),
        plot.caption = element_text(size = 7))
