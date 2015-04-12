datafile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
subsetData <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
subsetMetering1 <- as.numeric(subsetData$Sub_metering_1)
subsetMetering2 <- as.numeric(subsetData$Sub_metering_2)
subsetMetering3 <- as.numeric(subsetData$Sub_metering_3)

