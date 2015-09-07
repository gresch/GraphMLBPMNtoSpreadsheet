###########################
# Init
###########################

# Constants
c_JAVA_HOME         <- "C:\\Program Files\\Java\\jre1.8.0_45" # Java is needed for the xlsx package
c_path_to_graphml   <- "./01Data/"                            # Directory to the 'graphML' files, Recursion is available
c_path_to_output    <- "./03Output/"                          # Directory for the output files
c_name_of_output    <- "Process Artifact Overview"            # Name for the output files

# Load functions
source("./02Scripts/yEdGraphpml.R")



###########################
# Retrieve BPMN elements 
# from graphML files
###########################

# Parse GraphML
result <- readGraphmlFiles(c_path_to_graphml)



###########################
# Store XLSx and CSV
###########################

# Create date for filename
date <- substr(gsub("-", "", Sys.Date()), 3, 10)
# Store XLSx
write.xlsx(result, paste(c_path_to_output, date, "_", c_name_of_output, ".xlsx", sep = ""), row.names = FALSE)
# Store CVS
write.csv(result, paste(c_path_to_output, date, "_" , c_name_of_output, ".csv", sep = ""), row.names = FALSE) 
