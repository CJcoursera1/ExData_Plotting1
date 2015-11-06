data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE) 

data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$datetime <- strptime( paste(data$Date ,data$Time), format = "%d/%m/%Y %H:%M:%S")



png(filename = "plot3.png")

plot(data$datetime, data$Sub_metering_1, type = 'n', xlab="", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1, type = 'l')
lines(data$datetime, data$Sub_metering_2, type = 'l', col = "red")
lines(data$datetime, data$Sub_metering_3, type = 'l',  col = "blue" )
legend("topright", lty = 1, col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()