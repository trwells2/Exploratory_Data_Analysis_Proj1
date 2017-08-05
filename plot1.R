hpc<-read.table("./household_power_consumption.txt",skip=1,sep=";",
                na.strings="?", stringsAsFactors = FALSE)

names(hpc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

shpc<-subset(hpc,hpc$Date=="1/2/2007"| hpc$Date=="2/2/2007")

png("plot1.png", width=480, height=480)

hist(as.numeric(shpc$Global_active_power),col="Red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")

dev.off()
