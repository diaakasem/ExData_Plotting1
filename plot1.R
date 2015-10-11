# Read the csv data file
class = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv(file = "household_power_consumption.txt", sep=";", colClass=class, na.strings="?")
dateFormat <- "%d/%m/%Y"
df$Date <- as.Date(df$Date, dateFormat)
subsetDates <- as.Date(c("01/02/2007", "02/02/2007"), dateFormat)
df <- subset(df, Date %in% subsetDates)

# Plotting the histogram
hist(df$Global_active_power, col='red', xlab="Global Active Power (killowatts)", main="Global Active Power")


# Saving to PNG file
dev.copy(png, file = "plot1.png")
dev.off()
