######################################################################################################
##   NAME: Eric Griffin                                                          Date: May-06-2018  ##
## course: Johns Hopkins University/Coursera - Exploratory Data Analysis                            ##  
##   Assn: Week 4 - Project # 2                                                                     ##
##   File: plot1.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##          Address the following questions and tasks in my exploratory analysis:                   ##  
##                                                                                                  ##
##          Question #1: Have total emissions of PM2.5 decreased inthe US from years 1999 to 2008 ? ## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


#read in EPA Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#aggergate sum of all emissions for each year
ebyr <- aggregate(Emissions~year,NEI,sum)

#send plot to a png file device
png(filename = "plot1.png",width = 480, height = 480)

barplot(
         (ebyr$Emissions)/10^6,
         names.arg = ebyr$year,
               col = 'light gray',
              main = "Total PM2.5 Emissions for United States by Year",
              ylab = "Total Emissions (in Tons)",
              xlab = "Year")


dev.off()

