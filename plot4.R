
# read in data - store in a short name variable
powerConsumption <- read.csv("E:/coursera_localrepo/household_power_consumption.csv")
pc <- powerConsumption

# set graphics file device
png("./plot4.png", width = 480, height = 480)

# filter the data for the two day span of interest, paste the first two columns
# together to develop a time variable for the x axis of the plot "plotVar"
pc2 <- pc[pc$Date=="1/2/2007"|pc$Date=="2/2/2007",]
pc2Date <- as.Date(pc2[,1], "%d/%m/%Y")
pc2Time <- as.POSIXct(pc2[,2], format = "%H:%M:%S")
pc2Total <- paste(pc2Date, pc2[,2])
plotVar <- strptime(pc2Total, format="%Y-%m-%d %H:%M:%S")

par(mfrow=c(2,2))

# plot 1
gap <- as.numeric(pc2$Global_active_power)/500.0
plot(plotVar, gap, type = "l", ylab = "Global active power", xlab = "")


# plot 2
volt <- as.numeric(pc2$Voltage)
plot(plotVar, volt, type="l", ylab = "Voltage", xlab = "datetime")

# plot 3 
sm1 <- as.numeric(pc2$Sub_metering_1)
sm2 <- as.numeric(pc2$Sub_metering_2)
sm3 <- as.numeric(pc2$Sub_metering_3)
plot(plotVar, sm1, type = "l", ylab = " Energy sub metering", xlab = "")
lines(plotVar, sm2, col = "red")
lines(plotVar, sm3, col = "blue")
legend( "topright",  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1,2,4), cex = .5,  lty=1, lwd = 1)


# plot 4
reactive <- as.numeric(pc2$Global_reactive_power)
plot(plotVar, reactive, type="l", ylab = "Global_reactive_power", xlab = "datetime")


dev.off()