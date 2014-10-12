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

par(mfrow=c(2,2),mar=c(4,4,4,1))

plot(d$DateTime,d$Global_active_power,type="l",lwd=0.25,main="",
     ylab="Global Active Power",xlab="")

plot(d$DateTime,d$Voltage,type="l",lwd=0.25,main="",
     ylab="Voltage",xlab="datetime")

with(d, plot(d$DateTime,d$Sub_metering_1,type="n",
             ylab="Energy sub metering",xlab=""))
with(d, lines(d$DateTime,d$Sub_metering_1,))
with(d, lines(d$DateTime,d$Sub_metering_2,col="red"))
with(d, lines(d$DateTime,d$Sub_metering_3,col="blue"))
legend("topright",lty=1,cex=0.75,col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(d$DateTime,d$Global_reactive_power,type="l",lwd=0.25,main="",
     ylab="Global_reactive_power",xlab="datetime",ylim=c(0,0.5))

par(mfrow=c(1,1))

dev.copy(png,file="plot4.png")
dev.off()





