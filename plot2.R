setwd("F:/COURSERA/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

EM_balt <- NEI %>% group_by(year) %>% filter(fips == "24510") %>% summarise(Total.Emissions=sum(Emissions))
plot(EM_balt$year,EM_balt$Total.Emissions,type='b',xlab="Year",ylab="Total Emissions"
       ,main="Yearly Total Emissions in Baltmore City")

dev.copy(png, file='plot2.png')
dev.off()

