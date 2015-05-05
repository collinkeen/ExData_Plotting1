library(lubridate)

inside <- read.csv("household_power_consumption.txt",header=TRUE,nrows = 1,sep=";", stringsAsFactors=FALSE)
inside <- inside[-1,]
date1 <- as.Date('2007-02-01')
date2 <- as.Date('2007-02-03')
max <- 2075260
num <- 0
i <- 0

while (i <= max){
##need to loop here over the data
temp <- read.csv("household_power_consumption.txt",skip=num, nrows=200000, sep = ";", stringsAsFactors=FALSE)
temp[,1] <- parse_date_time(temp[,1], "dmy")
temp[,1] <- as.Date(temp[,1])
##need to add to df here 
inside <- rbind(inside,subset(temp,temp[,1] >= date1 & temp[,1] < date2))
num <- num + 200000
i <- num
## end of loop
}