#Code for readig data
mydata = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata3 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Code for plotting data
weekday <- strptime(paste(subsetdata3$Date, subsetdata3$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subsetdata3$Global_active_power)
sm1 <- as.numeric(subsetdata3$Sub_metering_1)
sm2 <- as.numeric(subsetdata3$Sub_metering_2)
sm3 <- as.numeric(subsetdata3$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(weekday, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(weekday, sm2, type="l", col="red")
lines(weekday, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()