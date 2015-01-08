setwd("D:/Coursera/EDA/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##install.packages("dplyr")
##install.packages("ggplot2")

library(dplyr)
library(ggplot2)

NEI_df <- tbl_df(NEI)

EM_year<-NEI %>% group_by(year) %>% summarise(Total.Emissions=sum(Emissions))
plot(EM_year$year, EM_year$Total.Emissions, xlab="Year", ylab="Total PM2.5 Emissions (in tons)",
     main="Total Emissions from PM2.5 (US, 1999-2008)",type="b")

dev.copy(png, file='plot1.png')
dev.off()
