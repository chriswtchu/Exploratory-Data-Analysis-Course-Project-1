#Code for readig data
mydata = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata1 <- mydata[mydata$Date %in% c("1/2/2007","2/2/2007") ,]

#Code for plotting data
gap <- as.numeric(subsetdata1$Global_active_power)

png("plot1.png", width=480, height=480)

hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()