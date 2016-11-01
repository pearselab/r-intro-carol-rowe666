## Some stuff to play with ##
x <- c(1, 2, 3, 4)
y <- c(5, 6, 7, 8)
z <- c("a", "b", 9)
p <- matrix(1:16, nrow=4, ncol=4)
d <- matrix(20:39, nrow=4, ncol=5) 
q <- matrix(40:59, nrow=5, ncol=4)
ZZ <- matrix(70:89, nrow=4, ncol=5)

######## CAT #################
help(cat)
# cat lets you mix objects and text: like python print "the value of x is {0}" .format(x)
# can not replace cat with print in the examples below. Apparently, no mixing objects and text with print.
cat("The value of variable a is ", a, "\n")
cat("The mean of z is:", mean(z), "\n")

####### CBIND ################
help(cbind)
# combines the vectors as columns, need matching row length
# BEWARE combining different data types such as char and int
# BEWARE when combing different lengths; it'll do it with repetition!!!!!!! YIKES!
cbind(x, y)
cbind(y, z)
cbind(p,q) # ERROR, size of matrices must match
cbind(d, ZZ)

###### RBIND ###############
#rbind
# combines the vectors as rows, need matching column length
rbind(x, y)
rbind(y, z)  # WARNING, but joins then...likely not the way you want to!
cbind(p,q) # ERROR, size of matrices must match
cbind(d, ZZ)

######## COL, ROW ################
# until I have to use this, I have no idea what the point is!
help(col)
col(ZZ, as.factor = TRUE)
col(ZZ)
ZZ[row(ZZ) == col(ZZ) + 1]
row(ZZ)

######## CUT ################
# This is frustrating. Give us a dataset and have us do things to it to learn commands. Commands on their own aren't all that helpful.
help(cut)
# Nice youtube.com video of this: https://www.youtube.com/watch?v=EWs1Ordh8nI
#Take a heights column and cut it into intervals: A<=50, B=50-55, C=55-60, 
# D=60-65, E=65-70,F=70+
# you must set lower and upper bounds: 0, 100 in this case
#default: left-open, right-closed. Meaning borders go to the left interval.
#Thus, 60 will go into the 55-60 category.
# Making a height out of bounds to see what happens: <NA>
# right=FALSE (whether or not rt closed) added to end of CatHeight variable will make it right-open, left-closed. Now, 60 goes to 60-65 category
#youtube.com     MarinStatsLectures
Height <- c(62.1, 74.7, 69.7, 71.0, 56.9, 58.7, 63.3, 70.4, 70.5, 59.2, 50, 100, 101)
CatHeight <- cut(Height, breaks=c(0, 50, 55, 60, 65, 70, 100), labels=c('A', 'B', 'C', 'D', 'E', 'F'))
RtFalseCatHeight <- cut(Height, breaks=c(0, 50, 55, 60, 65, 70, 100), labels=c('A', 'B', 'C', 'D', 'E', 'F'), right=FALSE)
Height
CatHeight
RtFalseCatHeight
# Let R choose break pts. You choose the number of breaks you want.
FourCatHeight <- cut(Height, breaks=4)
FourCatHeight

###### DIFF #####################
# differences = 2  is same as diff(diff(myvect)) so on and so forth for number of differences
myvect <- c(2, 4, 6, 8, 10)
sect <- c(100, 20, 200, 50)
rev(sect)
# takes the difference between censecutive numbers in vector: 4-2, 6-4, 8-6, 10-8
diff(myvect)
# takes the difference between censecutive numbers in vector: 20-100, 200-20, 50-200
diff(sect)
# where diff = 2 you are taking the diff and then the diff of that diff:
# 1st diff was: -80, 180,-150. Now take the diff of those: 180 - neg80, neg150 - 180 = 260, -330
diff(sect, differences = 2)
# you get the idea
diff(myvect, differences = 3) 

#######  DIM  , DIMNAMES #########
# http://www.endmemo.com/program/R/dim.php
# dim() function gets or sets the dimension of a matrix, array or data frame.
dim(x) # NULL, not a matrix, array, or df
dim(p) # 4 4
rownames(p) <- c('R1', 'R2', 'R3', 'R4')
colnames(p) <- c('C1', 'C2', 'C3', 'C4')
p
dimnames(p) # OH, how sweet is that?! Gives row and column names

##### ROWNAMES,  COLNAMES,   NAMES #############
# give row/column names to vecotr,df, array
rownames(p) <- c('R1', 'R2', 'R3', 'R4')
colnames(p) <- c('C1', 'C2', 'C3', 'C4')
p
# names gives a name to each elemnt in vector, matrix, etc.
names(x) <- c("Name1", "AnotherName", "YetAnother", "AndAnother")
x
names(d) <- c("A1", 'A2', 'B1', 'B2') #Fills in NA. This names each and every element in the whole matrix!
d

##### EXPAND.GRID ###########
# http://www.endmemo.com/program/R/expand_grid.php
# expand.grid() function creates a data frame from all combinations of the supplied vectors or factors.
# expand.grid(..., KEEP.OUT.ATTRS = TRUE, stringsAsFactors = TRUE)
# 
# ...: vectors, factors or a list containing these
# KEEP.OUT.ATTRS: a logical indicating the "out.attrs" attribute (see below) should be computed and returned
# stringsAsFactors: logical specifying if character vectors are converted to factors
# ... 

# kind of like python's itertools to get all combinations of selected vectors, but then puts into a df
height <- c(64, 56, 59)
weight <- c(160, 120, 140)
sex <- c("M","M","F")
expand.grid(height,weight,sex)
expand.grid(height, weight)


#######  eigen, %*%, lower.tri, upper.tri, diag   ###########################
#######  (try ?"%*%", not ?%*%, as this is an operator, and document  #######
######## the function, not the maths   #####################################

# matrix is square and symmetric, which guarrantees that the eigenvalues, λiλi are real numbers


# http://www.endmemo.com/program/R/eigen.php
# eigen() function calculates eigenvalues and eigenvectors of matrices.
# 
# eigen(x, symmetric, only.values = FALSE, EISPACK = FALSE)
# 
# x: matrix
# symmetric: if TRUE, the matrix is assumed to be symmetric (or Hermitian if complex) and only its lower triangle (diagonal included) is used. If symmetric is not specified, the matrix is inspected for symmetry
# only.values: if TRUE, only the eigenvalues are computed and returned, otherwise both eigenvalues and eigenvectors are returned
# EISPACK: logical. Should EISPACK be used (for compatibility with R < 1.7.0)?

## I haven't a clue what's going on. This will take lots of reading to understand.
eigen.p <- eigen(p)
eigen.p
eigen.p[1] # this is the eigen values ## Or can call by: eigen.p$values
eigen.p$values
eigen.p[2] # this is the vecotr ## Or can call by: eigen.p$vectors
eigen.p$vectors
lowp <- lower.tri(p) # lower half, NOT including diagonal itself, is TRUE (else = FALSE)
upperp <- upper.tri(p) # upper half, NOT including diagonal itself, is TRUE
lowp
upperp
lower.tri(d) # Here's a non-square matrix. Diagonal from R1C1 is FALSE there and above
lost <- eigen(p %*% p)
lost
## C'mon already. I have no idea..... can't find much anything. Have to take a course now to learn eigen?
# reallylost <- eigen(p ?"%*%" p)
# reallylost
# evenmorelost <- eigen (p not ?%*% p)
# evenmorelost

########### GL  generate levels ###############
# http://www.endmemo.com/program/R/gl.php
# Using the endmemo...much more useful than the R help!
# gl() function generates factors by specifying the pattern of their levels.
# 
# gl(n, k, length = n*k, labels = 1:n, ordered = FALSE)
# 
# n: number of levels
# k: number of replications
# length: length of the result
# labels: labels for the resulting factor levels
# ordered: whether the result sould be ordered or not
gl(3,2,labels = c("green","red","yellow")) # up to 3 levels: in this case green, yellow, red, with 3 repeats

# Well, here's an example of it in use:
# http://www.r-tutor.com/elementary-statistics/analysis-variance/factorial-design
#gl(‘up to’, ‘with repeats of’, ‘to total length’)
gl(4, 4, labels= c('L1', 'L2', 'L3', 'L4'))

####### IDENTICAL #############
# finds if they match
a <- c(1,2,3)
b <- c(1,2,4)
c <- c(1,2,3)
identical(a,b)
identical(a,c)
identical(0,-0) # True
phrase1 <- "The quick, sly fox jumped over the lazy brown dog."
phrase2 <- "Thequick, sly fox jumped over the lazy brown dog."
phrase3 <- "The quick, sly fox jumped over the lazy brown dog."
identical(phrase1, phrase2) #FALSE
identical(phrase1, phrase3) # TRUE
identical(phrase1, phrase2, phrase3) # NO, can not compare more than two
# Oooh, check this out:
sapply(list(phrase1, phrase2, phrase3), FUN = identical, phrase1)

##### IMAGE ########




################################################
## Bonus exercises #############################
################################################

bonus.text <- "It was the best of times, it was the worst of times, it was the age of
wisdom, it was the age of foolishness, it was the epoch of belief, it
was the epoch of incredulity, it it was the season of Light, it was the
season of Darkness, it was the spring of hope, it was the winter of
despair, we had everything before us, we had nothing before us, we
were all going direct to Heaven, we were all going direct the other
way- in short, the period was so far like the present period, that
some of its noiosiest authorities insisted on its being received, for
good or for evil, in the superlative degree of comparison only."

# all instances of "the" - assume you mean The THE the etc.
help(grep)
grep ('the', bonus.text, ignore.case = TRUE)

#Below - excellent function from stackoverflow web - even uses sapply and mapply
# http://stackoverflow.com/questions/19666965/count-pattern-matching-in-r
lowtale.two <- tolower(tale.two)
count.matches <- function(pat, vect) {
  regoutput <- sapply(regmatches(vect, gregexpr(pat, vect)), length)
}
the.counts <- mapply(count.matches, c("\\<the\\>"), list(lowtale.two))
cat("The nunber of 'the' matches in intro to 'Tale of Two Cities' is:", the.counts)


###### finding 'the' in python #########
# import re
# 
# pathway = 'taletwo.txt'
# 
# #All instances of “the”
# count = 0
# total = 0
# 
# with open(pathway) as f:
#   lines = f.readlines()
# for i in lines:
#   count += 1
# for match in re.finditer(r"\bthe\b", i):
#   total += 1
# s = match.start()
# e = match.end()
# print "Found 'the' in line {0} position {1} to {2} \n" .format(count, s, e)     
# print "Tatal number of 'the' is {0}" .format(total)

