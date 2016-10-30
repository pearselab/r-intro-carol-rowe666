##### 1 #####
seq(20, 10, by=-1)
# Or, if I must use a loop
x <- 20
while (x >= 10){
  print(x)
  x <- x-1
}

# Or, to avoud while loops
i <- 20
for (i in 20:10){
  print(i)
}

#### 2 ####
seq(20, 10, by=-2)

i <- 20

is.even <- function(x){
 x %% 2 == 0 }

for (i in 20:10){
  if (is.even(i)){
    print(i)
  }
}


#### 3 ####
#primer numbers: I can't do any better than this internet answer

# if (any(num %% 2:(num-1) == 0))  EXPLAINED:
# Looks any answer of 0 from range of number %% 2 to number %% (number-1).
# ie. if num <- 5, it looks for any 0 answer from: 5 %% 2, 5 %% 3, 5 %% 4  

is.prime <- function(num) {
  if (num == 2) {
    TRUE
  } else if (any(num %% 2:(num-1) == 0)) {
    FALSE
  } else { 
    TRUE
  }
}


is.prime(2)

#### 4 #####
# Write a loop that prints out the numbers from 1 to 20, printing “Good: NUMBER” if the number is
# divisible by five and “Job: NUMBER” if then number is prime, and nothing otherwise.

for (i in 1:20){
  if (i == 5){
    cat("Good Job:", i, "\n")
  }else if (is.prime(i)){
    cat("Job:", i, "\n")
  } else if (i %% 5 == 0) {
    cat("Good:", i, "\n")
  } else {
    invisible(i)
  }
}

#### 5 ####
# A biologist is modelling population growth using a Gompertz curve, which is defined as y(t) = a.e−b.e−c.t
# where y is population size, t is time, a and b are parameters, and e is the exponential function. Write
# them a function that calculates population size at any time for any values of its parameters.
Gompertz.point <- function(t, a, b, c){
  z <- a*exp(-b*exp(-c*t))
  return(z)
}

Gompertz.point(194, 20, 33, 22)

#### 6 ####
# The biologist likes your function so much they want you to write another function that plots the progress
# of the population over a given length of time. Write it for them.
# a = asymptote (where population levels off)
# b = displacement on x-axis
# c = growth rate
output <- c()

Gompert.curve <- function(start, finish, a, b, c){
  for (i in start:finish){
    to_add <- Gompertz.point(i, a, b, c)
    output <- c(output, to_add)
  }
  plotty <- plot(output, type="o", col= ifelse(output > a,'blue', ifelse(output > b, 'red', 'black')), xlab = 'Generation', ylab = 'Population Size')
  return(list(plotty, output))
}

Gompert.curve(1, 20, 280, 100, 0.4)

#### Karen's answer:
GompFun <- function (a,b,c,d) { # a,b,c, constants, d = max time
  t <- 0
  pop_vector <- 0
  time_span <- c(1:d)
  for (i in time_span) {
    t <- c(t,i) # incrementing to make a vector
    pop_size <- a*exp(-b*exp(-c*i)) # within-function variable
    pop_vector <-  c(pop_vector, pop_size) # incrementing to make a vector
  }
  plot(t, pop_vector, type = "l")
}
GompFun(.22,6,.5,10)

###### end of Karen's ######

# Graph cars using blue points overlayed by a line 
#plot(values, type="o", col="blue", xlab = 'Generation', ylab = 'Population Size')

#### 7 ####
# The biologist has fallen in love with your plotting function, but want to colour y values above a as blue,
# and y values above b as red. Change your function to allow that.
# http://stackoverflow.com/questions/11838278/plot-with-conditional-colors-based-on-values-in-r
# outout > a  col='blue'
# outout > b col='red'
# else col="black"

#See answer to #7 in #6 above

#### 8 ####
# You are beginning to suspect the biologist is taking advantage of you. Modify your function to plot in
# purple any y value that’s above a and b. Hint: try putting 3==3 & 2==2 and 3==4 | 2==2 into an if
# statement and see what you get. Using this construction may make this simpler.

#### 9 ####

# Write a function that draws boxes of a specified width and height that look like this (height 3, width 5):

sillybox <- function(w,h){
  #creating the lines to use (one with * width times and other with * at ends and blanks in middle)
  line1 <- c(rep('*', w, '\n'))
  BLANK <- c(rep(' ', w-2))
  line2 <- c('*', BLANK, '*')
  #print first line
  cat(noquote(line1),"\n")
  # now print the middle line h-2 times
  for (i in 1:(h-2)){
    cat(noquote(line2), "\n")
  }
  # print bottom line
  cat(noquote(line1),"\n")
}

sillybox(5,3)



#### 10 ####
#Modify your box function to put text centred inside the box.

#Copied the function from quest. 09 and modifying it:
# Notes: text to be centered in width, and then centered height

messagebox <- function(w,h, m){
  # line1 is top and bottom of box: 
  line1 <- c(rep('*', w, '\n'))
  #line2 is internal lines without message
  BLANK <- c(rep(' ', w-2))
  line2 <- c('*', BLANK, '*')
  # Make sure box is large enough for the message
  if ((nchar(m) > w-2) | h < 3) {
    print("Your box size is too small for your text! Try again.")
  } else {
    #print first line
    cat(noquote(line1),"\n")
    # width centering for message line: get number needed blanks
    mblanks <- w - (nchar(m))
    #determine how many blanks for left vs right side of message
    # odd number spaces: offset message to left
    leftb <- floor(mblanks/2)
    leftblank <- c(rep(' ', leftb))
    rightb <- ceiling(mblanks/2)
    rightblank <- c(rep(' ', rightb))
    # the message line
    mline <- c('*', leftblank, m, rightblank, '*') 
    # now print the middle line h-2 times
    toplines <- floor((h-3)/2)
    bottomlines <- ceiling((h-3)/2)
    for (i in 1:toplines){
      cat(noquote(line2), "\n")
    }
    cat(mline, '\n')
    for (i in 1:bottomlines){
      cat(noquote(line2), "\n")
    }
  # print bottom line
  cat(noquote(line1),"\n")
  }
}


#messagebox(width, height, message)
messagebox(21,10,"cantankerous")

#### 11 ####

#### 12 ####
# In ecology, hurdle models are often used to model the abundance of species found on surveys. They
# first model the probability that a species will be present at a site (drawn, for example, from a Bernoulli
# distribution) and then model the abundance for any species that is present (drawn, for example, from
# the Poisson distribution). Write a function that simulates the abundance of a species at n sites given a
# probability of presence (p) and that its abundance is drawn from a Poisson with a given λ. Hint: there is
# no Bernoulli distribution in R, but the Bernoulli is a special case of what distribution?...                

# NOTE: Would never have gotten this without Paul's explanation of what was wanted from the question.

# rbinom(how many random #s to generate, #Bernoulli trials, probability of success)
# rpois(how many random #s to generate, Lambda (λ) is the total number of events (k) divided by the number of units (n) in the data (λ = k/n))
# So I need to just sample one population and see if the damned thing(=It) is there:
# Then, if It exists, then simulate abundance of It (Think Stephen King; It has been seen in abundance lately)

# user inputs p, n, and lambda
get.abundance <- function(p, n, l){
if (rbinom(1, 1, p) == 1){
  abundance <- rpois(n,l)
  return(abundance)
  #return(rpois(n, l))
}else{
  print("Your species is not present")
  return(0)
}
}
#get.abundance(binom probability, number reps in poisson, poisson lambda)
get.abundance(0.1, 20, 2)

#### 13 ##############################################
# An ecologist really likes your hurdle function (will you never learn?). Write them a function that simulates
# lots of species (each with their own p and λ) across n sites. Return the results in a matrix where each
# species is a column, and each site a row (this is the standard used for ecology data in R).
 

### I am importing the input data from a csv file.

pathway <- '/Users/carolrowe/Dropbox/Carol\ folder/PearseCourse/r-intro-carol-rowe666/'
pathtofile <- paste(pathway, "speciesinput.csv", sep = '')

speciesinput <- read.csv(pathtofile, header = TRUE, as.is = TRUE)
head(speciesinput,10) 

get.abundance <- function(name, p, reps, lam){
  if (rbinom(1, 1, p) == 1){
    abundance <- rpois(reps,lam)
    info <- c(name, abundance)
    return(info)
  }else{
    print("Your species is not present")
    #lambda <- 0
    nothere <- c(name, 0)
    return(nothere)
  }
}

#get.abundance('Pteridium aquilinum', 0.5,   20,     50)
# Get dimensions from input dataframe for making a matrix: columns = # species, rows = max # reps
coldimension <- nrow(speciesinput)
rowdimension <- max(speciesinput$reps +1, na.rm = TRUE)
#create a matrix for the largest possible needed; fill with 0
outputmatrix <- matrix(data = 0, nrow = rowdimension, ncol = coldimension)

for(i in 1:nrow(speciesinput)) {
  #names(speciesinput) <- NULL
  # create a single name by merging (paste) the Genus and species
  Genus <- speciesinput[i,"Genus"]
  species <- speciesinput[i,"species"]
  name <- paste(Genus, species, sep = " ")
  #print(name)
  # get needed values from csv file and assign the values to variable names
  p <- speciesinput[i, "p"]
  reps <- speciesinput[i, "reps"]
  lam <- speciesinput[i, 'lambda']
  # Run through function to get the abundances and put result as a vector
  replicates <- c(get.abundance(name, p, reps, lam))
  #print(replicates)
  # Append to the matrix by replacing the values at the exact indeces; 0 remain as place-holders
  outputmatrix[1:length(replicates),i] <- replicates
}

# IS IT BETTER TO HAVE 0 AS A PLACEHOLDER, OR 'NA' ?
# UGH! Tried to rename the columns as row1, then you'd have to remove row1. Then, you could put the 
# values back to integers instead of characters!!!
# Why would anyone work in vectors vs dataframes??????

#colnames(outputmatrix) <- c(ouputmatrix[1,])
print(outputmatrix)
#print("next")
#print(outputmatrix[1,])











### Just some learning notes: #####
# To clean up the environment scrren:
rm(list =ls())
# To istall a package
# install.packages('gg.plot2')
# to load it for use:
# require('gg.plot2')
# for some help axamples
# borwseVignettes(package = "grid")
#to get to web page:
# browseURL('http://cran.stat.ucla.edu/web/packages/available_packages_by_name.html')
# check for updates
# update.packages()

#command ,
# str(file.scv)
# View(file.csv)