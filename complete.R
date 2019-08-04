

complete <- function(directory, id = 1:332){
  
  result <- data.frame(id = numeric() , noobs = numeric())
  
  
    ##loop through selected source files
  
  for(idx in id){
    
    
    
    ##assemble file name and read data from file
    fileName <-paste0("./", directory, "/", sprintf("%03d",idx),".csv")    

    fileData <- read.table(fileName, 
                           header=TRUE, 
                           sep=",", 
                           quote = "\"", 
                           colClasses = c("factor","numeric","numeric","numeric"))
    
  
 
    rowsOK <- complete.cases(fileData)
    sample <- fileData[rowsOK,]
    
    nrecs = NROW(sample)
    
    result <- rbind(result, c(idx, nrecs))
    colnames(result) <- c("id", "nobs")  
    
    
    
  } 
  result
  
}