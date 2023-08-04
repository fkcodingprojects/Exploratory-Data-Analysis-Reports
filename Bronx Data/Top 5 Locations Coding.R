
# Top 5 Locations

library(dplyr)
library(ggplot2)
library(gt)

top_pickup <- pickup_counts %>% 
  top_n(20, Frequency) %>%
  rename(LocationID = PULocationID, Pickup_Count = Frequency)

top_dropoff <- dropoff_counts %>% 
  top_n(20, Frequency) %>%
  rename(LocationID = DOLocationID, Dropoff_Count = Frequency)

combined_table <- full_join(top_pickup, top_dropoff, by = "LocationID")

combined_table <- combined_table %>%
  top_n(5, Pickup_Count) %>%
  arrange(desc(Dropoff_Count))

combined_table_df <- as.data.frame(combined_table)

# Create the gt table
table_plot <- gt(combined_table_df) %>%
  cols_label(LocationID = "Location ID", Pickup_Count = "Pickup Count")

# Display the table plot
table_plot