hpc<-read.table("./household_power_consumption.txt",skip=1,sep=";",
                na.strings="?", stringsAsFactors = FALSE)

names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

shpc<-subset(hpc,hpc$Date=="1/2/2007"| hpc$Date=="2/2/2007")

shpc$Global_active_power <- as.numeric(as.character(shpc$Global_active_power))

shpc$TimeStamp<-paste(shpc$Date, shpc$Time)

png("plot2.png", width=480, height=480)

plot(strptime(shpc$TimeStamp, "%d/%m/%Y %H:%M:%S"), shpc$Global_active_power,
     type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")

dev.off()