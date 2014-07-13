#Plot4
#Exploratory Data Analysis
#Joseph Chatman


#retrieve data
data.source <- read.table("household_power_consumption.txt", comment.char= "", sep= ";", na.strings= "?", skip= 66600, n= 3050)
#convert data into a data frame
data <- data.frame(data.source)
#subset for dates required
segment<- subset(data, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')

#conversions on the date and time 
date <- as.character(segment$V1)
time <- as.character(segment$V2)
date.time <- paste(date, time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")

#indicate multiple base plots
png(file = 'plot4.png')#open png device and create plot4.png
par(mfrow = c(2,2))
with (segment, {
        
        #plot1
        plot( date.time, segment$V3, type = "l",xlab = "", ylab = "Global Active Power")
        #plot2      
        plot( date.time, segment$V5, type = "l",xlab = "datetime", ylab = "Voltage")
        #plot3     
        plot (date.time,segment$V7,type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
        lines (date.time,segment$V8,type = "l", col = "red")
        lines (date.time,segment$V9,type = "l", col = "blue")
        
        legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
        #plot4
        plot(date.time,segment$V3, type ='l', xlab ="datetime", ylab ="Global_reactive_power")
})
dev.off()#close png device in my working directory
