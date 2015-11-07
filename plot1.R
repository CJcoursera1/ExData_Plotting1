#########
# plot1.R script to produce plot1.png for Project 1 of Exploratory data analysis
# note: the file "household_power_consumption.txt" must 
# be in the working directory for the script to run.
#########


# load and filter data; add datetime variable
data <- read.csv2("household_power_consumption.txt", stringsAsFactors = FALSE) 
data <- data[ data$Date == "1/2/2007" | data$Date == "2/2/2007", ]
data$datetime <- strptime( paste(data$Date ,data$Time), format = "%d/%m/%Y %H:%M:%S")

# prepare png graphical device
png(filename = "plot1.png")

# create graph
hist(as.numeric(data$Global_active_power), 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power", 
     col = 'Red')

# close graphical device
dev.off()
