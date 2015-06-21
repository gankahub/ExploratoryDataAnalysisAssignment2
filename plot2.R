#Sourcing data
#source("SourceData.R")

#limiting dataset to 24510
NEI_Balt <- NEI[NEI$fips=="24510",]
NEI_Balt_Grouped <- group_by(NEI_Balt,year)
NEI_Balt_Summary <- summarise(NEI_Balt_Grouped,Total_Emissions = sum(Emissions))
plot(NEI_Balt_Summary$year,NEI_Balt_Summary$Total_Emissions,xlab = "Year",ylab="Emissions (t)",main = "Baltimore PM2.5 Emissions")
