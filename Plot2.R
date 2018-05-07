######################################################################################################
##   NAME: Eric Griffin                                                          Date: May-06-2018  ##
## course: Johns Hopkins University/Coursera - Exploratory Data Analysis                            ##  
##   Assn: Week 4 - Project # 2                                                                     ##
##   File: plot2.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##       Address the following questions and tasks in my exploratory analysis:                      ##  
##                                                                                                  ##
##       Question#2: Have total emissions of PM2.5 decreased in Baltimore, Maryland from 1999~2008 ?## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


#read in EPA Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Seperating Baltimore city data

cnames <- names(NEI)
baltimore_data <- subset(NEI, fips == "24510", select = cnames)

# sum emissions per each year for Baltimore city data
em_balt_data <- tapply(baltimore_data$Emissions,baltimore_data$year,sum)

#plot2 png file
png(filename = "plot2.png",width = 480, height = 480, units="px")
barplot(em_balt_data, col = 'light gray', 
        main = "Total PM2.5 Emissions in Baltimore, Maryland by Year", 
        ylab = "Total Emissions", xlab = "Year")

  lines(x = em_balt_data,lwd=2,col="yellow")

dev.off()
