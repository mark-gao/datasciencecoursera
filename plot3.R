
## Exploratory Data Analysis
## Project 1
## plot3.R
## December 6, 2014
## 

## read data
a <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
a<-(a[a$Date =="1/2/2007" | a$Date =="2/2/2007",])
a$Date <- strptime(paste(a$Date, a$Time), "%d/%m/%Y %H:%M:%S")

## plotting
par(mar=c(4.5,4.5, 4.1 ,1.5), cex.lab=0.75, cex.axis=0.75, font.lab=1) # defaul is (5.1,4.1, 4.1 ,2.1)
with(a, plot(Date,Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(a, points(Date,Sub_metering_1, type="l", col = "black"))
with(a, points(Date,Sub_metering_2, type="l", col = "red"))
with(a, points(Date,Sub_metering_3, type="l", col = "blue"))
legend("topright", legend=c("Sub_metering_1     ","Sub_metering_2      ","Sub_metering_3      "), lty=1, col=c("black","red", "blue"), cex = 0.8)

# the code that creates the PNG file
dev.copy(png, file = "plot3.png",width = 480, height = 480, units = "px")
dev.off()
