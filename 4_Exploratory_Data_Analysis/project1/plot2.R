#Reads in data from file then subsets data for specified dates
> power_con <- data.table::fread(input = "household_power_consumption.txt"
+                                 , na.strings="?"
+ )
> # Prevents Scientific Notation
> power_con[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
> # Making a POSIXct date capable of being filtered and graphed by time of day
> powerDT[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Error: object 'powerDT' not found
> 
> # Making a POSIXct date capable of being filtered and graphed by time of day
> power_com[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
Error: object 'power_com' not found
> 
> # Making a POSIXct date capable of being filtered and graphed by time of day
> power_con[, dateTime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
> 
> 
> # Filter Dates for 2007-02-01 and 2007-02-02
> power_con <- power_con[(dateTime >= "2007-02-01") & (dateTime < "2007-02-03")]
> 
> png("plot2.png", width=480, height=480)
> 
> ## Plot 2
> plot(x = power_con[, dateTime]
+      , y = power_con[, Global_active_power]
+      , type="l", xlab="", ylab="Global Active Power (kilowatts)")
> 
> dev.off()
