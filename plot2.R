# Load dataset from data file and select the data required to plot the graph
dataset_file <- "household_power_consumption.txt"
dataset <- read.table(dataset_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot_data <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]

## plot2 
date_time <- strptime(paste(plot_data$Date, plot_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
active_power <- as.numeric(plot_data$Global_active_power)
png("plot2.png", width=480, height=480)
plot(date_time, active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()