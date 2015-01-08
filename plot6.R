setwd("F:/COURSERA/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##install.packages("ggplot2")
##install.packages("dplyr")
library(dplyr)
library(ggplot2)

NEISCC <- left_join(NEI,SCC[,c(1,7)],by="SCC")
NEISCC_Mobile_BoltLos <- NEISCC %>% filter(grepl("Mobile Sources$", NEISCC$SCC.Level.One)==T) %>% 
  filter(fips == "24510" | fips =="06037" ) %>% group_by(fips,year) %>% summarise(Total.Emissions=sum(Emissions))

ggplot(NEISCC_Mobile_BoltLos,aes(x=year,y=Total.Emissions,color=fips)) + geom_line() +theme_bw()+geom_point()+
  xlab("Year") + ylab("Total Emissions (tons)") + ggtitle("Total Emissions from Motor Vehicle Sources \n (1999~2008, Baltimore City & LosAngeles)")

dev.copy(png, file='plot6.png')
dev.off()