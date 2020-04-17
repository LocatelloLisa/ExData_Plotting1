data<-read.csv("household_power_consumption.txt", stringsAsFactors=FALSE,header=TRUE,sep = ";", dec=".")

subsetData<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower<- as.numeric(subsetData$Global_active_power)

png("plot1.png", width=480, height=480)
hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

