strt<-66637
end<-69516
unzip("./exdata_data_household_power_consumption.zip")
elecdata<-read.csv("./household_power_consumption.txt", sep = ";", na.strings = "?", col.names = c("Date", "Time", "ActivePwr", "ReactivePwr", "Voltage", "Intensity", "SubMeter1", "SubMeter2", "SubMeter3"), colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), skip = strt-1, nrows = 2880)
elecdata<-cbind(elecdata,as.POSIXlt(paste(elecdata$Date, elecdata$Time, sep=";"), format="%d/%m/%Y;%H:%M:%S"))
names(elecdata)[10]<-"TimeStamp"

par(mfrow=c(1,1))

plot(elecdata$TimeStamp, elecdata$SubMeter1, type="l", ylab="Energy sub metering", xlab="")
par(new=T)
plot(elecdata$TimeStamp, elecdata$SubMeter2, col="red", type="l", ylab="Energy sub metering", xlab="", ylim=c(0,max(elecdata$SubMeter1)))
par(new=T)
plot(elecdata$TimeStamp, elecdata$SubMeter3, col="blue", type="l", ylab="Energy sub metering", xlab="", ylim=c(0,max(elecdata$SubMeter1)))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=c(1,1,1), lwd=c(1,1,1))

dev.copy(png, "plot3.png");dev.off()