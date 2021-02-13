electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = "." )

electric07 <- subset(electric, electric$Date %in% c("1/2/2007","2/2/2007"))

electric07$fulldate <- strptime(paste(electric07$Date, electric07$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

electric07$Date <- as.Date(electric07$Date, format = "%d/%m/%Y")

electric07$Time <- format(electric07$Time, format = "%H:%M:%S")





with(electric07, plot(fulldate, Global_active_power,type= "l", xlab = " ", ylab = "Global Active Power(kilowatts)"))

#Save file
dev.copy(png, file = "plot2.png", height=480, width = 480)

dev.off()