library(dplyr)
library(ggplot2)
library(ggtext)

categories <- c("Loyalty Programs", "Discount Finding Platforms", 
                "Product Comparison Platforms", 
                "Second-Hand Apps", "Ride Sharing Apps")

sub_categories <- c("Between 46-65", "Between 36-45", "Between 26-35", "Between 18-25")

values <- list(
  c(64, 60, 57, 43), # Loyalty Programs
  c(37, 37, 34, 34), # Discount Finding Platforms
  c(29, 36, 36, 26), # Product Comparison Platforms
  c(40, 47, 48, 32), # Second-Hand Apps
  c(13, 20, 31, 26)  # Ride Sharing Apps
)

# Creating the Dataframe
df <- data.frame(
  Category = rep(categories, each = length(sub_categories)),
  SubCategory = rep(sub_categories, times = length(categories)),
  Value = unlist(values)
)

# Creating the plot.
ggplot(df, aes(y = Category, x = Value, fill = SubCategory)) +
  geom_bar(stat = "identity", position = position_dodge()) +
  geom_text(aes(label = paste0(Value, "%")), 
            position = position_dodge(width = 0.9), 
            hjust = -0.2, size = 3.5) +
  scale_fill_manual(values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728")) +
  labs(
    title = "<span style='color:#003cff;'>Usage of cost-conscious technology</span>
    <span style='color:orange;'>before economic difficulty</span> <span style='color:#003cff;'>by age group</span>",
    x = "", 
    y = "",
    fill = ""
  ) +
  theme_minimal(base_size = 12) +
  theme(
    plot.title =  element_markdown(size = 20, face = "bold", hjust = 0.5),
    axis.text.x = element_text(size = 10),
    axis.text.y = element_text(size = 10),
    legend.position = "bottom"
  )
