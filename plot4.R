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

## Generating Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(power, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        text.font=1)
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})


## Export Plot 4 to a PNG file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()