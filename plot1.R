"
Loading the datamenos When loading the dataset into R, please consider the following:

The dataset has 2, 075,  259 rows and 9 columns.  First calculate a rough estimate  of how much memory the  dataset will
require in memory  before reading into  R. Make sure  your computer has  enough memory (most  modern computers should be
fine). We will only be  using data from the dates  2007-02-01 and 2007-02-02. One alternative  is to read the data  from
just those dates rather  than reading in the  entire dataset and subsetting  to those dates. You  may find it useful  to
convert the Date and Time variables to Date/Time classes  in R using the strptime()  and as.Date() functions. Note  that
in this  dataset missing  values are  coded as  ?. Making  Plotsmenos Our  overall goal  here is  simply to  examine how
household energy usage varies  over a 2-day period  in February, 2007. Your  task is to reconstruct  the following plots
below, all of which were constructed using the base plotting system.

First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1

For each plot you should

Construct the plot and save it  to a PNG file with a  width of 480 pixels and a  height of 480 pixels. Name each  of the
plot files as  plot1.png, plot2.png, etc.  Create a separate  R code file  (plot1.R, plot2.R, etc.)  that constructs the
corresponding plot, i.e. code in plot1.R constructs the  plot1.png plot. Your code file should include code  for reading
the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file. Add the PNG
file and R code  file to the top-level  folder of your git  repository (no need for  separate sub-folders) When you  are
finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up  to
date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.

The four plots that you will need to construct are shown below."

## Set Variables
setwd("C:/Git/ExData_Plotting1")
urlFile <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
zipFile <- "Data/filezipElectric_power_consumption.zip"
tableFile <- "./Data/household_power_consumption.txt"
dataDir = "C:/Git/ExData_Plotting1/Data"

##Download Data
if (!file.exists(zipFile)){
  download.file(url = urlFile, destfile = zipFile)
}

##Extract Plain File from Zip file
if (!file.exists(tableFile)){
  unzip(zipFile, exdir = dataDir)
}

## Construct the plot
pData <- read.table(tableFile, header = T, sep = ";", na.strings = "?")

## Only be using data from the dates 2007-02-01 and 2007-02-02
data1 <- pData[pData$Date %in% c("1/2/2007", "2/2/2007"), ]

## Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions
sTime <- strptime(paste(data1$Date, data1$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
data1 <- cbind(sTime, data1)

## Generating Plot 1
hist(data1$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Save file and close device
dev.copy(png, "plot1.png", width = 480, height = 480)

## Close the PGN file device
dev.off()