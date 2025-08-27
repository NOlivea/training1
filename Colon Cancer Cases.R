library(readr)
data <- read_csv("data.csv")
View(data)

names(data)
summary(data)

summary(data$`108-CA06a. Cancer Colon (Cases)`)
summary(data$`108-CA06b. Cancer Colon (Deaths)`)

library(dplyr)

class(data)
class(data$`108-CA06a. Cancer Colon (Cases)`)

##renaming variables 
data <- data %>%
  rename(coloncancercases = `108-CA06a. Cancer Colon (Cases)`)

data <- data %>%
  rename(coloncancerdeaths = `108-CA06b. Cancer Colon (Deaths)`)

class(data$periodname)

##format the date variable
library(zoo)
data$month_year_date <- as.yearmon(data$periodname)

# Convert the character variable to a yearmon object
month_year_date <- as.yearmon(data$periodname)
summary(data$periodname)

library(ggplot2)

ggplot(data = data)

##Line graph for cases
ggplot(data = data ) + 
  aes(x =month_year_date , y = coloncancerdeaths) + geom_line()

## line graph for deaths
ggplot(data = data ) + 
  aes(x =month_year_date , y = coloncancercases) + geom_line()

ggplot(data, aes(x = month_year_date, y = coloncancercases)) +
  geom_point()+
  labs(title = "Cases by Month", x = "Month", y = "Number of Colon Cancer Cases")


ggplot(data, aes(x = month_year_date, y = coloncancercases)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Colon cancer cases Trend", x = "Month of 2023", y = "Number of Colon cancer Cases")

ggplot(data, aes(x = month_year_date, y = coloncancerdeaths)) +
  geom_bar(stat = "identity", fill = "red") +
  labs(title = "Colon cancer deaths Trend", x = "Month of 2023", y = "Number of Colon cancer Deaths")


ggplot(data, aes(x = month_year_date, y = coloncancercases)) +
  geom_line() +
  labs(title = "Colon Cancer Cases Over 12 Months", x = "Month of 2023", y = "Number of Colon Cancer Cases")

ggplot(data, aes(x = month_year_date, y = coloncancerdeaths)) +
  geom_line() +
  labs(title = "Colon Cancer Deaths Over 12 Months", x = "Month of 2023", y = "Number of Colon Cancer Deaths")


library(ggplot2)

# Create a point ggplot with deaths vs. cases
ggplot(data, aes(x = month_year_date)) +
  geom_point(aes(y = coloncancercases), color = "blue", size = 3) +
  geom_point(aes(y = coloncancerdeaths), color = "red", size = 3) +
  labs(title = "Colon Cancer Deaths vs Cases Over 12 Months",
       x = "Month",
       y = "Count",
       color = "Legend") +
  scale_color_manual(values = c("cases" = "blue", "deaths" = "red")) +
  theme_minimal()

# Create a line ggplot with deaths vs. cases
ggplot(data, aes(x = month_year_date)) +
  geom_line(aes(y = coloncancercases), color = "blue", size = 2) +
  geom_line(aes(y = coloncancerdeaths), color = "red", size = 2) +
  labs(title = "Colon Cancer Deaths vs Cases Over 12 Months",
       x = "Month",
       y = "Count",
       color = "Legend") +
  scale_color_manual(values = c("cases" = "blue", "deaths" = "red")) +
  theme_minimal()










