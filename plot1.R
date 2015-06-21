#Sourcing data
source("SourceData.R")

#Initiating necessary library
library(dplyr)

#grouping and summarising for easy plotting
NEI_Grouped <- group_by(NEI,year)
NEI_Grouped <- summarise(NEI_Grouped,Total_Emissions = sum(Emissions))

#opening display device
png(filename = "plot1.png")

#plotting summarised data
plot(NEI_Grouped$year,NEI_Grouped$Total_Emissions,xlab = "Year",ylab = "Emissions (t)",main="Total PM2.5 Emissions")

#closing display device
dev.off()