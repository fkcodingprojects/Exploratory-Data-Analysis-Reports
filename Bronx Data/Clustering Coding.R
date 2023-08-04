

# Clustering Analysis


# Load required libraries
library(ggplot2)
library(sf)
library(dplyr)
library(cluster)
library(factoextra)
library(fpc)

# Set the working directory to the folder containing the shapefile
setwd("E:/NewYorkData/")

# Read the taxi_zones shapefile into an sf object
ny_map <- st_read("taxi_zones.shp")

# Filter ny_map for the "Bronx" borough
ny_map <- filter(ny_map, borough == "Bronx")

# Calculate the centroid of each polygon in ny_map
ny_map_centroid <- st_centroid(ny_map)

# Create a new data frame with PULocationID and the centroid coordinates
ny_map_labels <- data.frame(PULocationID = ny_map$LocationID,
                            x = st_coordinates(ny_map_centroid)[, 1],
                            y = st_coordinates(ny_map_centroid)[, 2])

# Combine the x and y coordinates into a matrix
coords <- as.matrix(ny_map_labels[, c("x", "y")])

# Determine the maximum number of clusters based on available data points
max_clusters <- min(nrow(coords), length(unique(ny_map_labels$PULocationID)))

# Elbow Method
wss <- sapply(1:min(10, max_clusters), function(k) kmeans(coords, centers = k)$tot.withinss)
plot(1:min(10, max_clusters), wss, type = "b", xlab = "Number of Clusters", ylab = "Within-cluster Sum of Squares")



# Silhouette Analysis

sil_scores <- sapply(1:min(10, max_clusters), function(k) {
  kmeans_clusters <- kmeans(coords, centers = k + 1)
  cluster_assignments <- kmeans_clusters$cluster
  if (length(unique(cluster_assignments)) > 1) {
    avg_silhouette <- cluster.stats(dist(coords), cluster_assignments)$avg.silwidth
  } else {
    avg_silhouette <- 0
  }
  avg_silhouette
})

plot(1:min(10, max_clusters), sil_scores, type = "b", xlab = "Number of Clusters", ylab = "Average Silhouette Width")

# Create a data frame with number of clusters and average silhouette width
result_table <- data.frame(Number_of_Clusters = 2:min(10, max_clusters), Average_Silhouette_Width = sil_scores)

# Print the result table
print(result_table)




# Gap Statistic

gap_stat <- clusGap(coords, FUNcluster = kmeans, nstart = 25, K.max = 10, B = 50)
plot(gap_stat, main = "Gap Statistic")
print(gap_stat$Tab)


# Visual Inspection of Cluster Separation
kmeans_clusters <- kmeans(coords, centers = 1)
plot(ny_map, col = kmeans_clusters$cluster, main = "Cluster Separation")

# Print the sum of squares for each number of clusters
for (i in 1:min(10, max_clusters)) {
  cat("Number of clusters:", i, "- Sum of squares:", wss[i], "\n")
}



























