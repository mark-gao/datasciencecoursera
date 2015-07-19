
## Exploratory Data Analysis
## Project 1
## plot1.R
## December 6, 2014
## 

## read data
a <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
a<-(a[a$Date =="1/2/2007" | a$Date =="2/2/2007",])
a$Date <- strptime(paste(a$Date, a$Time), "%d/%m/%Y %H:%M:%S")

## plot 
par(mar=c(4.5,4.5, 4.1 ,2.1), cex.lab=0.7, cex.axis=0.75, cex.main = 0.8,font.main=2, font.lab=2) # defaul is (5.1,4.1, 4.1 ,2.1)
hist(a$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# the code that creates the PNG file
dev.copy(png, file = "plot1.png",width = 480, height = 480, units = "px")
dev.off()
