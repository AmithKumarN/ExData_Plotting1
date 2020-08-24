df <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'))
df <- df[df$Date %in% c("1/2/2007","2/2/2007"),]
df <- df[complete.cases(df),]
dateTime <- strptime(paste(df$Date, df$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
df <- cbind(dateTime, df)
plot(df$Global_active_power ~ df$dateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png,"plot2.png", width=480, height=480)
dev.off()