# Plot 4
setwd("~/R/ExData_Plotting1")

#Load data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
# Subset
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(dat$Date), dat$Time)
dat$Date_time <- as.POSIXct(date_time)

png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(dat, {
  #Top left (from plot 2)
  plot(Global_active_power~Date_time, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  #Top right
  plot(Voltage~Date_time, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  #Bottom left (from plot 3)
  plot(Sub_metering_1~Date_time, type = "l", 
       ylab = "Global Active Power (kilowatts)", xlab = "")
  
  lines(Sub_metering_2~Date_time, col = "Red")
  lines(Sub_metering_3~Date_time, col = "Blue")
  
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1, 
         legend = c("Sub Metering 1", "Sub Metering 2", "Sub Metering 3"))
  #Bottom right
  plot(Global_reactive_power~Date_time, type = "l", 
       ylab = "Global Reactive Power (kilowatts", xlab = "")
})

dev.off()