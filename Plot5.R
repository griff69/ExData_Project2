######################################################################################################
##   NAME: Eric Griffin                                                          Date: May-06-2018  ##
## course: Johns Hopkins University/Coursera - Exploratory Data Analysis                            ##  
##   Assn: Week 4 - Project #2                                                                      ##
##   File: plot5.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##       Address the following questions and tasks in my exploratory analysis:                      ##  
##                                                                                                  ##
##       Question#5: How have emissions from motor vehicle sources changed from 1999–2008           ##
##                   in Baltimore City?                                                             ## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


## load ggplot2 library
library(ggplot2)

#read in EPA Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Find any 'vehicles' in SCC
vbool      <- grepl("vehicles", SCC$EI.Sector, ignore.case = TRUE)
vehicleData <- SCC[vbool,]


## match SCC up to NEI data
vEmissions <- NEI[(NEI$SCC %in% vehicleData$SCC), ]

## find emissions for Baltimore City
BMIvehEm <- subset(vEmissions, fips == "24510")

## gather emissions and sum() by year
vEmTotalsAgg    <- aggregate(Emissions ~ year, BMIvehEm, sum) 


png("plot5.png",width=480,height=480,units="px",bg="transparent")
## create a plot
 g <- ggplot(data = vEmTotalsAgg , aes(x = year, y = Emissions)) + 
             geom_line() + 
             geom_point( size = 4, shape = 23, fill = "blue") + 
             xlab("Year") + 
             ylab("Emissions (tons)") + 
             labs(title=expression("PM"[2.5]* " Motor Vehicle Emissions in Baltimore"))

print(g)

dev.off()