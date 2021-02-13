#reading initial data
electric <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = "." )

#subsetting for the two days in Feb 2007
electric07 <- subset(electric, electric$Date %in% c("1/2/2007","2/2/2007"))

with(electric07, hist(as.numeric(Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatt)", ylim= c(0,1000)))

#Save file
dev.copy(png, file = "plot1.png", height=480, width = 480)

dev.off()