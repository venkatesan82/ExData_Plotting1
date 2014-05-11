data<-read.table("F:/mala/coursera/assigm/household_power_consumption.txt",sep=";",header=T)

nrow(data)
names(data)
head(data)


data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_filter<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
data_filter$Global_active_power<-as.numeric(type.convert(as.character(data_filter$Global_active_power), dec = "."))



data_filter$DateTime <- paste(data_filter$Date, data_filter$Time)
data_filter$DT<-strptime(data_filter$DateTime,"%Y-%m-%d %H:%M:%S")
data_filter$Sub_metering_1<-as.numeric(type.convert(as.character(data_filter$Sub_metering_1), dec = "."))
data_filter$Sub_metering_2<-as.numeric(type.convert(as.character(data_filter$Sub_metering_2), dec = "."))


plot(data_filter$DT,(data_filter$Sub_metering_1),type = "n",xlab="",ylab="Energy sub metering")
lines(data_filter$DT,data_filter$Sub_metering_1,type = "l", col = "black")
lines(data_filter$DT,data_filter$Sub_metering_2,type = "l", col = "red")
lines(data_filter$DT,data_filter$Sub_metering_3,type = "l", col = "blue")
legend("topright",lwd=1, col = c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file = "F:/mala/coursera/Plot3.png") 
dev.off()



