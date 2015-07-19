a <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?", colClasses=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
a<-(a[a$Date =="1/2/2007" | a$Date =="2/2/2007",])
a$Date <- strptime(paste(a$Date, a$Time), "%d/%m/%Y %H:%M:%S")
