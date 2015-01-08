setwd("F:/COURSERA/exdata_data_NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##install.packages("ggplot2")
##install.packages("dplyr")
library(dplyr)
library(ggplot2)

EM_year_type_bal <- NEI  %>% filter(fips == "24510") %>% group_by(year,type) %>% 
  summarise(Total.Emissions=sum(Emissions))
ggplot(EM_year_type_bal,aes(x=year,y=Total.Emissions,color=type))+geom_line()+theme_bw()+geom_point()+
  xlab("Year") +
  ylab("Total PM2.5 Emissions (in tons)")+
ggtitle("Total Emissions by Types \n (1999~2008, Baltimore City)")

dev.copy(png, file='plot3.png')
dev.off()
