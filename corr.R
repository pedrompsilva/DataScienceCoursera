
corr <- function(directory, threshold = 0){
  
    ## inits
    correlation <- vector()
    
    ## select files to be read  
    sample <- complete(directory)
    
    ##filter samples with more that <threshold> observations
    sample <- subset(sample, sample$nobs > threshold) 
    
    
    ## Loop through samples
    for(idx in sample$id){
      
      ##assemble file name and read data from file
      fileName <-paste0("./", directory, "/", sprintf("%03d",idx),".csv")    
      
      fileData <- read.table(fileName, 
                             header=TRUE, 
                             sep=",", 
                             quote = "\"", 
                             colClasses = c("factor","numeric","numeric","numeric"))

      recsOK <- subset(fileData, complete.cases(fileData))
      correlation <- rbind(correlation, cor(recsOK$nitrate,recsOK$sulfate))
    }
    correlation
}