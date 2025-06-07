# teaching_stats_demo.R

library(tidyverse)

# Load simulated dataset
data <- read_csv("simulated_health_data.csv")

# t-test between groups
t_test_result <- t.test(cholesterol ~ group, data = data)
print(t_test_result)

# Simple regression: cholesterol ~ age
model <- lm(cholesterol ~ age, data = data)
summary(model)

# Visualization
ggplot(data, aes(x = age, y = cholesterol, color = group)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    title = "Cholesterol vs. Age by Activity Group",
    x = "Age",
    y = "Cholesterol (mg/dL)"
  ) +
  theme_minimal()
