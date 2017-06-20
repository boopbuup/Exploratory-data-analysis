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

#plot3:
png("plot3.png", width=609, height=484)
plot(data$DateTime,data$Sub_metering_1, type="l", xlab= "", ylab="Energy Sub Metering")
lines(data$DateTime,data$Sub_metering_2,col="Red")
lines(data$DateTime,data$Sub_metering_3 ,  col = 'Blue')
legend("topright", lty=1, lwd =3, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
