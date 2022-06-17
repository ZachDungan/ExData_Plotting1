# Plot 1

setwd("~/R/ExData_Plotting1")

#Load data
dat <- read.csv("household_power_consumption.txt", header=TRUE, sep=';', na.strings="?", 
          nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
# Subset
dat <- subset(dat, Date == "1/2/2007" | Date == "2/2/2007")

png(filename = "plot1.png", width = 480, height = 480)

hist(dat$Global_active_power, 
     col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power",
     ylim = c(0,1200))

dev.off()
