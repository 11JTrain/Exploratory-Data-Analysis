
library(data.table)

# Set working directory
setwd("/Users/jessechung/Documents/DataScience/Data")

# Download dataset
filename <- "Power_Consumption.zip"

if (!file.exists(filename)) {
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, filename, method = "curl")
  unzip(filename)
}

data <- data.table(read.table("household_power_consumption.txt", header = T, sep = ";", stringsAsFactors = F, dec = "."))
data_s <- data[Date %in% c("1/2/2007", "2/2/2007")]

GAP <- as.numeric(data_s$Global_active_power)

datetime <- strptime(paste(data_s$Date, data_s$Time, sep = ""), "%d/%m/%Y %H:%M:%S")

subMetering1 <- as.numeric(data_s$Sub_metering_1)
subMetering2 <- as.numeric(data_s$Sub_metering_2)
subMetering3 <- as.numeric(data_s$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()