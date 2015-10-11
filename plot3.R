# Read the csv data file
class = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv(file = "household_power_consumption.txt", sep=";", colClass=class, na.strings="?")
dateFormat <- "%d/%m/%Y"
df$DateTime <- strptime(paste(df$Date, df$Time), paste(dateFormat, "%H:%M:%S"))
df$Date <- as.Date(df$Date, dateFormat)
subsetDates <- as.Date(c("01/02/2007", "02/02/2007"), dateFormat)
df <- subset(df, Date %in% subsetDates)

# Opening  png device
png("plot3.png", width=400, height=400)

# Plotting the data
plot(df$DateTime, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
colors <- c("black", "red", "blue")
columns <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright", col=colors, columns, lty=1)

# Closing the device
dev.off()

