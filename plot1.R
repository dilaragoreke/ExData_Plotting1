setwd("C:/Users/Dilara/Documents/R/Coursera/project1")

## Load data into data table called pow_cons
pow_cons <- read.table(file="household_power_consumption.txt", header = TRUE, na.strings = "?", sep = ";" )

## Convert the Date variables to Date Classes
pow_cons$Date <- as.Date(pow_cons$Date, format = "%d/%m/%Y")

## Subsetting data only from  the dates 2007-02-01 to 2007-02-02
pow_cons <- subset(pow_cons, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))


png("plot1.png", width=480, height=480)

## Plotting part
hist(pow_cons$Global_active_power, col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
