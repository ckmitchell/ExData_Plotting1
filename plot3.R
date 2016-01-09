colNames <- names(read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))
powerData <- read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", na.strings = "?", sep = ";",
                        header = FALSE, col.names = colNames, skip = grep("^[1,2]/2/2007", 
                        readLines("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt"))-1, 
                        nrow = 2880)

##NOTE: use 'paste' in 'strptime' to paste two columns together into one date time column
dateTime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

##NOTE: make 3 variables here
subMeter1 <- as.numeric(powerData$Sub_metering_1)
subMeter2 <- as.numeric(powerData$Sub_metering_2)
subMeter3 <- as.numeric(powerData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)

##Use regular plot function and set display labels with first variable 'subMeter1'
##Use function 'lines' to add other variables and set par for each new line
plot(dateTime, subMeter1, type = 'l', xlab = "", ylab = "Energy sub metering")
lines(dateTime, subMeter2, type = 'l', col = "red")
lines(dateTime, subMeter3, type = 'l', col = "blue")

##Use 'legend' function to create legend
##Make sure to list variables and line color in same order
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = 1, lwd = 1, col = c("black", "red", "blue"))
dev.off()
