#Plot2
#Exploratory Data Analysis
#Joseph Chatman

#retrieve data
data.source <- read.table("household_power_consumption.txt", comment.char= "", sep= ";", na.strings= "?", skip= 66600, n= 3050)
#convert data into a data frame
data <- data.frame(data.source)
#subset for dates required
segment <- subset(data, as.Date(V1) == '01/02/2007' | as.Date(V1) == '02/02/2007')
#perform date and time conversions
date <- as.character(segment$V1)
time <- as.character(segment$V2)
date.time <- paste(date, time)
date.time <- strptime(date.time, "%d/ %m/ %Y %H: %M: %S")

#create the plot
png(file = 'plot2.png')#open png device and create plot2.png
plot(date.time, segment$V3, ylab= "Global Active Power (kilowatts)",xlab="", type= "l")
dev.off()#close PNG device in my working directory
