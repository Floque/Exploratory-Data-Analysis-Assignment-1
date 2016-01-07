## Assignment Course Project 1

## Plot 4

setwd("G:/Praktikum Helmholtz/R/Coursera/Exploring Data Week1/Assignment Course Project 1")

dir()

data <- read.table("household_power_consumption.txt", sep=";",
                   header=T,stringsAsFactors=FALSE, dec=".")

data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
str(data_sub)


time <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S", 
                 tz="US/Central") 
gap <- as.numeric(data_sub$Global_active_power)
Sub_metering_1 <- as.numeric(data_sub$Sub_metering_1)
Sub_metering_2 <- as.numeric(data_sub$Sub_metering_2)
Sub_metering_3 <- as.numeric(data_sub$Sub_metering_3)

## for Plot 2+4 

voltage <- as.numeric(data_sub$Voltage)
Global_reactive_power <- as.numeric(data_sub$Global_reactive_power)




png(filename= "plot4.png", width =480, height =480)
par(mfrow= c(2,2))
plot(time, gap, xlab="",ylab="Global Active Power", type="l")

plot(time, voltage, xlab="datetime", ylab="Voltage",type="l")

plot(time, Sub_metering_1, type ="l", xlab="", ylab="Energy sub metering")
lines(time, Sub_metering_2, col="red")
lines(time, Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=, lwd=2.5, col=c("black", "red", "blue"), bty="n")


plot(time, Global_reactive_power, xlab="datetime",type="l")

dev.off()
