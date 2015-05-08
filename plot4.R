## household_power_consumption.txt file needs to be saved in the working directory

library(lubridate)
library(dplyr)

#this builds the dataframe that will be used during the loop
inside <- read.csv("household_power_consumption.txt",header=TRUE,nrows = 1,sep=";", stringsAsFactors=FALSE)
inside <- inside[-1,]
date1 <- as.Date('2007-02-01')
date2 <- as.Date('2007-02-03')
max <- 2075260
num <- 0
i <- 0

#here I read the file in batches and filter for the dates we want
while (i <= max){
  temp <- read.csv("household_power_consumption.txt",skip=num, nrows=200000, sep = ";", stringsAsFactors=FALSE)
  temp[,1] <- parse_date_time(temp[,1], "dmy")
  temp[,1] <- as.Date(temp[,1])
  inside <- rbind(inside,subset(temp,temp[,1] >= date1 & temp[,1] < date2))
  num <- num + 200000
  i <- num
} ## end of loop

rm(temp) #get rid of remaining temp items

x <- paste(inside$Date,inside$Time) #put date and time together
inside <- mutate(inside,datetime = x) ##add col to table
inside$datetime <- strptime(inside$datetime, format="%Y-%m-%d %H:%M:%S")

data <- inside$Global_reactive_power
label <- colnames(inside[4])
label2 <- colnames(inside[5])
sub1 <- inside$Sub_metering_1 ##black line
sub2 <- inside$Sub_metering_2 ##red line
sub3 <- inside$Sub_metering_3 ##blue line
dates <- inside$datetime

png("plot4.png",width=480, height=480, units = "px")
par(mfrow=c(2,2)) #lays out a grid for the charts, 2 rows and 2 columns
#upper left chart
plot(dates,inside$Global_active_power,type="l",ylab = "Global Active Power", xlab="",bg="white")
#upper right chart
plot(dates,inside$Voltage,type="l",ylab = label2, xlab="datetime",bg="white")
#bottom left chart
plot(dates,sub1,type="l",ylab = "Energy sub metering", xlab="",bg="white")
lines(dates,sub2,type="l",col="red",bg="white")
lines(dates,sub3,type="l",col="blue",bg="white")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),
col=c("black","red","blue"),bg="white")
#bottom right chart
plot(dates,data,type="l",ylab = label, xlab="datetime",bg="white")
dev.off()
rm(list = ls()) #clear workspace
