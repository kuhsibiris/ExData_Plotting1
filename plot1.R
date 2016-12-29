 # This script makes the first graph plot1.png

#start with an empty space

rm(list=ls())

setwd("/home/andres/exploratoryDataAnalHW1/ExData_Plotting1")

library(dplyr)

energydata<-read.csv2("household_power_consumption.txt")

energydata[energydata=="?"]<-NA

energydata2<-filter(energydata, as.Date(Date,format="%d/%m/%Y")==as.Date("01/02/2007",format="%d/%m/%Y")|as.Date(Date,format="%d/%m/%Y")==as.Date("02/02/2007",format="%d/%m/%Y"))

energydata2$Global_active_power<-energydata2$Global_active_power %>% as.character() %>% as.numeric()


png("plot1.png")
hist(energydata2$Global_active_power, col="red", xlim=c(0,6), 
     xlab = "Global active power (killowatts)",main="Giobal active power")
dev.off()

