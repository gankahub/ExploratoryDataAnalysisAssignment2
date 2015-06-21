#Sourcing data
source("SourceData.R")

#Initiating necessary library
library(dplyr)
library(ggplot2)

#limiting dataset to 24510 which is Baltimore City
NEI_Balt <- NEI[NEI$fips=="24510",]

#grouping and summarising for easy plotting
NEI_Balt_Grouped <- group_by(NEI_Balt,year,type)
NEI_Balt_Summary <- summarise(NEI_Balt_Grouped,Total_Emissions = sum(Emissions))

#opening display device
png(filename = "plot3.png")

#plotting summarised data
qplot(year,Total_Emissions,data=NEI_Balt_Summary,facets=.~type)

#closing display device
dev.off()