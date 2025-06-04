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
library(BBmisc)
library(plumber)

#*@apiTitle Api examen 2025
#*@apiDescription Histograma
#*@param Transformacion
#*@post histograma
#*@serializer png


function(Transformacion = T){
  library(dplyr)
  df<-df[,-c(12:14)]
  
  if(Transformacion ==T){
    x<-normalize(df$Minutes)}
  else{
    x<-df$Minutes
  }
  y<-hist(x)
  return(y)
  }


 
