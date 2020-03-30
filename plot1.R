strt<-66637
end<-69516
unzip("./exdata_data_household_power_consumption.zip")
elecdata<-read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?", col.names = c("Date", "Time", "ActivePwr", "ReactivePwr", "Voltage", "Intensity", "SubMeter1", "SubMeter2", "SubMeter3"), colClasses = c("Date", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = strt-1, nrows = 2880)

par(mfrow=c(1,1))

hist(elecdata$ActivePwr, breaks = 12, col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency", main= "Global Active Power")

dev.copy(png, "plot1.png");dev.off()