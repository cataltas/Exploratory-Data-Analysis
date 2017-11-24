#Reading the table
data <- read.table("./household_power_consumption.txt",sep = ";",header=TRUE)
#Changing the dates to a date format
data$Date <- strptime(data$Date,format="%d/%m/%Y")
#Subsetting the data set to keep the correct days
new_set<-subset(data,Date=="2007-02-01"|Date =="2007-02-02")
#Creating the png file
png(file="plot1.png",width=480, height=480)
#Creating the histogram and writting it to the png file.
hist(as.numeric(as.character(new_set$Global_active_power)), main = "Global Active Power",col="red", xlab="Global Active Power (kilowatts)")
dev.off()
