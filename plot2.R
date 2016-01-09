colNames <- names(read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))
powerData <- read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", na.strings = "?", sep = ";",
                        header = FALSE, col.names = colNames, skip = grep("^[1,2]/2/2007", 
                                                                          readLines("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt"))-1, 
                        nrow = 2880)
##NOTE: use 'paste' in 'strptime' to paste two columns together into one date time column
dateTime <- strptime(paste(powerData$Date, powerData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActive <- as.numeric(powerData$Global_active_power)
png("plot2.png", width = 480, height = 480)
plot(dateTime, globalActive, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)") 
dev.off()
##NOTE: to make a line plot, type should equal el 'l' not '1' - kind of hard to tell in pop-up desc
