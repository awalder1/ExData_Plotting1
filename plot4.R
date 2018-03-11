library(sqldf)
##plot1
##Read data file

setwd("~/Data Science/ExploratoryDataAnalysis/Week 1/data")
household <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") 

epc <-subset(household, date >= "2007-01-01" & date <= "2007-01-02")
head(epc)
summary(epc)
##create date time variable from date and time
datetime <- strptime(paste(epc$Date, epc$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
##create numeric variable
globalActivePower <- as.numeric(epc$Global_active_power) 
SubMetering1 <- as.numeric(epc$Sub_metering_1) 
SubMetering2 <- as.numeric(epc$Sub_metering_2) 
SubMetering3 <- as.numeric(epc$Sub_metering_3) 
voltage <- as.numeric(epc$Voltage) 
GlobalReactivePower <- as.numeric(epc$Global_reactive_power) 
png("plot4.png", width=480, height=480) 
par(mfrow = c(2, 2))
plot(datetime,globalActivePower,main="Global Active Power" ,type="l", xlab=" ", ylab="Global Active Power(kilowatts)", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 

plot(datetime,SubMetering1,type="l", xlab = " ", ylab = "Energy sub metering")
lines(datetime,SubMetering2,type="l",col="red")
lines(datetime,SubMetering3,type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n", cex=0.7) 
plot(datetime,GlobalReactivePower,type="l", xlab="datetime", ylab="Global Reactive Power" )
dev.off()
 
