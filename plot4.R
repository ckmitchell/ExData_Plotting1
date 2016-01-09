colNames <- names(read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))
powerData <- read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", na.strings = "?", sep = ";",
                        header = FALSE, col.names = colNames, skip = grep("^[1,2]/2/2007", 
                        readLines("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt"))-1, 
                        nrow = 2880)

##NOTE: use 'paste' in 'strptime' to paste two columns together into one date time column
dateTime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##create variables for 2 new graphs - voltage and global reactive power
globalReactive <- as.numeric(powerData$Global_reactive_power)
voltage <- as.numeric(powerData$Voltage)

##Question: can you use 'plot2.R' and 'plot3.R' so no need to recreate those variables?
globalActive <- as.numeric(powerData$Global_active_power)
subMeter1 <- as.numeric(powerData$Sub_metering_1)
subMeter2 <- as.numeric(powerData$Sub_metering_2)
subMeter3 <- as.numeric(powerData$Sub_metering_3)

png("plot4.png", width = 480, height = 480)
##Set par for all graphs
par(mfrow = c(2,2))

##graph order left to right, top to bottom
plot(dateTime, globalActive, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(dateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(dateTime, subMeter1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(dateTime, subMeter2, type = 'l', col = "red")
lines(dateTime, subMeter3, type = 'l', col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 1, col = c("black", "red", "blue"))

plot(dateTime, globalReactive, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()


