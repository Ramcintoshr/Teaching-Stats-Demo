# teaching_stats_demo.R

# Simulated example for teaching t-tests and regression

library(tidyverse)

# Simulated data: cholesterol levels by exercise group
set.seed(123)
data <- tibble(
  group = rep(c("Low Activity", "High Activity"), each = 30),
  cholesterol = c(rnorm(30, 215, 20), rnorm(30, 190, 18)),
  age = sample(25:60, 60, replace = TRUE)
)

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
