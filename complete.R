complete <- function(directory, id=1:332){
  
  ## change directory
  beginningDir <- getwd()
  setwd(directory)
  
  ## read data 
  nobs <- c()
  for (i in id)
  {
    fileName <- sprintf("%03d", i)
    fileName <- paste(fileName, ".csv", sep="")
    input <- read.csv(fileName)
    ans <- sum(complete.cases(input))
    nobs <- c(nobs,ans)
    ##print(fileName)
  }
  
  ## reset working directory
  setwd(beginningDir)
  
  ## format final output 
  data.frame(id,nobs)
}