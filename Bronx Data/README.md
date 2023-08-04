# Exploratory Data Analysis: Bronx Borough using R

This repository contains an exploratory data analysis (EDA) project focusing on analyzing and visualizing data related to the Bronx borough in New York City using the R programming language. The primary goal of this analysis is to gain insights into various aspects of the Bronx, such as taxi pickup and dropoff locations, summary statistics of the dataset, top pickup and dropoff locations, correlations between numeric variables, and potential clustering patterns.

## Data Source

The data used in this analysis is sourced from taxi trip records and geographical information about the Bronx borough. It includes information on taxi pickups and dropoffs, dates, locations, and additional numeric variables related to the trips.

## Overview of Analysis

1. **Taxi Pickup and Dropoff Locations Map:** The analysis begins by visualizing the pickup and dropoff locations of taxi trips in the Bronx borough using a map. The frequency of pickups and dropoffs is visualized using color-coded markers, providing insights into areas with higher taxi activity.

2. **Summary Statistics Table:** The analysis calculates and presents summary statistics for the numeric variables in the dataset. This table offers an overview of the dataset's central tendencies and variability.

3. **Top Pickup and Dropoff Locations:** The analysis identifies the top 5 pickup and dropoff locations in the Bronx borough based on their frequency in taxi trips. A table is generated to showcase these locations and their respective counts.

4. **Correlation Plot:** To understand the relationships between numeric variables, the analysis creates a correlation plot. This plot uses circles to visualize the correlations, with darker circles indicating stronger correlations between variables.

5. **Clustering Analysis:** The analysis explores potential clustering patterns in the dataset using clustering algorithms. It evaluates the optimal number of clusters using methods like Gap Statistics and plots Silhouette and Sum of Squares graphs.

## How to Run the Analysis

1. Set the file paths: Ensure that you have the necessary data files, including the taxi zones shapefile ("taxi_zones.shp") and the taxi zone lookup file ("taxi_zone_lookup.csv").

2. Install the required packages: Make sure you have the required R packages installed, including `dplyr`, `ggplot2`, `sf`, `viridis`, `gridExtra`, `progress`, `arrow`, `tidyverse`, `corrplot`, and additional packages for clustering analysis.

3. Load and Filter Data: The analysis filters the dataset to focus on the years 2016 to 2018. You can modify the filtering criteria to suit your specific dataset.

4. Create Graph Plots: The code generates various interactive plots, including pickup and dropoff locations maps, summary statistics table, correlation plot, and clustering-related graphs.

5. Explore the Results: Once the analysis is executed, you can interact with the visualizations and tables to gain insights into the data.

Note: Make sure to customize the file paths and data filtering based on your specific dataset. The provided R code serves as an outline for conducting an exploratory data analysis on the Bronx borough using R, including clustering analysis to identify potential patterns in the data.
