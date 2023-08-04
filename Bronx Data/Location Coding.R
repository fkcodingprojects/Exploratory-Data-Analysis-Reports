

library(dplyr)
library(ggplot2)
library(sf)
library(viridis)
library(gridExtra)
library(progress)
library(arrow)
library(tidyverse)
library(corrplot)

# Set the file paths
zip_file <- "E:/NewYorkData/taxi_zones.zip"
lookup_file <- "E:/NewYorkData/taxi_zone_lookup.csv"

# Extract the shapefile from the zip file
unzip(zip_file, exdir = "E:/NewYorkData")

# Read the shapefile
ny_map <- st_read("E:/NewYorkData/taxi_zones.shp")

# Filter to get 2016-2018 Data


merged_data <- merged_data %>%
  filter(date >= as.Date("2016-01-01") & date <= as.Date("2018-12-31"))


# PULocationID

# Count the frequency of pickup locations
pickup_counts <- merged_data %>%
  count(PULocationID) %>%
  rename(Frequency = n) %>%
  arrange(desc(Frequency))


# Map of New York

# Calculate the centroid of each polygon in ny_map_sf
ny_map_centroid <- ny_map %>%
  st_centroid()

# Create a new data frame with PULocationID and the centroid coordinates
ny_map_labels <- data.frame(PULocationID = ny_map$LocationID,
                            x = st_coordinates(ny_map_centroid)[, 1],
                            y = st_coordinates(ny_map_centroid)[, 2])

# Merge pickup_counts with ny_map based on PULocationID
ny_map_merged <- merge(ny_map, pickup_counts, by.x = "LocationID", by.y = "PULocationID", all.x = TRUE)

# Plot 1: Pickup Locations
plot_pickup <- ggplot() +
  geom_sf(data = ny_map_merged, aes(fill = Frequency), color = "lightblue") +
  geom_text(data = ny_map_labels, aes(x = x, y = y, label = PULocationID), color = "black", size = 3, nudge_y = 0.001) +
  labs(title = "NY Pickup Locations and Frequencies",
       x = "Longitude", y = "Latitude") +
  scale_fill_viridis(option = "viridis", name = "Frequency") +
  theme_bw() +
  coord_sf(xlim = c(979000, 1044000), ylim = c(200000, 279000))

# DOLocationID

# Count the frequency of dropoff locations
dropoff_counts <- merged_data %>%
  count(DOLocationID) %>%
  rename(Frequency = n) %>%
  arrange(desc(Frequency))

# Merge dropoff_counts with ny_map based on LocationID
ny_map_merged_dropoff <- merge(ny_map, dropoff_counts, by.x = "LocationID", by.y = "DOLocationID", all.x = TRUE)

# Plot 2: Dropoff Locations
plot_dropoff <- ggplot() +
  geom_sf(data = ny_map_merged_dropoff, aes(fill = Frequency), color = "lightblue") +
  geom_text(data = ny_map_labels, aes(x = x, y = y, label = PULocationID), color = "black", size = 3, nudge_y = 0.001) +
  labs(title = "NY Dropoff Locations and Frequencies",
       x = "Longitude", y = "Latitude") +
  scale_fill_viridis(option = "viridis", name = "Frequency") +
  theme_bw() +
  coord_sf(xlim = c(979000, 1044000), ylim = c(200000, 279000))

# Combine the two plots side by side
combined_plot <- grid.arrange(plot_pickup, plot_dropoff, nrow = 1)


# Create a new window
windows()

# Display the combined plot
plot(combined_plot)





