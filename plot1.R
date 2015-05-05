x11()
hist(inside$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.print(png,filename = "plot1.png", width = 480, height = 480, units = "px",bg="white")
dev.off()
