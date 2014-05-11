data<-read.table("F:/mala/coursera/assigm/household_power_consumption.txt",sep=";",header=T)

nrow(data)
names(data)
head(data)


data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_filter<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
data_filter$Global_active_power<-as.numeric(type.convert(as.character(data_filter$Global_active_power), dec = "."))



data_filter$DateTime <- paste(data_filter$Date, data_filter$Time)
data_filter$DT<-strptime(data_filter$DateTime,"%Y-%m-%d %H:%M:%S")

plot(data_filter$DT,data_filter$Global_active_power,type = "l",xlab=" ",ylab="Global Active Power(Kilowatts)") 
dev.copy(png, file = "F:/mala/coursera/Plot2.png") 
dev.off()

