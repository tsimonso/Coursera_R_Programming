filenames<-function(id){
        for(i in seq_along(id)) {
                if(id[i]<10 & id[i]>0){
                        filename<-paste("00",id[i],".csv",sep="")
                }
                else if(id[i]<100 & id[i]>=10){
                        filename<-paste("0",id[i],".csv",sep="")
                }
                else{
                        filename<-paste(id[i],".csv",sep="")
                }
                if(i==1){
                        fnList<-list(filename)
                }
                else{
                        fnList<-list(fnList,filename)
                }
        }
        fnVector<-unlist(fnList)
}

masterdatafile<-function(directory,id) {
        fileNames<-filenames(id)
        oldDir<-getwd()
        newDir<-paste(oldDir,"/",directory,sep="")
        setwd(newDir)
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

pollutantMean<-function(directory,pollutant,id=1:332){
        data<-masterdatafile(directory,id)
        if(pollutant=="nitrate"){
                mean(data$nitrate,na.rm=TRUE)
        }
        else if(pollutant=="sulfate"){
                mean(data$sulfate,na.rm=TRUE)
        }
}