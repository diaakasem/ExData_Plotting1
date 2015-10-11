# Read the csv data file
class = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv(file = "household_power_consumption.txt", sep=";", colClass=class, na.strings="?")
df$Date <- as.Date(df$Date, "%d/%m/%Y")
subsetDates <- as.Date(c("2007/02/01", "2007/02/02"), "%Y/%m/%d")
df <- subset(df, Date %in% subsetDates)

# Plotting the histogram
yrange <- range(df$Global_active_power[!is.na(df$Global_active_power)])
ticks <- pretty(yrange)
labels <- format(ticks, big.mark=",", scientific=FALSE)
hist(df$Global_active_power, col='red', xlab="Global Active Power (killowatts)", main="Global Active Power")


# Saving to PNG file
dev.copy(png, file = "plot1.png")
dev.off()
