
# Correlation Plot

library(corrplot)

# Select only numeric columns from merged_data
numeric_data <- merged_data[, sapply(merged_data, is.numeric)]

# Calculate the correlation matrix
cor_matrix <- cor(numeric_data)

# Create a correlation plot with values
corrplot(cor_matrix, method = "circle", tl.cex = 0.8, diag = FALSE, addCoef.col = "black")