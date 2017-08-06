hpc<-read.table("./household_power_consumption.txt",skip=1,sep=";",
                na.strings="?", stringsAsFactors = FALSE)

names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

shpc<-subset(hpc,hpc$Date=="1/2/2007"| hpc$Date=="2/2/2007")

shpc$Global_active_power <- as.numeric(as.character(shpc$Global_active_power))
shpc$Sub_metering_1 <- as.numeric(as.character(shpc$Sub_metering_1))
shpc$Sub_metering_2 <- as.numeric(as.character(shpc$Sub_metering_2))
shpc$Sub_metering_3 <- as.numeric(as.character(shpc$Sub_metering_3))

shpc$TimeStamp<-paste(shpc$Date, shpc$Time)

png("plot3.png", width=480, height=480)

plot(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Sub_metering_1, 
     type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

lines(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Sub_metering_2, type = "l", col = "red" )

#Adds line graph for date/time v Sub metering 3 data in blue
lines(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Sub_metering_3, type = "l", col = "blue" )

#Adds legend to graph
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()