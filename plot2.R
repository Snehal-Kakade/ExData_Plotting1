## Getting full dataset

powerdata <- read.table("ExploratoryDataAnalysis/household_power_consumption.txt",header = TRUE,sep=";",na.strings = "?",
                        nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Subsetting data from the dates 2007-02-01 and 2007-02-02.
subpower = powerdata[powerdata$Date %in% c("1/2/2007", "2/2/2007"),]

globalActivePower <- as.numeric(subpower$Global_active_power)

## Converting dates
datetime <- strptime(paste(subpower$Date, subpower$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

## Plot 2
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()