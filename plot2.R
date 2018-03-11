library(sqldf)
##plot1
##Read data file

setwd("~/Data Science/ExploratoryDataAnalysis/Week 1/data")
household <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

epc <-subset(household, date >= "2007-01-01" & date <= "2007-01-02")
##head(datetime)
##summary(epc)
##create date time variable from date and time
datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##create numeric variable
globalActivePower <- as.numeric(epc$Global_active_power) 
png("plot2.png", width=480, height=480) 
plot(datetime,globalActivePower,main="Global Active Power" ,type='l', xlab=" ", ylab="Global Active Power(kilowatts)" )
dev.off()