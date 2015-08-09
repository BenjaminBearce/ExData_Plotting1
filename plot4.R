#--------------------------------------------------#
#                      Plot 4                      #
#--------------------------------------------------#

#initialization
library(dplyr)
library(tidyr)
library(lubridate)

# Import\Load
setwd("../");
setwd(paste(getwd(),"/GitHub/Exploratory_Data_Analysis/",sep=""));

#Define What Data To Read
date1 <- grep("1/2/2007", readLines("household_power_consumption.txt"))
date2 <- grep("2/2/2007", readLines("household_power_consumption.txt"))
start <- date1[1]-1
end <- tail(date2,1) - start;
header <- names(read.table("household_power_consumption.txt",sep = ";",nrows = 1, header = T))

#Read Specific Dates of Data
hpc <- read.table("household_power_consumption.txt"
                  , header = F
                  , quote = ""
                  , skip = start
                  , nrow = end
                  , sep = ";"
                  , stringsAsFactors = F
                  ,na.strings = "?")
#Assign Header
names(hpc) <- header

hpc$Date <- dmy(hpc$Date)

hpc <- subset(hpc, Date == dmy("1/2/2007") | Date == dmy("2/2/2007"))

#Plot Data #par(mfrow = c(1,1))

### Plot 4
#Display
par(mfrow = c(2,2))
#1
plot(ymd_hms(paste(hpc$Date, hpc$Time))
     ,hpc$Global_active_power, type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power")
#2
plot(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Voltage, type = "l"
     ,xlab = "datetime"
     ,ylab = "Voltage")
#3
plot(ymd_hms(paste(hpc$Date, hpc$Time))
     ,hpc$Sub_metering_1, type = "l"
     ,xlab = ""
     ,ylab = "Energy sub metering")
lines(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Sub_metering_2, col = "red")
lines(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Sub_metering_3, col = "blue")
legend("topright"
       ,lty = 1
       ,col = c("black", "red", "blue")
       ,legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
#4
plot(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Global_reactive_power, type = "l"
     ,xlab = "datetime"
     ,ylab = "Global_reactive_power")

### Export 4
png(file = "plot4.png",width = 480,height = 480)
#Display
par(mfrow = c(2,2))
#1
plot(ymd_hms(paste(hpc$Date, hpc$Time))
     ,hpc$Global_active_power, type = "l"
     ,xlab = ""
     ,ylab = "Global Active Power")
#2
plot(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Voltage, type = "l"
     ,xlab = "datetime"
     ,ylab = "Voltage")
#3
plot(ymd_hms(paste(hpc$Date, hpc$Time))
     ,hpc$Sub_metering_1, type = "l"
     ,xlab = ""
     ,ylab = "Energy sub metering")
lines(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Sub_metering_2, col = "red")
lines(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Sub_metering_3, col = "blue")
legend("topright"
       ,lty = 1
       ,col = c("black", "red", "blue")
       ,legend = c("Sub_metering_1","Sub_metering_1","Sub_metering_1"))
#4
plot(ymd_hms(paste(hpc$Date, hpc$Time)), hpc$Global_reactive_power, type = "l"
     ,xlab = "datetime"
     ,ylab = "Global_reactive_power")
dev.off()