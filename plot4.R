setwd("C:/Users/Dilara/Documents/R/Coursera/project1")

## Load data into data table called pow_cons
pow_cons <- read.table(file="household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";" )

## Convert the Date variables to Date Classes
pow_cons$Date <- as.Date(pow_cons$Date, format = "%d/%m/%Y")

## Subsetting data only from  the dates 2007-02-01 to 2007-02-02
pow_cons <- subset(pow_cons, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

## date&time format by creating POSIXct variables
pow_cons$DateTime <- as.POSIXct(paste(as.Date(pow_cons$Date), pow_cons$Time))

## Plot 4
png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(pow_cons$DateTime,pow_cons$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
plot(pow_cons$DateTime,pow_cons$Voltage, type="l", ylab="Voltage", xlab="datetime")
plot(pow_cons$DateTime,pow_cons$Sub_metering_1, type="l",col ="black", ylab="Energy sub metering", xlab="")
lines(pow_cons$DateTime, pow_cons$Sub_metering_2, col ="red")
lines(pow_cons$DateTime, pow_cons$Sub_metering_3, col ="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"),lty=1,lwd=1)

plot(pow_cons$DateTime,pow_cons$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off()