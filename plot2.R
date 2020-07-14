# Read the file

hpc_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

# Convert the Date to date class

hpc_data$Date <- as.Date(hpc_data$Date, "%d/%m/%Y")

# Filter data from the dates 2007-02-01 and 2007-02-02

hpc_sub <- subset(hpc_data,Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))

# Combine and convert the Date_Time to POSIXct class

Date_Time <- paste(hpc_sub$Date, hpc_sub$Time)
names(Date_Time) <- c("Date_Time")
hpc <- hpc_sub[ ,-c(1,2)]
hpc <- cbind(Date_Time, hpc)
hpc$Date_Time <- as.POSIXct(Date_Time)

# Plot

#Plot 2

png("plot2.png", width=480, height=480)
plot(hpc$Date_Time, hpc$Global_active_power,  type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
