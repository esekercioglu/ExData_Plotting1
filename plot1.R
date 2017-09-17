#Exploratory Data Analysis Week 1
#Plot 1 For Course Project 1
#For this code to work household_power_consumption.txt must be placed
#in the working directory for your session

#Read, and subset the dataset

fullpower <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(fullpower) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
power <- subset(fullpower,fullpower$Date=="1/2/2007" | fullpower$Date =="2/2/2007")

#Create Histogram for "Global Active Power"

hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# Add the title for the chart

title(main="Global Active Power")

# Export the histogram to a PNG file

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()