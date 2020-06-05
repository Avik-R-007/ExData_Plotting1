#Reading the full data set and change the date format
data <- read.table("household_power_consumption.txt", header = TRUE,
                   sep = ";", stringsAsFactors = FALSE)
date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subsetting data
subData <- data[data$Date %in% c("1/2/2007","2/2/2207"), ]
rm(data)

#converting dates
dateTime <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(dateTime)

#Open the png file
png(filename = "plot4.png", width = 480, height = 480)

#Plotting use plot function
par(mfrow = c(2,2), mar = c(4, 4, 2, 1), oma = c(0,0,2,0))
with(subData, {plot(Global_active_power~Datetime, type = "l",
     xlab = "", ylab = "Global Active Power")
     plot(Voltage ~ Datetime, type = "l", xlab = "datetime", ylab = "Voltage")
     plot(Sub_metering_1 ~ Datetime, type = "l",ylab="Energy sub metering", xlab="")
     lines(Sub_metering_2 ~ Datetime, type = "l", col = "red")
     lines(Sub_metering_3 ~ Datetime, type = "l", col = "blue")
     legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
       legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
     plot(Global_reactive_power ~ Datetime, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")})
dev.off()