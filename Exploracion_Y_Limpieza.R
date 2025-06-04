library(digest)
library(discretization)
library(dplyr)
library(EnvStats)
library(fastDummies)
library(naniar)
library(nortest)
library(readxl)
library(smoothmest)
library(VIM)
library(plumber)


df<-read.csv("netflix.csv")

summary(df)

sd(df$Minutes,na.rm = T)
sd(df$Seasons,na.rm = T)

unique(df$type)
unique(df$country)
unique(df$director)

x<-df %>% group_by(df$director) %>% summarise(n())
