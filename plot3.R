#Sourcing data
#source("SourceData.R")

#spliting by type
library(ggplot2)
NEI_Balt <- NEI[NEI$fips=="24510",]
NEI_Balt_Grouped <- group_by(NEI_Balt,year,type)
NEI_Balt_Summary <- summarise(NEI_Balt_Grouped,Total_Emissions = sum(Emissions))
qplot(NEI_Balt_Summary$year,NEI_Balt_Summary$Total_Emissions,geom=type)