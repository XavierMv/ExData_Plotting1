setwd("C:/Users/xavie/OneDrive/Escritorio/plots/ExData_Plotting1")
household_power_consumption <- read.csv("C:/Users/xavie/OneDrive/Escritorio/data science coursera/household_power_consumption.txt", header=TRUE, sep=";")
householdnew <- subset(household_power_consumption, household_power_consumption$Date == "1/2/2007" | household_power_consumption$Date == "2/2/2007")
householdnew$Date <- as.Date(householdnew$Date, format = "%d/%m/%Y")
householdnew$Time <- strptime(householdnew$Time, format = "%H:%M:%S" )
householdnew[1:1440,"Time"] <- format(householdnew[1:1440,"Time"],"2007-02-01 %H:%M:%S")
householdnew[1441:2880,"Time"] <- format(householdnew[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
attach(householdnew)


png("plot2.png", width = 480, height = 480, units = "px")
plot(Time, as.numeric(Global_active_power), ylab = "Global Active Power (kilowatts)", type = "l")
dev.off()