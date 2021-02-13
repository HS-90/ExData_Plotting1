electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".")

electric07 <- subset(electric, Date %in% c("1/2/2007", "2/2/2007"))

electric07$fulldate <- strptime(paste(electric07$Date, electric07$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

electric07$Date <- as.Date(electric07$Date, format = "%d/%m/%Y")

electric07$Time <- format(electric07$Time, format = "%H:%M:%S")

#2x2 layout for graphs
par(mfrow = c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#graph 1 top left
with(electric07, plot(fulldate, Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power"))

#graph 2 top right
with(electric07, plot(fulldate, Voltage, type = "l", xlab = "datetime", ylab = "Voltage"))

#graph 3 bottom left

with(electric07, plot(fulldate, Sub_metering_1, type = "l", xlab = " ", ylab = "Energy sub metering"))
lines(electric07$fulldate, electric07$Sub_metering_2, col= "red" )
lines(electric07$fulldate, electric07$Sub_metering_3, col= "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), col = c("black", "red", "blue"), lwd = 1, bty = 'n')
  
#graph 4 bottom right
with(electric07, plot(fulldate, Global_reactive_power, type = "l", xlab = "datetime", ylab = "global_reactive_power" ))

#Save file
dev.copy(png, file = "plot4.png", height=480, width = 480)

dev.off()