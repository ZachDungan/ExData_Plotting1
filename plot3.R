# Plot 3
setwd("~/R/ExData_Plotting1")

#Load data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
# Subset
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(dat$Date), dat$Time)
dat$Date_time <- as.POSIXct(date_time)

png(filename = "plot3.png", width = 480, height = 480)

with(dat, {
  plot(Sub_metering_1~Date_time, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  
  lines(Sub_metering_2~Date_time, col = "Red")
  lines(Sub_metering_3~Date_time, col = "Blue")
  
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
         legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
})

dev.off()