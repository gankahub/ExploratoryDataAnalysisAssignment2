#Sourcing data
source("SourceData.R")

#Initiating necessary library
library(dplyr)

#Identifying all sources which are coal
SourceCoal <- SCC[grep("[Cc][Oo][Aa][Ll]",SCC$Short.Name),]

#Identifying all sources which are comb
SourceCoalComb <- SourceCoal[grep("[Cc][Oo][Mm][Bb]",SourceCoal$EI.Sector),]

#joining NEI to SCC's which have Source Coal combustion
NEI_SourceCoalComb <- merge(SourceCoalComb,NEI,by.x="SCC",by.y="SCC",all = FALSE)

#grouping and summarising for easy plotting
NEI_SourceCoalComb <- group_by(NEI_SourceCoalComb,year)
NEI_Coal_Sum <- summarise(NEI_SourceCoalComb,Total_Emissions = sum(Emissions))

#opening display device
png(filename = "plot4.png")

#plotting summarised data
plot(NEI_Coal_Sum$year, NEI_Coal_Sum$Total_Emissions,xlab = "Year",ylab="Emissions (t)",main = "Emissions from Coal Combustion related Sources in the US")

#closing display device
dev.off()
