# The "filenames" function creates a vector containing the names of files of all the stations requested
filenames<-function(id){
         for(i in seq_along(id)) {
                 
                 # The file name has three digits.
                 if(id[i]<10 & id[i]>0){ # for the 1-digit id numbers (1 to 9)
                         filename<-paste("00",id[i],".csv",sep="")
                 }
                 else if(id[i]<100 & id[i]>=10){ # for the 2-digit id numbers (10 to 99)
                         filename<-paste("0",id[i],".csv",sep="")
                 }
                 else{ # for the 3-digit id numbers (100 to 332)
                         filename<-paste(id[i],".csv",sep="")
                 }
                 
                 
                 # The loop enters the file names in a list
                 if(i==1){ # for the first file of the list
                         fnList<-list(filename)
                 }
                 else{ # for the next files...
                         fnList<-list(fnList,filename)
                 }
         }
         # The list is turned into a vector
         fnVector<-unlist(fnList) 
}

 # A loop open files one by one and fills a matrix with the data on complete cases per station
 complete<-function(directory,id=1:332){
         
         fileNames<-filenames(id) # We ask the filenames function to give us a vector of all the file names
         oldDir<-getwd() # The working directory must be the directory containing the data folder
         newDir<-paste(oldDir,"/",directory,sep="")
         setwd(newDir) # We set the working directory to the data folder itself
         
         nrComplete_Stations<-matrix(,ncol=2,nrow=length(id)) # We create an empty matrix of the right size
         for(i in seq_along(id)){ # A loop opens the files and fills the matrix
                 data<-read.csv(fileNames[i])
                 nrComplete_Stations[i,1]<-id[i]
                 nrComplete_Stations[i,2]<-sum(complete.cases(data))
         }
         setwd(oldDir)
         nrComplete_Stations<-as.data.frame(nrComplete_Stations)
         names(nrComplete_Stations)<-c("id","nobs")
         print(nrComplete_Stations,row.names=FALSE)
 }