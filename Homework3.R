#### 1 ####
# I don't get it. Why not just have a database? This looks like info for a database. Databases are easy to manipulate!!

# Implement a cat class, complete with race and print methods.
tubby <- list(length=15, weigth=12, breed='barn cat', colour='black')
class(tubby) <- 'cat'

new.cat <- function(weight, breed, name){
  if (breed == "house cat"){
    speed <- 4
  }
  if (breed == "barn cat"){
    speed <- 3
  }
  if (breed == "alley cat"){
    speed <- 2
  }
  if (breed == 'jaguar'){
    speed <- 1
  }
  output <- list(weight=weight, breed=breed, speed=speed, name=name)
  class(output) <- "cat"
  return(output)
}



# class method: function that just uses a class
race <- function(first, second, third){
  # checking to see if these are classes of object dog: is first is of class dog and is second of class dog
  if(!inherits(first, "cat") | !inherits(second, "cat") |!inherits(third, 'cat')){
    # stop just stops it so you can raise an error
    stop("You haven’t given me three felines!")
  }
  feline.speed <- c(first$speed, second$speed, third$speed)
  names(feline.speed) <- c(first$name, second$name, third$name)
  felineorder <- sort(feline.speed, decreasing=FALSE)
  #print(felineorder[3])
  cat(names(felineorder[1]), "is the winner", '\n')
  cat(names(felineorder[2]), "came in second", '\n')
  cat(names(felineorder[3]), "is the loser. If this is your cat, get a real cat. Better yet, get a dog!", '\n')
}

Tubby <- new.cat(weight= 15, breed= "barn cat", name="Tubby")
Barney <- new.cat(weight= 8, breed="alley cat", name="Barney")
Felix <- new.cat(weight= 50, breed= 'jaguar', name="Felix")
race(Tubby, Barney, Felix)

#### 2 ####
# Implement a point class that holds x and y information for a point in space.

