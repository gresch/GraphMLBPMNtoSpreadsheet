# Set the correct path to Java
Sys.setenv(JAVA_HOME="C:\\Program Files\\Java\\jre1.8.0_45")

# load libraries
library(XML)
library(rJava)
library(xlsx)


library(dplyr)
library(ggplot2)
library(ggthemes)


##################################
## Read files
##################################

readGraphmlFiles <- function() {
  path = "./01Data/"
  out.file <- ""
  file.names <- dir(path, pattern =".graphml", recursive=T)
    
  for(i in 1:length(file.names)){
    # Get information from the filename
    data <- xmlParse(paste(path, file.names[i], sep=""))
    # Parse xml and build data frame
    file <- data.frame(
      filename=file.names[i],
      name=xpathSApply(data,"//y:GenericNode/y:NodeLabel[1] | //y:GenericGroupNode/y:NodeLabel[1]",xmlValue, trim=TRUE), 
      type=xpathSApply(data,"//y:GenericNode/y:StyleProperties/y:Property[@class='com.yworks.yfiles.bpmn.view.BPMNTypeEnum'] | //y:GenericGroupNode/y:StyleProperties/y:Property[@class='com.yworks.yfiles.bpmn.view.BPMNTypeEnum']", xmlGetAttr, 'value')
    )
    
    out.file <- rbind(out.file, file)  
  }
  
  # set type to class factor
  #out.file$type <- as.factor(out.file$type)
  
  # remove NAs 
  out.file <- out.file[is.na(out.file$filename)==0,]
  
  return (out.file)
}


