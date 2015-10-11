# Read the csv data file
class = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv(file = "household_power_consumption.txt", sep=";", colClass=class, na.strings="?")
df$DateTime <- as.Date(paste(df$Date, " ", df$Time), "%d/%m/%Y %H:%M")
subsetDates <- as.Date(c("2007/02/01", "2007/02/02"), "%Y/%m/%d")
df <- subset(df, Date %in% subsetDates)

# Opening  png device
png("plot2.png", width=400, height=400)

# Plotting the data
plot(df$DateTime, data$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")


# Closing the device
dev.off()

