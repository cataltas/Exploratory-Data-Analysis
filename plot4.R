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
png(file="plot4.png",width=480, height=480)
#Setting the number of plots per row wanted
par(mfrow=c(2,2))
#Writting the first plot
with(new_set,plot(Date,as.numeric(as.character(Global_active_power)),type="l",xlab="",ylab="Global Active Power"))
#Writting the second plot
with(new_set,plot(Date,as.numeric(as.character(Voltage)),type="l",xlab="datetime",ylab="Voltage"))
#Writting the third plot
with(new_set,plot(Date,new_set$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(new_set,points(Date,new_set$Sub_metering_2,col="red", type = "l"))
with(new_set,points(Date,new_set$Sub_metering_3,col="blue", type = "l"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")
#Writting the fourth plot
with(new_set,plot(Date,as.numeric(as.character(Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()