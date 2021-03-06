datafile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
subsetData <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
subsetMetering1 <- as.numeric(subsetData$Sub_metering_1)
subsetMetering2 <- as.numeric(subsetData$Sub_metering_2)
subsetMetering3 <- as.numeric(subsetData$Sub_metering_3)
voltage <- as.numeric(subsetData$Voltage)
globalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subsetMetering1, type="l", ylab="Energy Submetering", xlab="")


lines(datetime, subsetMetering2, type="l", col="red")
lines(datetime, subsetMetering3, type="l", col="blue")


plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
