#Sourcing data
source("SourceData.R")

#Initiating necessary library
library(dplyr)

#limiting dataset to 24510 which is Baltimore City
NEI_Balt <- NEI[NEI$fips=="24510",]

#grouping and summarising for easy plotting
NEI_Balt_Grouped <- group_by(NEI_Balt,year)
NEI_Balt_Summary <- summarise(NEI_Balt_Grouped,Total_Emissions = sum(Emissions))

#opening display device
png(filename = "plot2.png")

#plotting summarised data
plot(NEI_Balt_Summary$year,NEI_Balt_Summary$Total_Emissions,xlab = "Year",ylab="Emissions (t)",main = "Baltimore PM2.5 Emissions")

#closing display device
dev.off()