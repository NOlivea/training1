library(dplyr)
View(livercancer)
library(ggplot2)
# define a canvas
ggplot(livercancer0)
livercancer0<-(data)
#data exploration
dim(livercancer0) # rows x columns
View(livercancer)

summary(livercancer0)

names(livercancer0)

nrow(livercancer0) 

ncol(livercancer0) 

## renaming variables
colnames(livercancer0)[colnames(livercancer0) == "periodcode"]<-"code"
colnames(livercancer0)[colnames(livercancer0) == "periodcode"]<-"code"
colnames(livercancer0)[colnames(livercancer0) == "periodname"]<-"date"
colnames(livercancer0)[colnames(livercancer0) == "108-CA05a. Cancer liver (Cases)"]<-"cases_lc"
colnames(livercancer0)[colnames(livercancer0) == "108-CA05b. Cancer liver (Deaths)"]<-"deaths_lc"

#data cleaning 
#change variable format
livercancer0$date <- as.Date(paste0(livercancer0$date,"01"), format = "%B %Y%d")


##Analysis

library(ggplot2) # needed each time you open RStudio
# The package ggplot2 must be installed first
##point plot cases
ggplot(livercancer0) +
  aes(y= cases_lc, x=date) +
  geom_point()

ggplot(livercancer0) +
  aes(y= cases_lc, x=date) +
  geom_line()

ggplot(livercancer0) +
  aes(y= deaths_lc, x=date) +
  geom_point()

##deaths
ggplot(livercancer0) +
  aes(y= deaths_lc, x=date) +
  geom_line()

##bar
ggplot(livercancer0) +
  aes(y= deaths_lc, x=date) +
  geom_line()
## Bar chart cases
ggplot(livercancer0) +
  aes(x=date, y= cases_lc) +
  geom_bar(stat="identity", fill="maroon")+ labs (title="Trend of liver cancer cases", x="Months", y="Number of liver cancer cases")

## Barchart deaths
ggplot(livercancer0) +
  aes(x=date, y= deaths_lc) +
  geom_bar(stat="identity", fill="maroon")+ labs (title="Trend of liver cancer deaths", x="Months", y="Number of deaths")


# Assuming your data frame is named 'your_data'
# Create a bar plot using ggplot2

ggplot(livercancer0, aes(x = date)) +
geom_line (aes(y=cases_lc), color="blue", position = "dodge", width = 3) + 
geom_line (aes(y=deaths_lc), color="red", position="dodge", width = 3) +  
labs(title = "Liver Cancer Cases and Deaths",
       x = "months",
       y = "Count of cases and deaths", fill="Legend") +
scale_fill_manual(values = c("Cases" = "blue", "Deaths" = "red")) + 
theme_minimal()
    

