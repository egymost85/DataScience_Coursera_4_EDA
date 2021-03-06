#Load necessary libraries
library(tidyverse)
library(lubridate)

#read the data
hhppc3 <- read_delim("in/hhpc.txt",";",na="?")

#filter to 1st and 2nd Feb 2007
hhppc4 <- filter(hhppc3, Date == "1/2/2007" | Date == "2/2/2007")

#Check
unique(hhppc4$Date)

#Convert to Date
hhppc4$DT <- paste(hhppc4$Date,hhppc4$Time) 
hhppc4$DT <- dmy_hms(hhppc4$DT)

#plot 4

png("plot4.png",width = 480,height = 480)
#setup the 4 plot space
par(mfrow=c(2,2))


#plot 4-1
plot(hhppc4$DT,hhppc4$Global_active_power,
     type =  "l",
     xlab = "",
     ylab = "Global Active Power")
#plot 4-2
plot(hhppc4$DT,hhppc4$Voltage,
     type="l",
     xlab = "datetime",
     ylab = "Voltage")

#plot 4-3
plot(hhppc4$DT, hhppc4$Sub_metering_1,
     type="l",
     xlab = "",
     ylab = "Energy sub metering")
lines(hhppc4$DT, hhppc4$Sub_metering_2, col="red")
lines(hhppc4$DT, hhppc4$Sub_metering_3, col="blue")
legend("topright", 
       col = c("black","blue","red"),
       lty = c(1,1),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       bty = "n",
       x.intersp = .4,
       cex = 1)

#plot 4-4
plot(hhppc4$DT, hhppc4$Global_reactive_power, 
     type = "l",
     xlab = "datetime",
     ylab = colnames(hhppc4)[4])


dev.off()
