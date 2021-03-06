setwd("D:/R Coursera/Explorative Data Analysis Week 1")

##
powerdata <- read.table("household_power_consumption.txt",
           
             na.strings = "?",
             sep = ";",
             header = FALSE,
             skip = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))-1,
             nrow = 2879)

names(powerdata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

png("plot1.png", width=480, height=480)
hist(powerdata$Global_active_power, xlab = "Global Active Power (kilowatts)" , col = "red", main = "Global Active Power")
dev.off()
