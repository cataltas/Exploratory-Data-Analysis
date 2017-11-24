#Reading the table
data <- read.table("./household_power_consumption.txt",sep = ";",header=TRUE)
#Changing the dates to a date format
data$Date <- strptime(data$Date,format="%d/%m/%Y")
#Subsetting the data set to keep the correct days
new_set<-subset(data,Date=="2007-02-01"|Date =="2007-02-02")
#Merging the data and time variables
new_set$Date<-paste(as.Date(new_set$Date),new_set$Time)
#Changing the merged variables to a datetime format
new_set$Date<-strptime(new_set$Date,format="%Y-%m-%d %H:%M:%S")
#Rewritting the sub metering columns as numeric type of variables
new_set$Sub_metering_1<-as.numeric(as.character((new_set$Sub_metering_1)))
new_set$Sub_metering_2<-as.numeric(as.character((new_set$Sub_metering_2)))
new_set$Sub_metering_3<-as.numeric(as.character((new_set$Sub_metering_3)))
#Creating the png file
png(file="plot3.png",width=480, height=480)
#Creating the plot with the sub metering 1 data 
with(new_set,plot(Date,new_set$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
#Adding the sub metering 2 data
with(new_set,points(Date,new_set$Sub_metering_2,col="red", type = "l"))
#Adding the sub metering 3 data
with(new_set,points(Date,new_set$Sub_metering_3,col="blue", type = "l"))
#Adding the legend 
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()