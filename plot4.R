#Code for readig data
mydata = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata4 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Code for plotting data
weekday <- strptime(paste(subsetdata4$Date, subsetdata4$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subsetdata4$Global_active_power)
grp <- as.numeric(subsetdata4$Global_reactive_power)
voltage <- as.numeric(subsetdata4$Voltage)
sm1 <- as.numeric(subsetdata4$Sub_metering_1)
sm2 <- as.numeric(subsetdata4$Sub_metering_2)
sm3 <- as.numeric(subsetdata4$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(weekday, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(weekday, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(weekday, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(weekday, sm2, type="l", col="red")
lines(weekday, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(weekday, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()