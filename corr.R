find.ID.aboveThr<-function(directory,threashold){
        complete(directory)
        nrComplete_aboveThr<-nrComplete_Stations[nrComplete_Stations>threashold]
        ID.aboveThr<-nrComplete_aboveThr$obs
}

corr<-function(directory,threashold=0){
        
        oldDir<-getwd() # The working directory must be the directory containing the data folder
        newDir<-paste(oldDir,"/",directory,sep="")
        setwd(newDir) # We set the working directory to the data folder itself
        
        fileNames<-find.ID.aboveThr(directory,threashold)
        corrVector<-rep(NA,length(ID.aboveThr))
        for(i in seq_along(ID.aboveThr)){
                data<-read.csv(fileNames[i])
                corrVector[i]<-cor(data$sulfate,data$nitrate)
        }
        setwd(oldDir)
        corrVector
}