#load data - note that the data is separated by ';'
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE) 

data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$datetime <- strptime( paste(data$Date ,data$Time), format = "%d/%m/%Y %H:%M:%S")



png(filename = "plot2.png")
plot(data$datetime, data$Global_active_power, type = 'n', xlab="", ylab = "Global Active Power (kilowatts)")
lines(data$datetime, data$Global_active_power, type = 'l')

dev.off()