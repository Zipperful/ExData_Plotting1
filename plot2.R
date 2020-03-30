strt<-66637
end<-69516
unzip("./exdata_data_household_power_consumption.zip")
elecdata<-read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?", col.names = c("Date", "Time", "ActivePwr", "ReactivePwr", "Voltage", "Intensity", "SubMeter1", "SubMeter2", "SubMeter3"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = strt-1, nrows = 2880)
elecdata<-cbind(elecdata,as.POSIXlt(paste(elecdata$Date, elecdata$Time, sep=";"), format="%d/%m/%Y;%H:%M:%S"))
names(elecdata)[10]<-"TimeStamp"

par(mfrow=c(1,1))

plot(elecdata$TimeStamp, elecdata$ActivePwr, type="l", ylab="Global Active Power (kilowatts)", xlab="")

dev.copy(png, "plot2.png");dev.off()