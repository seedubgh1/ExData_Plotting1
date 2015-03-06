#####
## This R script produces the .png file (plot4.png)
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
    # read the file
    plotData <- read.csv(file=fileNm
                         #,colClasses=c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric','character')
                         ,stringsAsFactors=FALSE
                        )
    # convert the datetime variable into POSIXlt data type
    plotData$datetime <- as.POSIXlt(plotData$datetime,format = '%d/%m/%Y %H:%M:%S')
    
    # open the png file device
    png('plot4.png',width = 480, height = 480, units = 'px')
    
    # set the device to plot several panes, in this case 2x@
    par(mfcol=c(2,2))
    
    # plot datetime vs Global_active_power
    with(plotData,
         plot(datetime,Global_active_power
              ,type='l'
              ,xlab=''
              ,ylab='Global Active Power'
              )
    )
    
    # plot datetime vs Global_active_power (same as plot3.R)
    with(plotData,{
         plot(datetime, Sub_metering_1
              ,type='l'
              ,xlab=''
              ,ylab='Energy sub metering'
              ,col='black'
              )
         lines(datetime, Sub_metering_2, col='red')
         lines(datetime, Sub_metering_3,type='l', col='blue')
         legend('topright'
                ,legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
                ,lty=c(1,1,1)
                ,col=c('black','red','blue')
                ,bty='n'
         )
    }
    )
    
    # plot datetime vs Voltage
    with(plotData,
        plot(datetime,plotData$Voltage
             ,type='l'
             ,ylab='Voltage'
             ,xlab='datetime')
    )
    
    # plot datetime vs Global_reactive_power
    with(plotData,
        plot(datetime,Global_reactive_power
         ,type='l'
         ,ylab='Global_reactive_power'
         ,xlab='datetime')
    )
    
    #close the active device
    dev.off()
}