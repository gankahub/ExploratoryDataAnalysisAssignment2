#Sourcing data
#source("SourceData.R")

library(dplyr)
library(ggplot2)

#limiting NEI data to Baltimore City or Los Angeles County
NEI_Balt_LA <- NEI[NEI$fips=="24510" | NEI$fips=="06037",]

#limiting SCC list to "motor vehicles"
SourceCar <- SCC[SCC$Data.Category == "Onroad",]

#joining NEI to SCC's
NEI_BaltLA_SourceCar <- merge(SourceCar,NEI_Balt_LA,by.x="SCC",by.y="SCC",all = FALSE)

#grouping and summarising for easy plotting
NEI_BaltLA_SourceCar <- group_by(NEI_BaltLA_SourceCar,year,fips)
NEI_BaltLA_Car_Sum <- summarise(NEI_BaltLA_SourceCar,Total_Emissions = sum(Emissions))

png(filename = "plot6.png")
#plotting summarised data
qplot(year,Total_Emissions,data=NEI_BaltLA_Car_Sum,facets = .~fips)
dev.off()