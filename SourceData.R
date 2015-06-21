#creating data directory
if(!file.exists("data")){
  dir.create("data")
}

##downloading file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl,destfile = "./exdata.zip",method="curl")

##unzipping file
unzip("./exdata.zip",exdir = "./data")

#Importing
NEI <- readRDS("./data/summarySCC_PM25.rds")

#Importing
SCC <- readRDS("./data/Source_Classification_Code.rds")
