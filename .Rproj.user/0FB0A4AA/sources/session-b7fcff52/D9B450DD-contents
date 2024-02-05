library(readr)
library(dplyr)
library(zoo)
library(ggplot2)
library(cowplot)
data <- read_csv("data.csv")
View(data)

summary(data)
colnames(data)

glimpse(data)

### remaning data variables####
names(data) <- c("id","period","code", "description","kidney.cases", 
                 "kidney.deaths", "breast.cases", "breast.deaths",
                 "prostate.cases","prostate.deaths", "lung.cases", 
                 "lung.deaths","liver.cases", "liver.deaths",
                 "colon.cases", "colon.deaths", "others.cases", "others.deaths")

######summary stats for colon###

summary(data$colon.cases)
summary(data$colon.deaths)


#########formating date structure####
data$period<-as.yearmon(data$period, format = "%B %Y")

#################### plots#############


A<-ggplot(data = data) +
  aes(x = period, y = colon.cases) + 
  geom_point() +
  geom_smooth(method = lm, se=FALSE)+
  labs(title="scatter plot of colon cases")


B<-ggplot(data = data) +
  aes(x = period, y = colon.deaths) + 
  geom_point() +
  geom_smooth(method = lm, se=FALSE)+
  labs(title="Scatter plot of colon deaths")


C<-ggplot(data = data) +
  geom_boxplot(aes(x = 1, y = colon.cases, fill="blue"))+
  geom_boxplot(aes(x = 2, y = colon.deaths, fill="red"))+
  scale_x_continuous(breaks = c(1,2),labels=c("Cases","Deaths"))+
  labs(title="Box plot of colon cases and deaths")


D<-ggplot(data = data)+
  aes(x=period)+
  geom_bar(aes(y = colon.cases, fill="blue"),stat = "sum",position = "stack")+
  geom_bar(aes(y = colon.deaths, fill="red"),stat = "sum",position = "stack")+
  labs(title="Bar plot of colon cases and deaths")


E<-ggplot(data = data)+
  aes(x=period)+
  geom_line(aes(y = colon.cases, color="blue"))+
  geom_line(aes(y = colon.deaths, color="red"))+
  labs(title="Line plot of colon cases and deaths")

G <- ggplot(data = data) +
  aes(x = colon.cases, y = colon.deaths) +
  geom_point()+
  geom_smooth(method = "lm", se=FALSE)+
  labs(title="Scatter plot of colon cases and deaths")





plot_grid(A, B, C, D, E, G, ncol = 3, nrow = 2)
