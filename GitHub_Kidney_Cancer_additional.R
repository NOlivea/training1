library(ggplot2)
library(epitrix)

data <- read_csv("~/GitHub/training1/data.csv")

View(data)

summary(data)

library(dplyr)
library(zoo)

glimpse(data)

names(data)

# Renaming variables
names(data) <- c("id","period","code", "description","kidney.cases", "kidney.deaths", "breast.cases", "breast.deaths", "prostate.cases","prostate.deaths", "lung.cases", "lung.deaths","liver.cases", "liver.deaths", "colon.cases", "colon.deaths", "others.cases", "others.deaths")

data$kidney.cases

data$kidney.deaths

# changing the period variable to date type 
data$period <- as.yearmon(data$period, "%B %Y")


# Scatter plot for cases per period
ggplot(data=data, aes(x= period, y= kidney.cases))+   
  geom_point(na.rm = TRUE) +
  labs(title= "Cases per period", x= "Period", y= "Kidney cancer cases") +
  theme(axis.text.x = element_text(size = 8))

ggplot(data, aes(x = kidney.cases, y = kidney.deaths)) +
  geom_point(na.rm = TRUE) +
  geom_smooth(method = "lm", se = FALSE, color = "blue") +
  labs(title = "Scatter Plot with Trendline", x = "Kidney Cases", y = "Kidney Deaths")

#Bar graphs comparing the cases and deaths
bar_plot <- ggplot(data, aes(x = 1, y = kidney.cases, fill = "Cases")) +
  geom_bar(stat = "identity", position = "stack", color = "black") +
  geom_bar(aes(x = 2, y = kidney.deaths, fill = "Deaths"), stat = "identity", position = "stack", color = "black") +
  labs(title = "Kidney Cancer Cases and Deaths", x = NULL, y = "Count") +
  scale_x_continuous(breaks = c(1, 2), labels = c("Cases", "Deaths")) +
  scale_fill_manual(values = c("Cases" = "lightblue", "Deaths" = "lightcoral"))
print(bar_plot)


# Box plots for cases and deaths
box_plot <- ggplot(data, aes(x = 1, y = kidney.cases, fill = "Cases")) +
  geom_boxplot(color = "black", alpha = 0.7) +
  geom_boxplot(aes(x = 2, y = kidney.deaths, fill = "Deaths"), color = "black", alpha = 0.7) +
  labs(title = "Kidney Cancer Cases and Deaths", x = NULL, y = "Count") +
  scale_x_continuous(breaks = c(1, 2), labels = c("Cases", "Deaths")) +
  scale_fill_manual(values = c("Cases" = "lightblue", "Deaths" = "lightcoral"))
print(box_plot)


# Time Series Plot of Kidney Cases and Deaths
ggplot(data, aes(x = period)) +
  geom_line(aes(y = kidney.cases, color = "Cases"), size = 1.2) +
  geom_line(aes(y = kidney.deaths, color = "Deaths"), size = 1.2) +
  labs(title = "Time Series Plot of Kidney Cancer Cases and Deaths", y = "Count") +
  scale_color_manual(values = c("Cases" = "blue", "Deaths" = "red"))


# Total number of cases and deaths by year
ggplot(data, aes(x = period)) +
  geom_bar(aes(y = kidney.cases, fill = "Cases"), stat = "sum", position = "stack") +
  geom_bar(aes(y = kidney.deaths, fill = "Deaths"), stat = "sum", position = "stack") +
  labs(title = "Total Kidney Cancer Cases and Deaths per period", y = "Total Count") +
  scale_fill_manual(values = c("Cases" = "green", "Deaths" = "lightcoral"))


# Density plot of Kidney cases and Deaths
ggplot(data, aes(x = kidney.cases)) +
  geom_density(fill = "blue", alpha = 0.5) +
  geom_density(aes(x = kidney.deaths), fill = "red", alpha = 0.5) +
  labs(title = "Density Plot of Kidney Cancer Cases and Deaths")

#Incidence plot for kidney cancer cases
data$kidney.cases[is.na(data$kidney.cases)] <- mean(data$kidney.cases, na.rm = TRUE)

data_new <- data.frame (date = seq(as.yearmon("Feb 2023"), as.yearmon("Jan 2024"), by = "months"),
  +   cases = cumsum(rpois(length(data$kidney.cases), lambda = lambda)))
lambda <- sum(data$kidney.cases) / length(data$kidney.cases)
print(lambda)

ggplot(data, aes(x = period, y = factor(kidney.cases), fill = kidney.deaths)) +
  geom_tile() +
  labs(title = "Heatmap: Kidney Cases vs. Deaths", x = "Period", y = "Kidney Cases", fill = "Kidney Deaths")

# heat map
ggplot(data, aes(x = period, y = factor(kidney.cases), fill = kidney.deaths)) +
  geom_tile() +
  labs(title = "Heatmap: Kidney Cases vs. Deaths", x = "Period", y = "Kidney Cases", fill = "Kidney Deaths") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))