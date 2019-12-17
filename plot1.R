# First we create a directory for our dataset
if(!file.exists("./dataset")){dir.create("./dataset")}
# Then we download the file for the dataseth
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "./dataset/sourcedata.zip")
# Next we unzip the downloaded dataset within the same directory of the download
unzip(zipfile = "./dataset/sourcedata.zip",exdir = "./dataset")
# Up next we assign read and assign our dataset to a variable
electric_power_consumption <- read.csv("./dataset/household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors=FALSE, dec=".", na.strings = "?")
# Now we subset our data to only inlcude rows from the dates 2007-02-01 and 2007-02-02
epc_feb_1and2 <- subset(electric_power_consumption, Date %in% c("1/2/2007","2/2/2007"))
# Here we convert the column to date
epc_feb_1and2$Date <- as.Date(epc_feb_1and2$Date, "%d/%m/%Y")
# Next we create our first plot, a histogram with the title Global Active Power,
# Frequency on the y-axis and Global Active Power (in kilowatts) on the x-axis and red as the color
hist(as.numeric(epc_feb_1and2$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
# We then save the resulting plot as plot1.png in our wd
png(filename = "plot1.png", width = 480, height = 480, units = "px")
dev.off()