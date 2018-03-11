library(sqldf)
##plot1
##Read data file

setwd("~/Data Science/ExploratoryDataAnalysis/Week 1/data")
household <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

epc <-subset(household, date >= "2007-01-01" & date <= "2007-01-02")
##head(epc)
##summary(epc)
##create numeric variable 
globalActivePower <- as.numeric(epc$Global_active_power) 
png("plot1.png", width=480, height=480) 
hist(globalActivePower,col="red",main="Global Active Power", xlab="Global Active Power(kilowatts)" )
dev.off()