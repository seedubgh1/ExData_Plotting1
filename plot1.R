#####
## This R script produces the .png file (plot1.png)
## to satify the requirement for 'plot 1'.
##
## NOTE: The script requires that the file 'plotData.csv' resides
## in the current directory.  The file includes only the
## data required for the plots.  The file can be found in the github
## repository associated with this assignment.
##
#####

## remove objects from the global environment to
## conserve memory
rm(list=ls())

# save the file name to a variable
fileNm <- 'plotData.csv'

# determine if the file is in the current working directory
# if the file is not found, a warning message is displayed
# otherwise the plot is generated.

if(!file.exists(fileNm)){
    warning('plotData.csv does not exist.')
    
}else {
    #read the file
    plotData <- read.csv(file=fileNm
                         #,colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric','character')
                         ,stringsAsFactors=FALSE
                        )
    #open the png file device (480x480 pixels)
    png('plot1.png',width = 480, height = 480, units = 'px')
    
    # draw a histogram of the Global_active_power variable,
    # label axes as per requirements
    hist(plotData$Global_active_power,xlab='Global Active Power (kilowatts)',col='red'
         ,main='Global Active Power')
    
    # close the active device
    dev.off()
}