## Assignment Course Project 1

## Plot 1

setwd("G:/Praktikum Helmholtz/R/Coursera/Exploring Data Week1/Assignment Course Project 1")

dir()

data <- read.table("household_power_consumption.txt", sep=";",
                  header=T,stringsAsFactors=FALSE, dec=".")
data_sub <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
str(data_sub)

gap <- as.numeric(data_sub$Global_active_power)

png(filename= "plot1.png", width =480, height =480)
hist(gap, col="red", xlab="Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()
