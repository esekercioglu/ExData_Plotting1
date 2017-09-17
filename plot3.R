#Exploratory Data Analysis Week 1
#Plot 3 For Course Project 1
#For this code to work household_power_consumption.txt must be placed
#in the working directory for your session


## Get the dataset, set the date variable as.Date

fullpower <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
fullpower$Date <- as.Date(fullpower$Date, format="%d/%m/%Y")

## Subset the data (1/2/2007 and 2/2/2007)
power <- subset(fullpower, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))

# Remove full dataset from memory 
rm(fullpower)

## Convert the date and time variable
datetime <- paste(as.Date(power$Date), power$Time)
power$Datetime <- as.POSIXct(datetime)

## Generating Plot 3

with(power, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy sub metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Export Plot 3 to a PNG file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()