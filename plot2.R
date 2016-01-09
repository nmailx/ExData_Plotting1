geturl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(geturl,"assignment1data.zip")
unzip("assignment1data.zip")
datafile <- "household_power_consumption.txt"
dataset <- read.table(datafile,header=T,sep=";")

gapower <- as.double(as.character(dataset$Global_active_power))
gapower <- gapower[!is.na(gapower)]
dates <- as.character(dataset$Date)
twodays <- dates=="1/2/2007" | dates=="2/2/2007"
plotdata <- gapower[twodays]
png(filename="plot2.png")
plot(plotdata,xlab="",ylab="Global Active Power (kilowatts)",type="n",xaxt="n")
lines(plotdata)
axis(side=1,at=c(1,1440,2880),labels=c("Thu","Fri","Sat"))
dev.off()