find.ID.aboveThr<-function(directory,threashold){
        capture.output(df.nrComplete<-complete(directory)) #table of the stations and the corresponding number of complete observations.
        aboveThr<-df.nrComplete$nobs>threashold #logical vector signalling the stations with a nr of complete obs above threashold
        df.mostComplete<-df.nrComplete[aboveThr,] #above threashold subset
        ID.aboveThr<-df.mostComplete$id #vector with the IDs of the selected stations
}


corr<-function(directory,threashold=0){
        fileNrs<-find.ID.aboveThr(directory,threashold)
        fileNames<-filenames(fileNrs)
        corrVector<-rep(NA,length(fileNames))        
        oldDir<-getwd() # The working directory must be the directory containing the data folder
        newDir<-paste(oldDir,"/",directory,sep="")
        setwd(newDir) # We set the working directory to the data folder itself
        for(i in seq_along(fileNames)){
                data<-read.csv(fileNames[i])
                comp<-complete.cases(data) #logical vector signalling the complete rows
                compdf<-data[comp,] #complete rows subset
                corrVector[i]<-cor(compdf$sulfate,compdf$nitrate)
        }
        setwd(oldDir)
        corrVector
}