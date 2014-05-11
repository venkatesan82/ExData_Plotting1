data<-read.table("F:/mala/coursera/assigm/household_power_consumption.txt",sep=";",header=T)

nrow(data)
names(data)
head(data)


data$Date<-as.Date(data$Date,"%d/%m/%Y")
data_filter<-subset(data,Date=="2007-02-01"|Date=="2007-02-02")
data_filter$Global_active_power<-as.numeric(type.convert(as.character(data_filter$Global_active_power), dec = "."))


hist(data_filter$Global_active_power,xlab="Global Active Power(Kilowatts)",main="Global Active Power",col="red")
dev.copy(png, file = "F:/mala/coursera/Plot1.png") 
dev.off()

