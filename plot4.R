# Load dataset from data file and select the data required to plot the graph
dataset_file <- "household_power_consumption.txt"
dataset <- read.table(dataset_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot_data <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]


date_time <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active_power <- as.numeric(plot_data$Global_active_power)
reactive_power <- as.numeric(plot_data$Global_reactive_power)
voltage <- as.numeric(plot_data$Voltage)
sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)
sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(date_time, active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(date_time, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(date_time, reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()