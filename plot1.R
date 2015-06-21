#Sourcing data
#source("SourceData.R")

#total emissions by year
library(dplyr)
NEI_Grouped <- group_by(NEI,year)
NEI_Grouped <- summarise(NEI_Grouped,Total_Emissions = sum(Emissions))
plot(NEI_Grouped$year,NEI_Grouped$Total_Emissions,xlab = "Year",ylab = "Emissions (t)",main="Total PM2.5 Emissions")
