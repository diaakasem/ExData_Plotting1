# Read the csv data file
class = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv(file = "household_power_consumption.txt", sep=";", colClass=class, na.strings="?")
dateFormat <- "%d/%m/%Y"
df$DateTime <- strptime(paste(df$Date, df$Time), paste(dateFormat, "%H:%M:%S"))
df$Date <- as.Date(df$Date, dateFormat)
subsetDates <- as.Date(c("01/02/2007", "02/02/2007"), dateFormat)
df <- subset(df, Date %in% subsetDates)

# Opening  png device
png("plot2.png", width=800, height=800)

# Plotting the data
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Closing the device
dev.off()

