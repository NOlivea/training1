View (data)
str(data)

#converting date to a date structure
# install.packages("anytime")
summary(data)
library(dplyr)
my_data <- data

#rename variables
data <- data %>% rename(other_cancers_cases = `108-CA10a. Others Cancers (Cases)`)

data <- data %>% rename(other_cancers_deaths = '108-CA10b. Others Cancers (Deaths)'`)
View (data)`

#remove missing values
# Assuming your data frame is named 'data' and the variable to drop is 'variable_to_drop'
data <- subset(data, select = -perioddescription)
# Assuming your dataset is named 'data'
clean_data <- data[complete.cases(data), ]
summary(clean_data)


library(ggplot2)

# Create a modified P-P plot for 'other_cancers_cases'
ggplot(clean_data, aes(sample = other_cancers_cases)) +
  stat_qq(color = "red") +  # Set the color of points to red
  stat_qq_line(linetype = "dotted", color = "black") +  # Change line to dotted and color to black
  labs(
    title = "P-P Plot of other_cancers_cases",
    x = NULL,  # Remove X-axis label
    y = "Frequency of cases of other cancers"  # Y-axis label
  ) +
  theme_minimal() +  # Optional: Use a minimal theme for cleaner appearance
  theme(axis.text.x = element_blank())  # Optional: Remove X-axis text

summary(clean_data$other_cancers_cases)


# Create a modified P-P plot
ggplot(clean_data, aes(sample = other_cancers_deaths)) +
  stat_qq(color = "red") +  # Set the color of points to red
  stat_qq_line(linetype = "dotted", color = "black") +  # Change line to dotted and color to black
  labs(
    title = "P-P Plot of other_cancers_deaths",
    x = NULL,  # Remove X-axis label
    y = "Frequency of death from other cancers"  # Y-axis label
  ) +
  theme_minimal() +  # Optional: Use a minimal theme for cleaner appearance
  theme(axis.text.x = element_blank())  # Optional: Remove X-axis text
```
summary(clean_data$other_cancers_cases)


# Create a line graph with 'period_name' on the X-axis
ggplot(clean_data, aes(x = periodname)) +
  geom_line(aes(y = other_cancers_deaths, group = 1), color = "red", linetype = "solid") +
  geom_line(aes(y = other_cancers_cases, group = 2), color = "blue", linetype = "dashed") +
  labs(
    title = "Line Graph of Other Cancers Deaths and Cases by Period",
    x = "Month of the year",
    y = "Count"  # Change Y-axis label as needed
  ) +
  theme_minimal() +  # Optional: Use a minimal theme for cleaner appearance
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +  # Adjust the angle of X-axis labels
  scale_x_discrete(labels = function(x) ifelse(seq_along(x) %% 2 == 1, "", x))  # Display every second label





