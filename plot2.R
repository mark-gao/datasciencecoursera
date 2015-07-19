
## Exploratory Data Analysis
## Project 1
## plot2.R
## December 6, 2014
## 

## read data
a <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
a<-(a[a$Date =="1/2/2007" | a$Date =="2/2/2007",])
a$Date <- strptime(paste(a$Date, a$Time), "%d/%m/%Y %H:%M:%S")

## plotting
par(mar=c(4.5,4.5, 4.1 ,2.1), cex.lab=0.75, cex.axis=0.75, font.lab=1) # defaul is (5.1,4.1, 4.1 ,2.1)
with(a, plot(Date,Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))

# the code that creates the PNG file
dev.copy(png, file = "plot2.png",width = 480, height = 480, units = "px")
dev.off()

