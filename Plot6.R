######################################################################################################
##   NAME: Eric Griffin                                                          Date: May-06-2018  ##
## course: Johns Hopkins University/Coursera - Exploratory Data Analysis                            ##  
##   Assn: Week 4 - Project #2                                                                      ##
##   File: plot6.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##       Address the following questions and tasks in my exploratory analysis:                      ##  
##                                                                                                  ##
##       Question#6: Which city has seen greater changes over time in motor vehicle emissions       ##
##                   LA or Baltimore?                                                               ## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


library(dplyr)
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Find any 'vehicles' in SCC

vbool <- grepl("Vehicle", SCC$EI.Sector)
vehicledata <- SCC$SCC[vbool]
vehicledata <- as.character(vehicledata)


# Aggregate the data using dplyr functions
LAXBMIvehEm <- NEI %>%
    filter(fips == "24510" | fips == "06037", SCC %in% vehicledata) %>%
    group_by(fips, year) %>%
    summarise(emissions = sum(Emissions))


png("plot6.png",width=480,height=480,units="px",bg="transparent")


## create a plot
    g <- ggplot(LAXBMIvehEm , aes(year, emissions, colour = fips)) +
                geom_point( shape=23 ) +
                geom_line() +
                ggtitle("Total PM2.5 Emissions From Motor Vehicles by City") + 
                xlab("Year") +
                ylab("PM2.5 Emissions") +
                scale_colour_discrete(name = "City",
                          labels = c("Los Angeles County", "Baltimore City"))
print(g)

dev.off()