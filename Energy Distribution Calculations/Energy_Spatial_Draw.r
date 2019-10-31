library(raster)
 
#an example raster from the raster package
#this would be analagous to the energy potential raster you get from your group
r <- system.file("external/test.grd", package="raster")
plot(r)
 
#make a raster defining the desired inclusion probabilities 
#for the all locations available for sampling
probrast<-r

#inclusion probability for cells with value >=400 
#will be 10 times that for cells with value <400
## would probably skip this step unless there are real reasons to make the probabilities categorical like this
## DEFINITELY make sure areas with no potential are 0 
probrast[r>=400]<-10 
probrast[r<400]<-1

#normalise the probability raster by dividing 
#by the sum of all inclusion weights:
probrast<-probrast/sum(getValues(probrast), na.rm=T)

#plot the raster of inclusion probabilities
plot(probrast)

 ### get all the values in your probability raster as a vector 
 x<-getValues(probrast)
 #set NA cells in raster to zero
 x[is.na(x)]<-0
 
 ### sample from a list of cell IDs from 1:totala cells in raster -- size is number in sample, and prob is the probability of selecting any cell (values from probrast)
 samp<-sample(nrow(probrast)*ncol(probrast), size=100, prob=x)
 
## make a new raster to see what you sampled 
 samprast<-probrast
 
 ## brakets say turn all the cell IDs identified by 'samp' into 1
 samprast[samp]<-1 
 
 ## see how the sampled raster compares to the prob raster
 plot(samprast)
 s <- stack(probrast,samprast)
 plot(s)

 ### this will check to see how many cells from your sample you need to make your energy target
 ## set threshold for TWh needed
 thresh <- 30000
 
 ### get the values from your energy potential map
 v <- getValues(r)
 
 ## subset those values according to your sample
 v <- v[samp]
 
 ## get a running total of summed energy delivered
 v.sum <- cumsum(v)
 
 ## check to see where in your sample you achieve the target
 stop <- min(which(v.sum>thresh))
  
 ### make a new raster for final selected cells
 selectrast<-r
 
 ### set all cells in your sample (up to where you achieve energy target to 1)
 selectrast[samp[1:stop]]<-1 
  
## see how it all looks!
plot(selectrast)
s2 <- stack(probrast,samprast,selectrast)
plot(s2)
  
  

  
  
  

  
 
