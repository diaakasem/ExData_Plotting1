# Read the csv data file
class = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv(file = "household_power_consumption.txt", sep=";", colClass=class, na.strings="?")
dateFormat <- "%d/%m/%Y"
df$DateTime <- strptime(paste(df$Date, df$Time), paste(dateFormat, "%H:%M:%S"))
df$Date <- as.Date(df$Date, dateFormat)
subsetDates <- as.Date(c("01/02/2007", "02/02/2007"), dateFormat)
df <- subset(df, Date %in% subsetDates)

# Opening  png device
png("plot4.png", width=800, height=800)

# Splitting the canvas to 2 rows and 2 columns
par(mfrow=c(2,2))

# Plotting Top left Graph
#
plot(df$DateTime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# Plotting Top Right Graph
# 
plot(df$DateTime, df$Voltage, type="l", xlab="datetime", ylab="Voltage")

# Plotting Bottom left Graph
#
plot(df$DateTime, df$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(df$DateTime, df$Sub_metering_2, col="red")
lines(df$DateTime, df$Sub_metering_3, col="blue")
columns <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
colors <- c("black", "red", "blue")
legend("topright", col=colors, columns, lty=1, box.lwd=0)

# Plotting Bottom Right Graph
# 
plot(df$DateTime, df$Global_reactive_power, type="n", xlab="datetime", ylab="Global_reactive_power")
lines(df$DateTime, df$Global_reactive_power)

# Closing the device
dev.off()

