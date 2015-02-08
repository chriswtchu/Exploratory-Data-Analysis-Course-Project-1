#Code for readig data
mydata = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata2 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Code for plotting data
weekday <- strptime(paste(subsetdata2$Date, subsetdata2$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
gap <- as.numeric(subsetdata2$Global_active_power)

png("plot2.png", width=480, height=480)

plot(weekday, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()