geturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(geturl,"assignment1data.zip")
unzip("assignment1data.zip")
datafile <- "household_power_consumption.txt"
dataset <- read.table(datafile,header=T,sep=";")

gapower <- as.double(as.character(dataset$Global_active_power))
gapower <- gapower[!is.na(gapower)]

submeter1 <- as.double(as.character(dataset$Sub_metering_1))
submeter2 <- as.double(as.character(dataset$Sub_metering_2))
submeter3 <- as.double(as.character(dataset$Sub_metering_3))
submeter1 <- submeter1[!is.na(submeter1)]
submeter2 <- submeter2[!is.na(submeter2)]
submeter3 <- submeter3[!is.na(submeter3)]

voltage <- as.double(as.character(dataset$Voltage))
voltage <- voltage[!is.na(voltage)]

grpower <- as.double(as.character(dataset$Global_reactive_power))
grpower <- grpower[!is.na(grpower)]

dates <- as.character(dataset$Date)
twodays <- dates=="1/2/2007" | dates=="2/2/2007"

gapower <- gapower[twodays]
submeter1 <- submeter1[twodays]
submeter2 <- submeter2[twodays]
submeter3 <- submeter3[twodays]
voltage <- voltage[twodays]
grpower <- grpower[twodays]
png(filename="plot4.png")
par(mfcol=c(2,2))

plot(gapower,xlab="",ylab="Global Active Power (kilowatts)",type="n",xaxt="n")
lines(gapower)
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(submeter1,xlab="",ylab="Energy submetering",type="n",xaxt="n")
lines(submeter1)
lines(submeter2,col="red")
lines(submeter3,col="blue")
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))

plot(voltage,xlab="datetime",ylab="Voltage",type="n",xaxt="n")
lines(voltage)
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

plot(grpower,xlab="grpower",ylab="Global_reactive_power",type="n",xaxt="n")
lines(grpower)
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))

dev.off()