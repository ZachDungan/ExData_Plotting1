# Plot 2
setwd("~/R/ExData_Plotting1")

#Load data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
                nrows=2075259, check.names=FALSE, stringsAsFactors=FALSE, comment.char="", quote='\"')
# Subset
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

dat$Date <- as.Date(dat$Date, format = "%d/%m/%Y")
date_time <- paste(as.Date(dat$Date), dat$Time)
dat$Date_time <- as.POSIXct(date_time)

png(filename = "plot2.png", width = 480, height = 480)

plot(dat$Global_active_power~dat$Date_time, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()