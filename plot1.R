## household_power_consumption.txt file needs to be saved in the working directory

library(lubridate) # for the as.Date functions
library(dplyr) #added so we can use mutate to include new column

#this builds the dataframe that will be used during the loop
inside <- read.csv("household_power_consumption.txt",header=TRUE,nrows = 1,sep=";", stringsAsFactors=FALSE)
inside <- inside[-1,]
date1 <- as.Date('2007-02-01')
date2 <- as.Date('2007-02-03')
max <- 2075260
num <- 0
i <- 0

#here I read the file in batches and filter for the dates we want
while (i <= max){a
  temp <- read.csv("household_power_consumption.txt",skip=num, nrows=200000, sep = ";", stringsAsFactors=FALSE)
  temp[,1] <- parse_date_time(temp[,1], "dmy")
  temp[,1] <- as.Date(temp[,1])
  inside <- rbind(inside,subset(temp,temp[,1] >= date1 & temp[,1] < date2))
  num <- num + 200000
  i <- num
} ## end of loop

rm(temp) #get rid of remaining temp items

inside$Global_active_power <- as.numeric(inside$Global_active_power) #change to numeric for plotting
x <- paste(inside$Date,inside$Time) #put date and time together
inside <- mutate(inside,datetime = x) ##add col to table
#inside$datetime <- x
inside$datetime <- strptime(inside$datetime, format="%Y-%m-%d %H:%M:%S")

png("plot1.png",width=480, height=480, units = "px")
hist(inside$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()
rm(list = ls()) #clear workspace