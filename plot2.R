#####
## This R script produces the .png file (plot2.png)
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
# otherwise the plot is generated

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
    # convert the datetime variable into POSIXlt data type
    plotData$datetime <- as.POSIXlt(plotData$datetime,format = '%d/%m/%Y %H:%M:%S')
    
    #open the png file device (480x480 pixels)
    png('plot2.png',width = 480, height = 480, units = 'px')
    
    #plot a line graph of the datetime vs. Global_active_power
    with(plotData
         ,plot(datetime,Global_active_power
               ,type='l'
               ,xlab=''
               ,ylab='Global Active Power (kilowatts)'
               )
    )
    
    # close the active device
    dev.off()
}