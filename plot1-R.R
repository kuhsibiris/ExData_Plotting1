 # This script makes the first graph plot1.png

#start with an empty space

rm(list=ls())

setwd("/home/andres/exploratoryDataAnalHW1/ExData_Plotting1")

library(ggplot2)
library(dplyr)


energyData<-read.csv2("household_power_consumption.txt")
energyData[energyData=="?"]<-NA
energyData$Global_active_power<-energyData$Global_active_power %>%
              as.character() %>% as.numeric()

ggplot(data=energyData,aes(x=Global_active_power))+geom_histogram(fill="red",binwidth = 0.5,
        na.rm=T, color="black",center=0.25)+xlim(c(0,7))+ theme(plot.title = element_text(hjust=0.5),
        axis.line = element_line(color = "black"))+ ylim(c(0,1200))+
  labs(x="Global Active Power (kilowatts)",y="Frequency",title="Global Active Power")