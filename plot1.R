colNames <- names(read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", nrow=1, header=TRUE, sep=";"))
powerData <- read.table("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt", na.strings = "?", sep = ";",
                        header = FALSE, col.names = colNames, skip = grep("^[1,2]/2/2007", 
                        readLines("E:\\Coursera\\DataAnalysis\\household_power_consumption.txt"))-1, 
                        nrow = 2880)
globalActive <- as.numeric(powerData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(globalActive, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()
