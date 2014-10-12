## plot1.R my code for the 1st plot of the assignment of week 1 
## of Exploratory Data Analysis

#define the column classes
colClass=c(rep("character",2), rep("numeric",5))
# read data
x<-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?", colClasses=colClass)
#subset the data for the requested dates
x<-subset(x, Date %in% c("1/2/2007","2/2/2007"))
#convert date time fields into one datetime field
x$datetime<-as.POSIXct(paste(x$Date,x$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

# turn on the png device
png(png,units="px", width=480, height=480,filename="plot1.png")

# plot the chart
hist(x$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
#turn off the png device
dev.off()