plot4 <- function() {
    # Read in the data from the local drive
    mydat <<- read.table("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?")
    # Convert date and time to appropriate formats
    mydat$Date <- strptime(paste(mydat$Date,mydat$Time), "%d/%m/%Y %H:%M:%S")
    # Pull out records of interest (2007-02-01 to 2007-02-02
    newdat <- subset(mydat, Date > "2007-2-1")
    newdat <- subset(newdat, Date < "2007-2-3")
    # Subsect screen into four plot areas
    par(mfrow = c(2,2))
    # First plot: GAP v Time
    plot(newdat$Date, newdat$Global_active_power, type = "l", xlab = "", 
         ylab = "Global Active Power (kilowatts)")
    # Second plot: Voltage v Time
    plot(newdat$Date, newdat$Voltage, type = "l", xlab = "datetime", 
         ylab = "Voltage")
    # Third plot: Energy sub metering vs. Time
    plot(newdat$Date, newdat$Sub_metering_1, type = "l", xlab = "", 
         ylab = "Energy sub metering")
    points(newdat$Date, newdat$Sub_metering_2, type = "l", col = "red")
    points(newdat$Date, newdat$Sub_metering_3, type = "l", col = "blue")
    legend("topright", pch = "_", col = c("black","blue", "red"), 
           legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
    # Fourth plot: GRP v Time
    plot(newdat$Date, newdat$Global_reactive_power, type = "l", 
         xlab = "datetime", ylab = "Global_reactive_power")
    # Copy plot to png file called "plot4.png"
    dev.copy(png, file = "plot4.png")
    dev.off()
}