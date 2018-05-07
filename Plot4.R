######################################################################################################
##   NAME: Eric Griffin                                                          Date: May-06-2018  ##
## course: Johns Hopkins University/Coursera - Exploratory Data Analysis                            ##  
##   Assn: Week 4 - Project # 2                                                                     ##
##   File: plot4.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##       Address the following questions and tasks in my exploratory analysis:                      ##  
##                                                                                                  ##
##       Question#4: Across the United States, how have emissions from coal combustion-related      ## 
##                   sources changed from 1999–2008?                                                ## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


## load ggplot2 library
library(ggplot2)

#read in EPA Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##  Find coal-related sources (Has coal in Short Name description)
cbool <- grepl('Coal', SCC$Short.Name, fixed = TRUE)
coalData <- SCC[cbool, ]

##  Connect coal combustion sources to emissions
cEmissions <- NEI[(NEI$SCC %in% coalData$SCC), ]

##  Gather by year
cEmTotalsAgg <- aggregate(Emissions ~ year, cEmissions, sum)


png("plot4.png",width=480,height=480,units="px",bg="transparent")
## plot data
g <- ggplot(data = cEmTotalsAgg, 
            aes(x = year, y = Emissions)) + 
  geom_line() + 
  geom_point( size = 3, shape = 23, fill = "blue") + 
  xlab("Year") + 
  ylab("Emissions (tons)") + 
  labs(title=expression("US Coal Combustion PM"[2.5]*" Emissions"))

print(g)

dev.off()