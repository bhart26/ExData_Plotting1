datafile <- read.table("household_power_consumption.txt", header = TRUE, sep=";", stringsAsFactors=FALSE,dec=".")
subsetData <- datafile[datafile$Date %in% c("1/2/2007","2/2/2007"),]
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime,globalActivePower,type="l",xlab="",ylab="Global Active Power (kilowatts)")
