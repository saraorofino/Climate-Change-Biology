##### Using only 10 draws as an example to see if this works:

## set up a results data frame to write successful results to (using 10 for trial purposes)
results2 <- data.frame(matrix(ncol=7,nrow=10))

## set a counter variable
x <-1 

## set up a repeater function so it goes until a condition is met
repeat({
  
  # Set range values for each type of energy:
  #### Carbon Capture 0-10
  minVal_cc <- 0
  maxVal_cc <- 10
  count <- 1
  mn_cc <- (maxVal_cc + minVal_cc)/2
  sd_cc <- (maxVal_cc-minVal_cc)/3  ### increase or decrease this denominator to adjust the shape of the distribution -- larger denominator will be narrower distribution (more values closer to mean)
  
  cc <- rnorm(count, mean = mn_cc, sd = sd_cc)
  
  #get rid of values outside the range if you want -- and round to integer
  cc[cc<minVal_s]<- minVal_cc
  cc[cc>maxVal_s]<- maxVal_cc
  cc <- round(cc, digits=0)
  
  #### Solar 5-25
  minVal_s <- 5
  maxVal_s <- 25
  count <- 1
  mn_s <- (maxVal_s + minVal_s)/2
  sd_s <- (maxVal_s-minVal_s)/3  ### increase or decrease this denominator to adjust the shape of the distribution -- larger denominator will be narrower distribution (more values closer to mean)
  
  s <- rnorm(count, mean = mn_s, sd = sd_s)
  
  #get rid of values outside the range if you want -- and round to integer
  s[s<minVal_s]<- minVal_s
  s[s>maxVal_s]<- maxVal_s
  s <- round(s, digits=0)
  
  #### Wind 20-50
  minVal_w <- 20
  maxVal_w <- 50
  count <- 1
  mn_w <- (maxVal_w + minVal_w)/2
  sd_w <- (maxVal_w-minVal_w)/3  ### increase or decrease this denominator to adjust the shape of the distribution -- larger denominator will be narrower distribution (more values closer to mean)
  
  w <- rnorm(count, mean = mn_w, sd = sd_w)
  
  #get rid of values outside the range if you want -- and round to integer
  w[w<minVal_w]<- minVal_w
  w[w>maxVal_w]<- maxVal_w
  w <- round(w, digits=0)
  
  #### Solar/Wind colocation 5-10
  minVal_sw <- 5
  maxVal_sw <- 10
  count <- 1
  mn_sw <- (maxVal_sw + minVal_sw)/2
  sd_sw <- (maxVal_sw-minVal_sw)/3  ### increase or decrease this denominator to adjust the shape of the distribution -- larger denominator will be narrower distribution (more values closer to mean)
  
  sw <- rnorm(count, mean = mn_sw, sd = sd_sw)
  
  #get rid of values outside the range if you want -- and round to integer
  sw[sw<minVal_sw]<- minVal_sw
  sw[sw>maxVal_sw]<- maxVal_sw
  sw <- round(sw, digits=0)
  
  #### Geothermal 15-35
  minVal_g <- 15
  maxVal_g <- 35
  count <- 1
  mn_g <- (maxVal_g + minVal_g)/2
  sd_g <- (maxVal_g-minVal_g)/3  ### increase or decrease this denominator to adjust the shape of the distribution -- larger denominator will be narrower distribution (more values closer to mean)
  
  g <- rnorm(count, mean = mn_g, sd = sd_g)
  
  #get rid of values outside the range if you want -- and round to integer
  g[g<minVal_g]<- minVal_g
  g[g>maxVal_g]<- maxVal_g
  g <- round(g, digits=0)
  
  #### Biofuel 20-50
  minVal_b <- 20
  maxVal_b <- 50
  count <- 1
  mn_b <- (maxVal_b + minVal_b)/2
  sd_b <- (maxVal_b-minVal_b)/3  ### increase or decrease this denominator to adjust the shape of the distribution -- larger denominator will be narrower distribution (more values closer to mean)
  
  b <- rnorm(count, mean = mn_b, sd = sd_b)
  
  #get rid of values outside the range if you want -- and round to integer
  b[b<minVal_b]<- minVal_b
  b[b>maxVal_b]<- maxVal_b
  b <- round(b, digits=0)
  
  #### Nuclear 20-40
  minVal_n <- 20
  maxVal_n <- 40
  count <- 1
  mn_n <- (maxVal_n + minVal_n)/2
  sd_n <- (maxVal_n-minVal_n)/3  ### increase or decrease this denominator to adjust the shape of the distribution -- larger denominator will be narrower distribution (more values closer to mean)
  
  n <- rnorm(count, mean = mn_n, sd = sd_n)
  
  #get rid of values outside the range if you want -- and round to integer
  n[n<minVal_n]<- minVal_n
  n[n>maxVal_n]<- maxVal_n
  n <- round(n, digits=0)
  
  ## find the sum of the mix
  sm <- c(cc, s, w, sw, g, b, n)
  ssum <- sum(sm)
  
  ## write the mix if it equals 100
  if (ssum==100){
    results2[x,1:7]<-sm
    
    ## increase the counter to keep track of successful mixes
    x<-x+1}
  
  ## break after 10 mixes written
  if (x>10){
    break}
  
})