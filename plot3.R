#########
# plot3.R script to produce plot3.png for Project 1 of Exploratory data analysis
# note: the file "household_power_consumption.txt" must 
# be in the working directory for the script to run.
#########

# load and filter data; add datetime variable
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE) 
data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data$datetime <- strptime( paste(data$Date ,data$Time), format = "%d/%m/%Y %H:%M:%S")


# prepare png graphical device
png(filename = "plot3.png")

# create graph
plot(data$datetime, data$Sub_metering_1, type = 'n', xlab="", ylab = "Energy sub metering")
lines(data$datetime, data$Sub_metering_1, type = 'l')
lines(data$datetime, data$Sub_metering_2, type = 'l', col = "red")
lines(data$datetime, data$Sub_metering_3, type = 'l',  col = "blue" )
legend("topright", lty = 1, col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# close graphical device
dev.off()