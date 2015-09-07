# Load functions
source("./02Scripts/yEdGraphpml.R")

# Parse XML
result <- readGraphmlFiles()

#select(distinct(result, filename), filename)

# Create date for filename
date <- substr(gsub("-", "", Sys.Date()), 3, 10)

# Store XLSx
write.xlsx(result, paste("./03Output/", date, "_Process Artifact Overview.xlsx", sep = ""))
# Store CVS
write.csv(result, paste("./03Output/", date, "_Process Artifact Overview.csv")) 

# Create barplots showing the complexity of processes



