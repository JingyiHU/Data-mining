setwd("~/Documents/Etudes_Informatique/Cours/UTC/GI04/SY09_Data_Mining/TPs")
getwd()
source("TP0/prodtrans.R")
A<-matrix(1:9,nrow=3,byrow=T)
B<-matrix(c(5,3,7,4,6,3,1,6,3,2,8,5),nrow=4,byrow=T)
ptA = prodtrans(A)
ptB = prodtrans(B)

