powerConsumption <- read.csv("E:/coursera_localrepo/household_power_consumption.csv")
pc <- powerConsumption
png("./plot3.png", width = 480, height = 480)

pc2 <- pc[pc$Date=="1/2/2007"|pc$Date=="2/2/2007",]

pc2Date <- as.Date(pc2[,1], "%d/%m/%Y")
pc2Time <- as.POSIXct(pc2[,2], format = "%H:%M:%S")

pc2Total <- paste(pc2Date, pc2[,2])
plotVar <- strptime(pc2Total, format="%Y-%m-%d %H:%M:%S")

sm1 <- as.numeric(pc2$Sub_metering_1)
sm2 <- as.numeric(pc2$Sub_metering_2)
sm3 <- as.numeric(pc2$Sub_metering_3)

plot(plotVar, sm1, type = "l", ylab = " Energy sub metering", xlab = "")
lines(plotVar, sm2, col = "red")
lines(plotVar, sm3, col = "blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c(1,2,4), lty=1, lwd = 1)

dev.off()