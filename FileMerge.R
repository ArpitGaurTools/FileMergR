#set working directory

#install required packages
RequiredPackages <- c("readxl","writexl","dplyr", "openxlsx")
for (i in RequiredPackages){
  if(! i %in% installed.packages()){
    install.packages(i, dependencies = TRUE)
  }
  require(i)
}


library(readxl)
library(writexl)
library(dplyr)
library(openxlsx)


myfiles=list.files(full.names = TRUE)

dataL=list()

for (i in myfiles) {
  
  extension <- tools::file_ext(i) #reads extension
  if( extension == ".csv") {temp=read.csv(i) #reads csv files
  else if( extension == ".xlsx")tem<-read.xlsx(i)} #reads excel files
  tem$source=basename(i)
  dataL[[i]]=tem  
}

CombinedData=do.call(rbind, dataL)

write.csv(CombinedData, file = "CombinedData.csv")
