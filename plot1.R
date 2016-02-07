# Load dataset from data file and select the data required to plot the graph
dataset_file <- "household_power_consumption.txt"
dataset <- read.table(dataset_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
plot_data <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007") ,]


# plot1 - Global Active power in KW
active_power <- as.numeric(plot_data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()