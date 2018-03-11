library(sqldf)
##plot1
##Read data file

setwd("~/Data Science/ExploratoryDataAnalysis/Week 1/data")
household <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

epc <-subset(household, date >= "2007-01-01" & date <= "2007-01-02")
##head(datetime)
summary(epc)
##create date time variable from date and time
datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##create numeric variable
globalActivePower <- as.numeric(epc$Global_active_power) 
SubMetering1 <- as.numeric(epc$Sub_metering_1) 
SubMetering2 <- as.numeric(epc$Sub_metering_2) 
SubMetering3 <- as.numeric(epc$Sub_metering_3) 
png("plot3.png", width=480, height=480) 
plot(datetime,SubMetering1,type='l', xlab = " ", ylab = "Energy sub metering")
lines(datetime,SubMetering2,col="red",type='l')
 lines(datetime,SubMetering3, col="blue",type='l')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()