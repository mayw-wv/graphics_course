powerConsumption <- read.csv("E:/coursera_localrepo/household_power_consumption.csv")
pc <- powerConsumption
png("./plot2.png", width = 480, height = 480)

pc2 <- pc[pc$Date=="1/2/2007"|pc$Date=="2/2/2007",]

pc2Date <- as.Date(pc2[,1], "%d/%m/%Y")
pc2Time <- as.POSIXct(pc2[,2], format = "%H:%M:%S")

pc2Total <- paste(pc2Date, pc2[,2])
plotVar <- strptime(pc2Total, format="%Y-%m-%d %H:%M:%S")

gap <- as.numeric(pc2$Global_active_power)/500.0


plot(plotVar, gap, type = "l", ylab = "Global active power", xlab = "")
dev.off()