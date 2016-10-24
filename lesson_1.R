################################################
## Exercises ###################################
################################################
myvector1 <- c(3, 5, 1, 9, 5, 10, 2)
myvector2 <- c(100, 23, 1, 1, 1)
myvector3 <- c('aa', 'bb', 'cc')
#getting first 3 atoms from vector1
myvector1[1:3]
#getting 4-6th atoms from vecotr2 (There is no 6th number; want to see what it does.)
# out of bounds returns 'NA'
myvector2[4:6]
# CONCATENATE
# this puts the two vectors together - also works for characters, but makes ALL characters
combvect12 <- c(myvector1, myvector2)
combvect12
combvec13 <- c(myvector1, myvector3)
combvec13

# c - concatenate
#     - takes two (or more) vector and joins them together
vect1 = c(1, 2, 3)
vect2 = c(4,5,6)
catvect1 = c(vect1, vect2)
catvect1
# mixed atoms in this vector......they all become characters
vect4 = c(1,2, "three")

vect4
# concatenating with different atoms (integers and characters) they all go to characters
catvect2 = c(catvect1, vect4)
catvect2
multvect <- vect2 * 2
multvect
# curious to see what happens when multiply characters
multcatvect2 <- catvect2 * 2
multcatvect2
# Ha, it will not do it. What if I want the characters printed in duplicate?
rep(vect4, 2)

# Just playing with matices
my.mat <- matrix(1:25, nrow=5, ncol=5)
# testing the boundaries - this gives a warning but then fills in the extra spaces by repitition
bad1.mat <- matrix(1:25,nrow=3, ncol=10)
bad1.mat
# no warnings, just prints the first 5 numbers
bad2.mat <- matrix(1:25, nrow=5, ncol=1)
bad2.mat

my.mat
# prints ROWS 1-3 with ALL columns
my.mat[1:3,]
# ALL ROWS, cols 1-4
my.mat[,1:4]
# cell row 1 col 3
my.mat[1,3]
# removing, "-", rows and columns....and seeing what happens with 0
# it reindexes, 0 does nothing
my.mat[c(-1, -3, -5), c(-2 , 0)]
my.mat[c(-1, -3, -5), c(0, -2)]

your.mat <- my.mat
#giving names to columns and rows
colnames(your.mat)<- c('a','b', 'c', 'd', 'e')
rownames(your.mat) <- c('1', '2', '3', '4', '5')
your.mat

#looking to remove columns by name
# this one DESELECTS with -c
subset(your.mat, select=-c(a,b))
#this selects the cols I WANT - but column names must be in quotes!
your.mat[ , c('a', 'b')]
# this also selects for WANTED columns
subset(your.mat, select=c(a,b))

my.mat[0,]
my.mat[-0,]
my.mat[,-1:-2]
my.mat[1:2,1:2]
array(1:8, dim=c(2,2,2))
array(1:8, dim=c(2,2,2))[,2,2]

################################################
################################################
################################################
a <- 9^2
x <- c(100, 110, 120, 130)
y <- c(200, 210, 220, 230)
z <- c(300, 310, 320, 330)
p <- matrix(1:16, nrow=4, ncol=4)
d <- matrix(20:39, nrow=4, ncol=5) 
q <- matrix(40:59, nrow=5, ncol=4)
ZZ <- matrix(70:89, nrow=4, ncol=5)
x
y
z

p
d
q
colnames(ZZ) <- c('A', 'B', 'C', 'D', 'E')
rownames(ZZ) <- c('R1', 'R2', 'R3', 'R4')
ZZ


help(cat)
# cat lets you mix objects and text: like python print "the value of x is {0}" .format(x)
# can not replace cat with print in the examples below. Apparently, no mixing objects and text with print.
cat("The value of variable a is ", a, "\n")
cat("The mean of z is:", mean(z), "\n")

help(cbind)
# combines the vectors as columns, need matching row length
# BEWARE combining different data types such as char and int 
cbind(x, y, z)
cbind(z, p)
cbind(p, d)
cbind(p, q) # FAILS, as expected: diff number rows

#rbind
# combines the vectors as rows, need matching column length
rbind(x, y, z)
rbind(p, d)  # FAILS, as expected b/c diff number cols
rbind(p, q)

# col, row
# until I have to use this, I have no idea what the point is!
help(col)
col(ZZ, as.factor = TRUE)
col(ZZ)
ZZ[row(ZZ) == col(ZZ) + 1]
row(ZZ)

# cut
# This is frustrating. Give us a dataset and have us do things to it to learn commands. Commands on their own are meaningless!!!
help(cut)
# Nice youtube.com video of this: Take a heights column and cut it into intervals: A<=50, B=50-55, C=55-60, 
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
