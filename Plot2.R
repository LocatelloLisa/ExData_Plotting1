data<-read.csv("household_power_consumption.txt", sep = ";", dec=".")

subsetData<- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower<- as.numeric(subsetData$Global_active_power)

datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sys.setlocale("LC_TIME", "C") #to set the output in English instead of local language

png("plot2.png", width=480, height=480)
with(subsetData, plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
