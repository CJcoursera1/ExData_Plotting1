data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE) 

data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$datetime <- strptime( paste(data$Date ,data$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png")

par(mfcol = c(2,2), mar = c(4,4,4,1))

plot(data$datetime, data$Global_active_power, type = 'n', xlab="", ylab = "Global Active Power (kilowatts)")
lines(data$datetime, data$Global_active_power, type = 'l')

plot(data$datetime, data$Sub_metering_1, type = 'n', xlab="", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1, type = 'l')
lines(data$datetime, data$Sub_metering_2, type = 'l', col = "red")
lines(data$datetime, data$Sub_metering_3, type = 'l',  col = "blue" )

plot(data$datetime, data$Voltage, type = 'n', xlab="datetime", ylab = "Voltage")
lines(data$datetime, data$Voltage, type = 'l')

plot(data$datetime, data$Global_reactive_power, type = 'n', xlab="datetime", ylab = "Global_reactive_power")
lines(data$datetime, data$Global_reactive_power, type = 'l')

dev.off()