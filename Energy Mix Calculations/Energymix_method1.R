###### Using only 10 draws as an example to see if this works:

# set up a results data frame to write successful results to (using 10 for trial purposes)
results <- data.frame(matrix(ncol=7,nrow=10))

## set a counter variable
x <-1 

## set up a repeater function so it goes until a condition is met
repeat({
  
  ## sample integer between 0 and 100 -- if certain energy sources have limits can define the range in the sample() function
  ## e.g. if solar has to be between 10 and 30% can do solar<-sample(10:30,1)
  cc <- sample(0:10,1)
  s <- sample(0:50,1)
  w <- sample(0:20,1)
  sw <- sample(0:30,1)
  g <- sample(0:30,1)
  b <- sample(0:40,1)
  n <- sample(0:40,1)
  
  ## find the sum of the mix
  s <- c(cc, s, w, sw, g, b, n)
  ssum <- sum(s)
  
  ## write the mix if it equals 100
  if (ssum==100){
    results[x,1:7]<-s
    
    ## increase the counter to keep track of successful mixes
    x<-x+1}
  
  ## break after 100 mixes written
  if (x>10){
    break}
  
})