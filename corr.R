corr <- function(directory,threshold=0){
  
  ## change directory
  beginningDir <- getwd()
  setwd(directory)
  
  numFiles <- 332
  corrVector <- numeric()
  for (i in 1:numFiles)
    {
    ## first calculate number of complete record 
    fileName <- sprintf("%03d", i)
    fileName <- paste(fileName, ".csv", sep="")
    input <- read.csv(fileName)
    ans <- sum(complete.cases(input))
    
    if (ans > threshold) 
     {
       ## calculate correlation when number of observation > threshold
      goodData <- complete.cases(input)
      corr <- cor(input[goodData,"nitrate"], input[goodData,"sulfate"])
      corrVector <- c(corrVector,corr)
       
     }
    
    }
  ## reset working directory
  setwd(beginningDir)
  ## return answer 
  corrVector 
}