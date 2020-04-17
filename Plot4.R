#Plot4

data<-read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, dec=".")
subsetData<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower<- as.numeric(subsetData$Global_active_power)
datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C")
subMetering1 <- as.numeric(subsetData$Sub_metering_1)
subMetering2 <- as.numeric(subsetData$Sub_metering_2)
subMetering3 <- as.numeric(subsetData$Sub_metering_3)
GlobalReactivePower <- as.numeric(subsetData$Global_reactive_power)
Voltage <- as.numeric(subsetData$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()
