## Take the output from Progenesis directly  and get the dataframe to be plotted.

Sep.mz.data<-function(dataframe, wid.=250){
  
  names(dataframe)<-c("index","m.z","RT.min","RT.window","Mass","Charge","CV","Abundance","X","XX","XXX","note")
  
  sep<-ceiling(((range(dataframe$Mass)[2]-range(dataframe$Mass)[1])/wid.))
  list<-list()
  tol.ab<-NULL
  
  for(i in 1:sep){
    left<-range(dataframe$Mass)[1]+(i-1)*wid.
    right<-range(dataframe$Mass)[1]+i*wid.
    sub<-subset(dataframe, Mass>=left & Mass<right)
    tol.AB<-sum(sub$Abundance)
    tol.ab<-c(tol.ab, tol.AB)
    list[[i]]<-sub
  }
  
  ## determine the plot boundary
  from<-round(range(dataframe$Mass)[1]/wid., 0)*wid.
  to<-from+sep*wid.
  boundary<-seq(from, to, by=wid.)  ## so the lower boundary is "from", and upper is "to"
  
  mid<-NULL
  for(j in 1:(length(boundary)-1)){
    mid0<-(boundary[j]+boundary[j+1])/2
    mid<-c(mid, mid0)
  }
  
  to.plot<-data.frame("Mass"=mid, "Abundance"=tol.ab)
  return(to.plot)
}
  