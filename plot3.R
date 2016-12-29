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
factor2num<-function(x){x%>% as.character()%>% as.numeric()}
energydata2[7:9]<-apply(energydata2[7:9],2,factor2num)

png("plot3.png")
par(mar=c(2,4.1,2,2.1))
plot(energydata2$TotDate,energydata2$Sub_metering_1,col="white", ylab= "Energy Sub Metering")
lines(energydata2$TotDate,energydata2$Sub_metering_1,col="black")
lines(energydata2$TotDate,energydata2$Sub_metering_2,col="red")
lines(energydata2$TotDate,energydata2$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_Mettering_1","Sub_Mettering_2","Sub_Mettering_3"),lty=c(1,1,1),col=c("red","blue","black"))
dev.off()