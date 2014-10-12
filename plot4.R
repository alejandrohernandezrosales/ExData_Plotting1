## plot3.R my code for the 3rd plot of the assignment of week 1 
## of Exploratory Data Analysis

#define the column classes
colClass=c(rep("character",2), rep("numeric",5))
# read data
x<-read.table("household_power_consumption.txt", 
              header=TRUE, sep=";", na.strings="?", colClasses=colClass)
#subset the data for the requested dates
x<-subset(x, Date %in% c("1/2/2007","2/2/2007"))
#convert date time fields into one datetime field
x$datetime<-as.POSIXct(paste(x$Date,x$Time, sep=" "),format="%d/%m/%Y %H:%M:%S")

# turn on the png device
png(png,units="px", width=480, height=480,filename="plot4.png")

#define the columns for chart
par(mfcol = c(2,2))

# plot chart 1,1
plot(x$datetime, x$Global_active_power, type="l", 
     ylab="Global Active Power (kilowatts)", xlab="")

# plot chart 2,1
plot(x$datetime, x$Sub_metering_1, type="l", 
     ylab="Energy sub metering", col="black",xlab="")
# add the additional lines
lines(x$datetime, x$Sub_metering_2, type="l",col="red")
lines(x$datetime, x$Sub_metering_3, type="l",col="blue")
#write the legend
legend("topright", bty="n", lty= 1, col = c("black", "red", "blue"), 
       legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#plot chart 1,2
plot(x$datetime, x$Voltage, type="l", 
     ylab="Voltage", xlab="")

#plot chart 2,2
plot(x$datetime, x$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="")

#turn off the png device
dev.off()