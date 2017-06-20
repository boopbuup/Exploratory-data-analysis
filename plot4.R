#load data
setwd("C:/Users/Tu/Desktop/R/data")

csv<- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
               nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data <- subset(csv, Date %in% c("1/2/2007","2/2/2007"))

head(data,2)

# reformat date and concat date, time
data$Date<-as.Date(data$Date,"%d/%m/%Y")
data$W_day<-weekdays(data$Date)
data<-cbind(data, "DateTime" = as.POSIXct(paste(data$Date, data$Time)))

#plot4
png("plot4.png", width=609, height=484)
par(mfrow=c(2,2))
plot(data$DateTime,data$Global_active_power, type="l", xlab= "", ylab="Global_active_power(kilowatts)")
plot(data$DateTime,data$Voltage, type="l", xlab= "datetime", ylab="Voltage")
plot(data$DateTime,data$Sub_metering_1, type="l", xlab= "", ylab="Energy Sub Metering")
lines(data$DateTime,data$Sub_metering_2,col="Red")
lines(data$DateTime,data$Sub_metering_3 ,  col = 'Blue')
plot(data$DateTime,data$Global_reactive_power, type="l", xlab= "datetime", ylab="Global_reactive_power(kilowatts)")
dev.off()