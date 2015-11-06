#load data - note that the data is separated by ';'
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE) 

data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]

data$datetime <- strptime( paste(data$Date ,data$Time), format = "%d/%m/%Y %H:%M:%S")

png(filename = "plot1.png")

hist(as.numeric(data$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = 'Red')

dev.off()
