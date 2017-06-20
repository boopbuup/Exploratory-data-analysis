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

#plot 2
png("plot2.png", width=609, height=484)
plot(data$DateTime,data$Global_active_power, type="l", xlab= "", ylab="Global_active_power(kilowatts)")
dev.off()