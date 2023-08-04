

# Boxplots of the dataset

library(ggplot2)
library(tidyr)

# Exclude "date", "hour", "PULocationID", and "DOLocationID" columns
selected_cols <- setdiff(names(merged_data), c("date", "hour", "PULocationID", "DOLocationID"))

# Create a new window
windows()

# Create box plots with individual scales
plot_data <- merged_data %>%
  gather(variable, value, selected_cols)

ggplot(plot_data, aes(x = "", y = value)) +
  geom_boxplot() +
  labs(x = NULL, y = "Value") +
  ggtitle("Summary of Box Plots (Excluding Date, Hour, PULocationID, and DOLocationID)") +
  facet_wrap(~ variable, scales = "free_y") +
  theme(axis.text.x = element_blank(), axis.ticks.x = element_blank())

