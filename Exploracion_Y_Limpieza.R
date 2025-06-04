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


#Limpieza

miss_var_summary(df)

vis_miss(df, cluster = T)

df$Seasons<-ifelse(df$type == "Movie", 0, df$Seasons)
df$Minutes<-ifelse(df$type == "TV Show", 0,df$Minutes)

summary(df)

df<-kNN(df,variable = c("listed_in","country"))

write.csv(df,"netflix_limpio.csv")
vis_miss(df, cluster = T) #Damos por finalizada la limpieza de datos 

