datafile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
subsetData <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subsetMetering1 <- as.numeric(subsetData$Sub_metering_1)
subsetMetering2 <- as.numeric(subsetData$Sub_metering_2)
subsetMetering3 <- as.numeric(subsetData$Sub_metering_3)
png("plot3.png", width=480, height=480)
plot(datetime,subsetMetering1, type="l",ylab="Energy Submetering", xlab="")
lines(datetime, subsetMetering2, type="l", col="red")
lines(datetime, subsetMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

