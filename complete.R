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

# The "masterdatafile" function creates a data frame containing the data from all the stations requested
masterdatafile<-function(directory,id) {
        fileNames<-filenames(id) # We call the fileNames function that we have just created
        oldDir<-getwd() # The working directory must be the directory containing the data folder
        newDir<-paste(oldDir,"/",directory,sep="")
        setwd(newDir) # We set the working directory to the data folder itself
        
        # A loop opens the first file, and then appends all the following files
        for(i in seq_along(fileNames)){
                data<-read.csv(fileNames[i])
                if(i==1){
                        pollution<-data
                }
                else{
                        pollution<-rbind.data.frame(pollution,data)   
                }
        }
        setwd(oldDir)
        pollution
}

# The complete function counts the number of complete observation from the selected stations
complete<-function(directory,id=1:332){
        data<-masterdatafile(directory,id) # We call the masterdatafile function that we have just created
        
}