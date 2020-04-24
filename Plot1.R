#Load necessary libraries
library(tidyverse)
library(lubridate)

#read the data
hhppc3 <- read_delim("hhpc.txt",";",na="?")

#filter to 1st and 2nd Feb 2007
hhppc4 <- filter(hhppc3, Date == "1/2/2007" | Date == "2/2/2007")

#Check
unique(hhppc4$Date)

#Convert to Date
hhppc4$DT <- paste(hhppc4$Date,hhppc4$Time) 
hhppc4$DT <- dmy_hms(hhppc4$DT)

#plot1

png("plot1.png",width = 480,height = 480)

hist(hhppc4$Global_active_power, col="red", 
     xlab="Global Active Power (kilowatts)",
     ylab = "Frequency",
     main = "Global Active Power")
    
dev.off()
