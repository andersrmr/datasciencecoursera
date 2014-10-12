setwd("C:/Users/Admin/Desktop/Coursera")

d <- read.table("household_power_consumption.txt",
                sep=";",na.strings="?",colClasses="character",
                nrows=2880, skip=66637)

d <- data.frame(d$V1,d$V2,as.numeric(d$V3),as.numeric(d$V4),
                as.numeric(d$V5),as.numeric(d$V6),
                as.numeric(d$V7),as.numeric(d$V8),
                as.numeric(d$V9))

names(d) <- c("Date","Time","Global_active_power",
              "Global_reactive_power","Voltage",
              "Global_intensity","Sub_metering_1",
              "Sub_metering_2","Sub_metering_3")

hist(d$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

dev.copy(png,file="plot1.png")
dev.off()
