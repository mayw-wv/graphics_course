powerConsumption <- read.csv("E:/coursera_localrepo/household_power_consumption.csv")

png("./plot1.png", width = 480, height = 480)
par(mfrow = c(1,1))
pcA <- as.numeric(pc$Global_active_power)/1000.
pc1 <- as.numeric(pc$Sub_metering_1)
pc2 <- as.numeric(pc$Sub_metering_2)



par(mfrow = c(1,1), mar=c(4,4,2,1) )
breaksVec <- c(0, .5, 1.0, 1.5, 2.0, 2.5, 3.0, 3.5, 4.0, 4.5)
hist(pcA, col = "red", xlab="Global Active Power (kilowatts)", main = "Global Active Power", breaks = breaksVec )

dev.off()