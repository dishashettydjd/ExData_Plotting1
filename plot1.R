library("data.table")

setwd("C:~\Users\Mahe\Desktop\exdata_data_household_power_consumption")

#Takes data and subsets data for specific dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
                             )

# avoids scientific notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Changes Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filte 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## the Plot
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()