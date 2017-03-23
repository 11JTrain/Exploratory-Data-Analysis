
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

png("Plot1.png", width = 480, height = 480)
hist(GAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
