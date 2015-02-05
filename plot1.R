plot1 <- function() {
    # Read in the data from the local drive
    mydat <<- read.table("household_power_consumption.txt", header = TRUE, 
                        sep = ";", na.strings = "?")
    # Convert date and time to appropriate formats
    mydat$Date <- as.Date(mydat$Date, "%d/%m/%Y")
    mydat$Time <- strptime(mydat$Time, "%X")
    # Pull out records of interest (2007-02-01 to 2007-02-02
    newdat <- subset(mydat, Date > "2007-1-31")
    newdat <- subset(newdat, Date < "2007-2-3")
    # Create histogram in dislay window
    hist(newdat$Global_active_power, col = "red", 
         xlab = "Global Active Power (kilowatts)", 
         main = "Global Active Power")
    # Copy histogram to png file called "plot1.png"
    dev.copy(png, file = "plot1.png")
    dev.off()
}