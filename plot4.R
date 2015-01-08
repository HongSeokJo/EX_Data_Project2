setwd("F:/COURSERA/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


##install.packages("ggplot2")
##install.packages("dplyr")

library(dplyr)
library(ggplot2)

NEISCC <- left_join(NEI,SCC[,c(1,4)],by="SCC")
NEISCC_coal <- NEISCC %>% filter(grepl("Coal$", NEISCC$EI.Sector)==T) %>% group_by(EI.Sector,year) %>% summarise(Total.Emissions=sum(Emissions))

ggplot(NEISCC_coal,aes(x=year,y=Total.Emissions,color=EI.Sector))+geom_line()+theme_bw()+geom_point()+
  xlab("Year") +
  ylab("Total Emissions (tons)")+
  ggtitle("Total Emissions from coal combustion-related sources \n (1999~2008, United States)")

dev.copy(png, file='plot4.png')
dev.off()