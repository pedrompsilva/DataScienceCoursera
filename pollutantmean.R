

pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  ##init clean sample data set
  dset <- numeric()
  
  ##loop through selected source files
  for(idx in id){
    
    ##assemble file name and read data from file
    fileName <-paste0("./", directory, "/", sprintf("%03d",idx),".csv")    
    fileData <- read.table(fileName, 
                          header=TRUE, 
                          sep=",", 
                          quote = "\"", 
                          colClasses = c("factor","numeric","numeric","numeric"))
    
    #extract sample & cleanup NAs    
    sample <- fileData[pollutant]
    NA_Recs <- is.na(fileData[pollutant])
    
    ##append results to clean dataset 
    dset <- c(dset, sample[!NA_Recs])
    
  } 

  ##calculate mean & print result
  m <- mean(dset)
  print(m)
      
}