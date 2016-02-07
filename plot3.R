# Load dataset from data file and select the data required to plot the graph
dataset_file <- "household_power_consumption.txt"
dataset <- read.table(dataset_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot_data <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]


date_time <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active_power <- as.numeric(plot_data$Global_active_power)
sub_metering_1 <- as.numeric(plot_data$Sub_metering_1)
sub_metering_2 <- as.numeric(plot_data$Sub_metering_2)
sub_metering_3 <- as.numeric(plot_data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date_time, sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(date_time, sub_metering_2, type="l", col="red")
lines(date_time, sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()