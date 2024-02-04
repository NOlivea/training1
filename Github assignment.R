names(data) <- c("id","period","code", "description","kidney.cases", "kidney.deaths", "breast.cases", "breast.deaths", "prostate.cases","prostate.deaths", "lung.cases", "lung.deaths","liver.cases", "liver.deaths", "colon.cases", "colon.deaths", "others.cases", "others.deaths")


# Assuming 'data' is your dataframe
library(lubridate)

# Convert 'period' to a date format
data$period <- dmy(paste("01", data$period))

library(ggplot2)
# Now you can proceed with your ggplot code
ggplot(data = data) + 
  aes(x = period, y = breast.cases) +
  geom_line(color = "red", size = 1) +
  ggtitle("Breast Cancer Cases Over Time") +
  xlab("Period") +
  ylab("Number of Cases")

library(ggplot2)

# Assuming 'data' is your dataframe
ggplot(data = data) + 
  aes(x = period, y = breast.cases) +
  geom_point(color = "skyblue", size = 3, shape = 16) +  # Adjust color, size, and shape as needed
  ggtitle("Breast Cancer Cases Over Time") +
  xlab("Period") +  # Label for x-axis
  ylab("Number of Cases")  # Label for y-axis

library(ggplot2)
ggplot(data = data) + 
  aes(x = period, y = breast.deaths) +
  geom_line(color = "purple", size = 1) +
  ggtitle("Breast Cancer Cases Over Time") +
  xlab("Period") +
  ylab("Number of Cases")

library(ggplot2)
ggplot(data = data) + 
  aes(x = period, y = breast.deaths) +
  geom_point(color = "green", size = 3, shape = 16) +  # Adjust color, size, and shape as needed
  ggtitle("Breast Cancer Cases Over Time") +
  xlab("Period") +  # Label for x-axis
  ylab("Number of Cases")  # Label for y-axis

library(ggplot2)
ggplot(data = data) + 
  aes(x = period, y = breast.cases) +
  geom_line(color = "red", size = 2) +  # Adjust color and size for cases
  geom_line(aes(y = breast.deaths), color = "blue", size = 2) +  # Adjust color and size for deaths
  ggtitle("Breast Cancer Cases and Deaths Over Time") +
  xlab("Period") +
  ylab("Number of Cases/Deaths")

library(ggplot2)
ggplot(data) +
  aes(breast.cases) +
  geom_histogram() +
  ggtitle("Breast Cases")

library(ggplot2)
ggplot(data) +
  aes(breast.deaths) +
  geom_histogram(fill ="cornflowerblue")+
  ggtitle("Breast Deaths")


library(ggplot2)
ggplot(data) +
  aes(x = period, y = breast.cases) +
  geom_boxplot(fill = "lightgreen") +
  ggtitle("Boxplot of Breast Cancer Cases") +
  xlab("Period") +
  ylab("Number of Cases")

library(ggplot2)
ggplot(data) +
  aes(x = period, y = breast.deaths) +
  geom_boxplot(fill = "cornflowerblue") +
  ggtitle("Breast Cancer Deaths") +
  xlab("Period") +
  ylab("Number of Cases")

library(ggplot2)
ggplot(data = data) + 
  aes(x = period, y = breast.cases) +
  geom_boxplot(color = "red") +  # Adjust color and size for cases
  geom_boxplot(aes(y = breast.deaths), color = "blue") +  # Adjust color and size for deaths
  ggtitle("Breast Cancer Cases and Deaths Over Time") +
  xlab("Period") +
  ylab("Number of Cases/Deaths")

library(ggplot2)
ggplot(data = data) +
  aes(x = period, y = breast.deaths) +
  geom_boxplot() +
  geom_jitter(position = position_jitter(0.2))

library(ggplot2)
ggplot(data = data) +
  aes(x = breast.cases) + 
  geom_density( alpha = 0.3)

ggsave("ggplot2.pdf")
