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
your.mat[c('a', 'b')]
toremove <- c('a', 'b')
your.mat[!colnames(your.mat) %in% toremove ]
rownames(your.mat)[1:2] -> remove
remove
your.mat[!rownames(your.mat) %in% remove ]
my.mat[0,]
my.mat[-0,]
my.mat[,-1:-2]
my.mat[1:2,1:2]
array(1:8, dim=c(2,2,2))
array(1:8, dim=c(2,2,2))[,2,2]
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
