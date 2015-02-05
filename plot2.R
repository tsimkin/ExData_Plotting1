plot2 <- function() {
    # Read in the data from the local drive
    mydat <<- read.table("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?")
    # Convert date and time to appropriate formats
    mydat$Date <- strptime(paste(mydat$Date,mydat$Time), "%d/%m/%Y %H:%M:%S")
    # Pull out records of interest (2007-02-01 to 2007-02-02
    newdat <- subset(mydat, Date > "2007-2-1")
    newdat <- subset(newdat, Date < "2007-2-3")
    # Create xy plot of GAP vs. Time
    plot(newdat$Date, newdat$Global_active_power, type = "l", xlab = "", 
         ylab = "Global Active Power (kilowatts)")
    # Copy plot to png file called "plot2.png"
    dev.copy(png, file = "plot2.png")
    dev.off()
}