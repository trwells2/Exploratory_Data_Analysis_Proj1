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

png("plot4.png", width=480, height=480)

#Create 2x2 area for graphs
par(mfcol = c(2,2))

#1st Graph - 1st col, 1st row
plot(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Global_active_power,
     type = "l", xlab = "")

#2nd Graph - 1st col, 2nd row
plot(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Sub_metering_1, 
     type = "l", xlab = "")
lines(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Sub_metering_2, type = "l", col = "red" )
lines(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#3rd Graph - 2nd col, 1st row
plot(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Voltage,
     type = "l", xlab = "datetime", ylab = "Voltage")

#4th Graph - 2nd Col, 2nd row
plot(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Global_reactive_power,
     type = "l", xlab = "datetime")


dev.off()