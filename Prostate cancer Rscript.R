
library(readr)
library(ggplot2)
data <- read_csv("data.csv")



### DATA CLEANING
#names(data)[names(data) == "$ 108-CAO3a. prostate (Cases)"] <- "Prostate Cases"
#new <- names(data)[names(data) == "$ 108-CAO3a. prostate (Deaths)"] <- "Prostate Deaths"

names(data) <- c("id","period","code", "description","kidney.cases", "kidney.deaths", "breast.cases", "breast.deaths", "prostate.cases","prostate.deaths", "lung.cases", "lung.deaths","liver.cases", "liver.deaths", "colon.cases", "colon.deaths", "others.cases", "others.deaths")

data$period <- as.Date(paste0(data$period, "01"), format = "%B %Y%d")

#print(data)

### Points
ggplot(data = data ) + 
  aes(x = period, y = prostate.cases)+
  geom_point(aes(color = prostate.cases))+
  geom_smooth(method =lm)

###HISTOGRAM
ggplot(data, aes(x = prostate.cases)) +
  geom_histogram(binwidth = 1, fill = "#0080ff", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Prostate Cases",
       x = "Number of Prostate Cases",
       y = "Frequency")

ggplot(data, aes(x = prostate.deaths)) +
  geom_histogram(binwidth = 1, fill = "#ff00bf", color = "black", alpha = 0.7) +
  labs(title = "Histogram of Prostate Deaths",
       x = "Number of Prostate Deaths",
       y = "Frequency")

###BAR PLOT
ggplot(data, aes(x = period, y = prostate.cases)) +
  geom_bar(stat = "identity", fill = "#0080ff", color = "black", alpha = 0.7) +
  labs(title = "Prostate Cases Over Time",
       x = "Period",
       y = "Number of Prostate Cases") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 


ggplot(data, aes(x = period, y = prostate.deaths)) +
  geom_bar(stat = "identity", fill = "#ff00bf", color = "black", alpha = 0.7) +
  labs(title = "Prostate Deaths Over Time",
       x = "Period",
       y = "Number of Prostate Deaths") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

ggplot(data, aes(x = "", y = prostate.cases)) +
  geom_boxplot(fill = "#0080ff", color = "black", alpha = 0.7) +
  labs(title = "Box Plot for Prostate Cases",
       x = "",
       y = "Number of Prostate Cases") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
#ggplot(data) + aes(x = period, y = Sepal.Length, color = Species) + geom_boxplot()

ggplot(data, aes(x = "", y = prostate.deaths)) +
  geom_boxplot(fill = "#ff00bf", color = "black", alpha = 0.7) +
  labs(title = "Box Plot for Prostate Deaths",
       x = "",
       y = "Number of Prostate Deaths") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 
#ggplot(data) + aes(x = period, y = Sepal.Length, color = Species) + geom_boxplot()

library(tidyr)
data_long <- gather(data, key = "Variable", value = "Count", prostate.cases, prostate.deaths)

# Create a box plot for prostate cases and deaths
ggplot(data_long, aes(x = Variable, y = Count, fill = Variable)) +
  geom_boxplot() +
  labs(title = "Box Plot for Prostate Cases and Deaths",
       x = "Variable",
       y = "Count") +
  scale_fill_manual(values = c("#0080ff", "#ff00bf")) +
  theme_minimal()

ggplot(data, aes(x = prostate.cases, fill = period)) +
  geom_density(alpha = 0.7, color = "black") +
  labs(title = "Density Plot for Prostate Cases",
       x = "Number of Prostate Cases",
       y = "Density") +
  theme_minimal()

### LINE PLOT
ggplot(data) +
  aes(x = period, y = prostate.deaths) +
  labs(x="Period", y="Prostate deaths")+
  ggtitle("Line plot of prostate deaths by Period")+
  geom_line()

ggplot(data) +
  aes(x = period, y = prostate.cases) +
  labs(x="Period", y="Prostate cases")+
  ggtitle("Line plot of prostate cases by Period")+
  geom_line()

ggplot(data, aes(x = period)) +
  geom_line(aes(y = prostate.cases, color = "Prostate Cases"), size = 1.5) +
  geom_line(aes(y = prostate.deaths, color = "Prostate Deaths"), size = 1.5, linetype = "dashed") +
  labs(title = "Prostate Cases and Deaths Over Time",
       x = "Period",
       y = "Count",
       color = "Legend") +
  theme_minimal() +
  scale_color_manual(values = c("Prostate Cases" = "#0080ff", "Prostate Deaths" = "#ff00bf"))

## AREA PLOT
ggplot(data) +
  aes(x = period, y = prostate.cases) +
  labs(x="Period", y="Prostate cases")+
  ggtitle("Area plot of prostate cases by period")+
  geom_area()

ggplot(data) +
  aes(x = period, y = prostate.deaths) +
  labs(x="Period", y="Prostate deaths")+
  ggtitle("Area plot of prostate Deaths by period")+
  geom_area()

# Create an area plot for prostate cases and deaths
ggplot(data_long, aes(x = period, y = Count, fill = Variable)) +
  geom_area() +
  labs(title = "Area Plot for Prostate Cases and Deaths",
       x = "Period",
       y = "Count",
       fill = "Variable") +
  scale_fill_manual(values = c("#0080ff", "#ff00bf")) +
  theme_minimal()


