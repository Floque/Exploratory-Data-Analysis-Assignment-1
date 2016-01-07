## Assignment Course Project 1

## Plot 2

setwd("G:/Praktikum Helmholtz/R/Coursera/Exploring Data Week1/Assignment Course Project 1")

dir()

data <- read.table("household_power_consumption.txt", sep=";",
                   header=T,stringsAsFactors=FALSE, dec=".")
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
str(data_sub)


?strptime
gap <- as.numeric(data_sub$Global_active_power)
time <- strptime(paste(data_sub$Date, data_sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S", 
                 tz="US/Central") 
head(time)

?plot

png(filename="plot2.png", width =480, height=480)
plot(time, gap, xlab="",ylab="Global Active Power (kilowatts)",
     main= "Global Active Power", type="l")

dev.off()
