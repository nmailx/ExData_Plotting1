geturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(geturl,"assignment1data.zip")
unzip("assignment1data.zip")
datafile <- "household_power_consumption.txt"
dataset <- read.table(datafile,header=T,sep=";")

submeter1 <- as.double(as.character(dataset$Sub_metering_1))
submeter2 <- as.double(as.character(dataset$Sub_metering_2))
submeter3 <- as.double(as.character(dataset$Sub_metering_3))
submeter1 <- submeter1[!is.na(submeter1)]
submeter2 <- submeter2[!is.na(submeter2)]
submeter3 <- submeter3[!is.na(submeter3)]

dates <- as.character(dataset$Date)
twodays <- dates=="1/2/2007" | dates=="2/2/2007"
plotdata1 <- submeter1[twodays]
plotdata2 <- submeter2[twodays]
plotdata3 <- submeter3[twodays]
png(filename="plot3.png")
plot(plotdata1,xlab="",ylab="Energy submetering",type="n",xaxt="n")
lines(plotdata1)
lines(plotdata2,col="red")
lines(plotdata3,col="blue")
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))
dev.off()