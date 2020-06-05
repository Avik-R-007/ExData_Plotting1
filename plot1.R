data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
subData <- data[data$Date %in% c("1/2/2007", "2/2/2207"), ]
x <- as.numeric(subData$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(x, xlab = "Global Active Power (killowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")
dev.off()
