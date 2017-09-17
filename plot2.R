#Exploratory Data Analysis Week 1
#Plot 2 For Course Project 1
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

## Generating Plot 2
plot(power$Global_active_power~power$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## Export Plot 2 to a PNG file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()