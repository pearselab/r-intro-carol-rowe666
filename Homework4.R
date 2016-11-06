##### Homework from lecture 4 ######

###  #1 ##########
# replicate is an important function that allows you to quickly generate random numbers. Use it to create
# a dataset of 10 variables, each drawn from a Normal distribution with different means and variances. This
# can be achieved in one line.

mean.vetc <- c(runif(10, min = 10, max = 20))
sd.vect <- c(runif(10, min = 3, max = 20))
replicate(10, rnorm(1, mean = mean.vetc, sd = sd.vect))

## Liked Spencer's answer much better!!
# dataset = replicate(10, rnorm(5, mean = (sample(seq(0,100,by = 1))), sd = (sample(seq(0,5,by = .1)))))

###### #2 ##########
# 2. Make your own version of the summary function for continuous datasets (like the one you generated above). You don’t have to slavishly replicated summary.data.frame; write something you would find useful.
#### my guess is that you are asking us to write a function to get some sort of summary info that we'd 
#### be interested in, if this was our data #########
###### I'm not an ecologist; don't do this kind of stuff, so will make something up #####

mean.vetc <- c(runif(10, min = 10, max = 20))
sd.vect <- c(runif(10, min = 3, max = 20))
my.table <- replicate(10, rnorm(10, mean = mean.vetc, sd = sd.vect))
my.table <- matrix(my.table, nrow = 10, ncol = 10)

## Here's a quick way to add headers: http://stackoverflow.com/questions/16032778/how-to-give-rows-and-columns-of-a-matrix-unique-names-when-you-are-uncertain-of
set.seed(1)
dimnames(my.table) <- list(rownames(my.table, do.NULL = FALSE, prefix = "row"),
                          colnames(my.table, do.NULL = FALSE, prefix = "col"))

my.table <- data.frame(my.table)
### setnames(my.table, new = c('new_name1','newname2', etc. ))
my.table$Genus <- c('Acer', 'Acer', 'Hammamelis', 'Viburnum', 'Acer', 'Phragmites', "Populus", 'Allenrolfea', 'Hammamelis', "Populus")
print(my.table)
## let's remind ourselves what summary does..on just a single column
mapply(summary, my.table[1], my.table[1])

#Get means by genus
my.table[, 1:3]
tapply(my.table$col1, my.table$Genus, mean)
tapply(my.table$col2, my.table$Genus, mean)
# get means from col1, 2, 3 of species

summary.function <- function(x){
  
}

####### Will, I really don't understand what you want here!! 
##### reviewing other's work.........Helps if you are an ecologist

####### Qusetion 5 ######################
# 5. A molecular biologist you owe a favour approaches you with a problem. They have a DNA sequence
# (e.g., ‘ACGATATACGA’) that they need to group into codons (groups of three) and translate into proteins
# (ignoring all complexities of translation and transcription). Write them a function that will take an
# arbitrary input sequence and an arbitrary codon lookup table, and output the translated sequence. Hint:
#   expand.grid will help you make a demo lookup table.

# WHY NOT USE BIOCONDUCTOR AND DO THIS IN ONE LINE!?!?!?!?!?!?!? I DON'T UNDERSTAND WHY YOU'D DO IT THIS WAY.
## I'M NOT FOLLOWING THE LOGIC

code.table = read.csv("/Users/carolrowe/Dropbox/Carol folder/PearseCourse/r-intro-carol-rowe666/codon_table.csv", header = FALSE)
colnames(code.table) <- c("seq","aa")
head(code.table)
code.table <- as.matrix(code.table)

x <- c('TTTTTCTTA', 'GGACCTTTT', 'TAGCATAAT')
print(length(x))
proteins=list() 
codon.func <- function(sequences){
  for (j in 1:length(sequences)){
    print(j)
    name <- paste('protein', j, sep = '')
    for (i in seq(from=1, to=nchar(sequences[j]), by=3)){
      threes <- substr(sequences[j], i, i+2)
      matches <- which(code.table[,1] == threes)
      aa <- code.table[matches, 2 ]
      name <- c(name, aa)
    }
    proteins[[j]] <- name
  }
  return(proteins)
}
proteins <- codon.func(x)
print(proteins)


######  Question 6 ############
# The molecular biologist now asks if you would write a function that will take multiple sequences, translate
# them, and then flag where the sequences match-up (overlap).

## Good grief! Teach us bioconductor then!!!!!!
# Above I already did the function.
# Now you want us to go back and do sequence alignments???
# Ugh. The idea of me learning R is so I can use bioconductor... this is crazy.

# adist gets the number of differences between strings
a <- c("TTTGGT")
b <- c("TTTAAT")
mapply(adist,a,b)



      