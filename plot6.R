#Sourcing data
#source("SourceData.R")

#Initiating necessary library
library(dplyr)
library(ggplot2)

#limiting NEI data to Baltimore City or Los Angeles County
NEI_Balt <- NEI[NEI$fips=="24510",]
NEI_LA <- NEI[NEI$fips=="06037",]

#Identifying each city
NEI_Balt$City <- "Baltimore City"
NEI_LA$City <- "Los Angeles County"

#Appending Balt and LA Datasets
NEI_Balt_LA <- rbind(NEI_Balt,NEI_LA)

#limiting SCC list to "motor vehicles"
SourceCar <- SCC[SCC$Data.Category == "Onroad",]

#joining NEI to SCC's
NEI_BaltLA_SourceCar <- merge(SourceCar,NEI_Balt_LA,by.x="SCC",by.y="SCC",all = FALSE)

#grouping and summarising for easy plotting
NEI_BaltLA_SourceCar <- group_by(NEI_BaltLA_SourceCar,year,City)
NEI_BaltLA_Car_Sum <- summarise(NEI_BaltLA_SourceCar,Total_Emissions = sum(Emissions))

#opening display device
png(filename = "plot6.png")

#plotting summarised data
qplot(year,Total_Emissions,data=NEI_BaltLA_Car_Sum,facets = .~City)

#closing display device
dev.off()