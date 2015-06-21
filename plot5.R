#Sourcing data
#source("SourceData.R")

#limiting NEI data to Baltimore City
NEI_Balt <- NEI[NEI$fips=="24510",]

#limiting SCC list to "motor vehicles"
SourceCar <- SCC[SCC$Data.Category == "Onroad",]

#joining NEI to SCC's
NEI_SourceCar <- merge(SourceCar,NEI_Balt,by.x="SCC",by.y="SCC",all = FALSE)

#grouping and summarising for easy plotting
NEI_SourceCar <- group_by(NEI_SourceCar,year)
NEI_Car_Sum <- summarise(NEI_SourceCar,Total_Emissions = sum(Emissions))

#plotting summarised data
plot(NEI_Car_Sum$year,NEI_Car_Sum$Total_Emissions,xlab = "Year",ylab="Emissions (t)",main = "Baltimore City Motor Vehicle Emissions")
