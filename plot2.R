#Reading the data
data <- read.table("./household_power_consumption.txt",sep = ";",header=TRUE)
#Changing the dates to a date format
data$Date <- strptime(data$Date,format="%d/%m/%Y")
#Subsetting the data set to keep the correct days
new_set<-subset(data,Date=="2007-02-01"|Date =="2007-02-02")
#Merging the data and time variables
new_set$Date<-paste(as.Date(new_set$Date),new_set$Time)
#Changing the merged variables to a datetime format
new_set$Date<-strptime(new_set$Date,format="%Y-%m-%d %H:%M:%S")
#Creating the png file
png(file="plot2.png",width=480, height=480)
#Creating the plot and writting it to the png file.
with(new_set,plot(Date,as.numeric(as.character(Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()