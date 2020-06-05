data <- read.table("household_power_consumption.txt", header = TRUE, 
                   sep = ";", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

## Subsetting the data
subData <- subset(data, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)

## Converting dates
datetime <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(datetime)


png(filename = "plot2.png", width = 480, height = 480)
plot(subData$Global_active_power ~ subData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()