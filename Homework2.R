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
is.even <- function(x) x %% 2 == 0 
for (i in 20:10){
  if (is.even(i)){
    print(i)
  }
}

#### 3 ####
#primer numbers: I can't do any better than this internet answer
is.prime <- function(num) {
  if (num == 2 | num == 1) {
    TRUE
  } else if (any(num %% 2:(num-1) == 0)) {
    FALSE
  } else { 
    TRUE
  }
}

is.prime(1)
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
  # Have three possible lines: 
  line1 <- c(rep('*', w, '\n'))
  BLANK <- c(rep(' ', w-2))
  line2 <- c('*', BLANK, '*')
  if ((nchar(m) > w-2) | h < 3) {
    print("Your box size is too small for your text! Try again.")
  } else {
    line3 <- c('*')
    #print first line
    cat(noquote(line1),"\n")
    # now print the middle line h-2 times
    for (i in 1:(h-2)){
      cat(noquote(line2), "\n")
  }
  # print bottom line
  cat(noquote(line1),"\n")
  }
}

#messagebox(width, height, message)
messagebox(2,2,"hello")

