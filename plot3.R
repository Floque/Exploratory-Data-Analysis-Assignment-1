## Assignment Course Project 1

## Plot 3

setwd("G:/Praktikum Helmholtz/R/Coursera/Exploring Data Week1/Assignment Course Project 1")

dir()

data <- read.table("household_power_consumption.txt", sep=";",
                   header=T,stringsAsFactors=FALSE, dec=".")
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
str(data_sub)


time <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S", 
                 tz="US/Central") 
head(time)

Sub_metering_1 <- as.numeric(data_sub$Sub_metering_1)
Sub_metering_2 <- as.numeric(data_sub$Sub_metering_2)
Sub_metering_3 <- as.numeric(data_sub$Sub_metering_3)

summary(Sub_metering_1)
summary(Sub_metering_2)
summary(Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(time, Sub_metering_1, type ="n", xlab="", ylab="Energy sub metering")
lines(time, Sub_metering_1)
lines(time, Sub_metering_2, col="red")
lines(time, Sub_metering_3, col="blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
                             col= c("black", "red","blue"),lty=1, lwd=2)
dev.off()
