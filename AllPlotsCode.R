setwd("D:/R Coursera/Explorative Data Analysis Week 1")

##
powerdata <- read.table("household_power_consumption.txt",
                        
                        na.strings = "?",
                        sep = ";",
                        header = FALSE,
                        skip = grep("^[1,2]/2/2007", readLines("household_power_consumption.txt"))-1,
                        nrow = 2879)

names(powerdata) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerdata$Global_active_power)

##
png("plot1.png", width=480, height=480)
hist(powerdata$Global_active_power, xlab = "Global Active Power (kilowatts)" , col = "red", main = "Global Active Power")
dev.off()

##
datetime <- strptime(paste(powerdata$Date, powerdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(powerdata$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()

##
Sub_metering_1 <- as.numeric(powerdata$Sub_metering_1)
Sub_metering_2 <- as.numeric(powerdata$Sub_metering_2)
Sub_metering_3 <- as.numeric(powerdata$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, powerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, powerdata$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col = "red")
lines(datetime, powerdata$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.8, lwd = 2)
dev.off()

##
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
Voltage <- as.numeric(powerdata$Voltage)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, powerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(datetime, powerdata$Sub_metering_2, type="l", xlab="", ylab="Energy sub metering", col = "red")
lines(datetime, powerdata$Sub_metering_3, type="l", xlab="", ylab="Energy sub metering", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), cex = 0.8, lwd = 2, bty="n")
Global_reactive_power <- as.numeric(powerdata$Global_reactive_power)
plot(datetime, Global_reactive_power, type="l", xlab="datetime", ylab= "Global_reactive_power")
dev.off()
