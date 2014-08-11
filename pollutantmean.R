pollutantmean<- function(directory, pollutant, id = 1:332){
  
  ## change directory
  beginningDir <- getwd()
  setwd(directory)
  
  ## read data 
  data <- data.frame()
  for (i in id)
  {
    fileName <- sprintf("%03d", i)
    fileName <- paste(fileName, ".csv", sep="")
    input <- read.csv(fileName)
    data <- rbind(data,input)
    ##print(fileName)
  }
  
  ## reset working directory
  setwd(beginningDir)
  
  ## calculate mean  
  #part1: strip NA
  badData <- is.na(data[,pollutant])
  
  # return result
  mean(data[!badData,pollutant])
  
}
  