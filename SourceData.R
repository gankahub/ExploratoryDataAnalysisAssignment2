##Setting working directory
setwd("H:/H_Analysis/Assignments/")

##downloading file
fileurl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileurl,destfile = "./exdata.zip")

#download.file(fileurl,destfile = "./exdata.zip",method="curl")



##unzipping file

unzip("./exdata.zip",exdir = "./data")



#Importing

NEI <- readRDS("./data/summarySCC_PM25.rds")

NEI_Sample <- NEI[1:10000,]



#Importing

SCC <- readRDS("./data/Source_Classification_code.rds")



#plotting the change in emissions every year

boxplot(Emissions ~ year,data = NEI,xlab="Year",ylab="Emissions(t)")



#total emissions by year

library(dplyr)

NEI_Grouped <- group_by(NEI,year)

NEI_Grouped <- summarise(NEI_Grouped,Total_Emissions = sum(Emissions))



plot(NEI_Grouped$year,NEI_Grouped$Total_Emissions,xlab = "Year",ylab = "Emissions",main="Total PM2.5 Emissions")





#limiting dataset to 24510

NEI_Balt <- NEI[NEI$fips=="24510",]

NEI_Balt_Grouped <- group_by(NEI_Balt,year)

NEI_Balt_Summary <- summarise(NEI_Balt_Grouped,Total_Emissions = sum(Emissions))

plot(NEI_Balt_Summary$year,NEI_Balt_Summary$Total_Emissions,xlab = "Year",ylab="Emissions",main = "Baltimore PM2.5 Emissions")





#spliting by type

library(ggplot2)

NEI_Balt <- NEI[NEI$fips=="24510",]

NEI_Balt_Grouped <- group_by(NEI_Balt,year,type)

NEI_Balt_Summary <- summarise(NEI_Balt_Grouped,Total_Emissions = sum(Emissions))

qplot(NEI_Balt_Summary$year,NEI_Balt_Summary$Total_Emissions,geom=type)