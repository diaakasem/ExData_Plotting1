# Read the csv data file
class = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
df = read.csv(file = "household_power_consumption.txt", sep=";", colClass=class, na.strings="?")

# Plotting the histogram
hist(df$Global_active_power, col='red', xlab="Global Active Power (killowatts)")
axis(2, at=marks, labels=format(marks, scientific=FALSE))
title("Global Active Power")

# Saving to PNG file
dev.copy(png, file = "plot1.png")
dev.off()
