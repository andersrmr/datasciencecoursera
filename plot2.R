setwd("C:/Users/Admin/Desktop/Coursera")

d <- read.table("household_power_consumption.txt",
                sep=";",na.strings="?",colClasses="character",
                nrows=2880, skip=66637)

d <- data.frame(d$V1,d$V2,as.numeric(d$V3),as.numeric(d$V4),
                as.numeric(d$V5),as.numeric(d$V6),
                as.numeric(d$V7),as.numeric(d$V8),
                as.numeric(d$V9))

DateTime <- paste(as.character(d$d.V1),as.character(d$d.V2))
DateTime <- strptime(DateTime, "%d/%m/%Y %H:%M:%S")

d <- data.frame(DateTime,d)

names(d) <- c("DateTime","Date","Time","Global_active_power",
              "Global_reactive_power","Voltage",
              "Global_intensity","Sub_metering_1",
              "Sub_metering_2","Sub_metering_3")

plot(d$DateTime,d$Global_active_power,type="l",lwd=0.25,main="",
     ylab="Global Active Power (kilowatts)",xlab="")

dev.copy(png,file="plot2.png")
dev.off()




