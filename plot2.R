 # This script makes the first graph plot1.png

#start with an empty space

rm(list=ls())

setwd("/home/andres/exploratoryDataAnalHW1/ExData_Plotting1")

library(dplyr)

energydata<-read.csv2("household_power_consumption.txt")

energydata[energydata=="?"]<-NA

energydata2<-filter(energydata, as.Date(Date,format="%d/%m/%Y")==as.Date("01/02/2007",format="%d/%m/%Y")|as.Date(Date,format="%d/%m/%Y")==as.Date("02/02/2007",format="%d/%m/%Y"))



energydata2$Global_active_power<-energydata2$Global_active_power %>% as.character() %>% as.numeric()

energydata2$WD<-as.Date(energydata2$Date,format="%d/%m/%Y") %>% weekdays.Date()

energydata2$TotDate<- paste(as.Date(energydata2$Date,format="%d/%m/%Y"),energydata2$Time)

energydata2$TotDate<-energydata2$TotDate %>% as.POSIXct()

png("plot2.png")
par(mar=c(2,4.1,2,2.1))
plot(energydata2$TotDate,energydata2$Global_active_power,col="white", ylab= "Global active power (killowatts)")
lines(energydata2$TotDate,energydata2$Global_active_power)
dev.off()