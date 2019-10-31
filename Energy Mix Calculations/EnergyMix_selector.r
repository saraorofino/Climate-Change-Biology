## set up a results data frame to write successful results to
results <- data.frame(matrix(ncol=7,nrow=10))

## set a counter variable
x <-1 

## set up a repeater function so it goes until a condition is met
repeat({

## sample integer between 0 and 100 -- if certain energy sources have limits can define the range in the sample() function
## e.g. if solar has to be between 10 and 30% can do solar<-sample(10:30,1)
a <- sample(0:10,1)
b <- sample(0:50,1)
c <- sample(0:20,1)
d <- sample(0:30,1)
e <- sample(0:30,1)
f <- sample(0:40,1)
g <- sample(0:40,1)

## find the sum of the mix
s <- c(a,b,c,d,e,f,g)
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

## write the mixes to a file 
write.csv(results, "some_file.csv",row.names=FALSE)

# end