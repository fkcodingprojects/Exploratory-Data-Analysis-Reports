
# Summary of the dataset


library(tidyverse)
library(summarytools)

# Select columns except PULocationID and DOLocationID
selected_cols <- setdiff(names(merged_data), c("PULocationID", "DOLocationID"))

# Calculate summary statistics
summary_stats <- merged_data %>%
  select(all_of(selected_cols)) %>%
  summarytools::descr()

# Transpose the summary statistics
summary_stats_transposed <- t(summary_stats)

# Convert to a data frame
summary_df <- as.data.frame(summary_stats_transposed)

# Create the table plot
table_plot <- kbl(summary_df) %>%
  kable_styling(bootstrap_options = c("striped", "hover", "condensed"))

# Display the table plot
table_plot

