######################################################################################################
##   NAME: Eric Griffin                                                          Date: May-06-2018  ##
## course: Johns Hopkins University/Coursera - Exploratory Data Analysis                            ##  
##   Assn: Week 4 - Project # 2                                                                     ##
##   File: plot3.R                                                                                  ##
##                                                                                                  ##
## Purpose:                                                                                         ##
##       Address the following questions and tasks in my exploratory analysis:                      ##  
##                                                                                                  ##
##       Question#3: Of the 4 types, which sources have seen drecreses/increases in Baltimore       ## 
##                   from 1999 ~ 2008 ?                                                             ## 
##                                                                                                  ##
##                                                                                                  ##
######################################################################################################


library(ggplot2)


#read in EPA Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Subset NEI data by Baltimore's fip.
cnames <- names(NEI)
bmi_data <- subset(NEI, fips == "24510", select = cnames)

png("plot3.png",width=480,height=480,units="px",bg="transparent")

library(ggplot2)

g <- ggplot(bmi_data,
            aes(factor(year),Emissions,fill=factor(year))) +
            geom_bar(stat="identity") +
            scale_fill_brewer(palette="Dark2")+
            theme_bw() + guides(fill=FALSE)+
            facet_grid(.~type) + 
            labs(title=expression("Total PM"[2.5]*" Emissions, Baltimore (1999 ~ 2008) by Source")) +
            labs(x="Year") + 
            labs(y=expression("PM"[2.5]*" Emissions by (Tons)")) 
            

print(g)

dev.off()

