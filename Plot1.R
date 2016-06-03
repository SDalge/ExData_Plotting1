## Create Directory, download the ZIP file and extract the TXT file
  if(!file.exists("./C4")){dir.create("./C4")}
  url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(url, destfile = "./C4/HPC.zip")
  unzip("C4/HPC.zip", exdir = "./C4")

## read TXT file and select the period 
  hpc <- read.table("C4/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  hpc_feb2007 <- subset(hpc, Date == "1/2/2007" | Date == "2/2/2007")
  
## load DPLYR package  
  library(dplyr)

## Create a Data_Time variable with date and time infos
  hpc_feb2007 <- mutate(hpc_feb2007, Date_Time = paste(Date,Time))
  hpc_feb2007$Date_Time <- strptime(hpc_feb2007$Date_Time,"%d/%m/%Y %H:%M:%S")

## Generate the plot
  png("C4/ExData_Plotting1/plot1.png", width = 480, height = 480)
  hist(hpc_feb2007$Global_active_power, main = "Global Active Power", col = "red", xlab = "Global Active Power (kilowatts)")
  dev.off()


