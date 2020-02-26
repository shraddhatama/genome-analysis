# Basic Data Objects

#Example 1 (Vectors)
SNPs <- c("AA", "AA", "GG", "AG", "AG", "AA","AG", "AA", "AA", "AA", "AG")
SNPs

#Example 2 (Factors)
SNPs_cat <- factor(SNPs)
SNPs_cat
table(SNPs_cat)
plot(SNPs_cat)
as.numeric(SNPs_cat)

#Example 3 (Matrices)
Day1 <- c(2,4,6,8)
Day2 <- c(3,6,9,12)
Day3 <- c(1,4,9,16)
A <- cbind(Day1,Day2,Day3)
A
Day1 <- c(2,4,6,8)
Day2 <- c(3,6,9,12)
Day3 <- c(1,4,9,16)
B <- rbind(Day1,Day2,Day3)
B
Day4 <- c(5,10,11,20)
C <- rbind(B,Day4)
C
A * 10
A[1]
A[12]
A[ ,c(1,3)]
A[c(2,4), ]
t(A)

#Example 4 (Data Frames)
Gene1 <- c(2,4,6,8)
Gene2 <- c(3,6,9,12)
Gene3 <- c(1,4,9,16)
Gene <- c("Day 1", "Day 2","Day 3", "Day 4")
RNAseq <- data.frame(Gene1, Gene2, Gene3, row.names = Gene)
RNAseq
RNAseq$Gene3
plot(RNAseq$Gene1,RNAseq$Gene3)
plot(RNAseq$Day,RNAseq$Gene3)
RNAseq$Gene4 <- c(5, 10, 15, 20)
RNAseq
RNAseq[,"Gene5"] <- c(1, 2, 3, 3)
RNAseq
RNAseq["Day 4",] <- rbind(10, 14, 20, 22, 3)

# Example 5 (Checking on object types)
x = 1
str(x)
a = "ATGCCCTGA"
str(a)
str(SNPs)
SNPs <- c("AA", "AA", "GG", "AG", "AG", "AA","AG", "AA", "AA", "AA", "AG")
str(SNPs_cat)
Day1 <- c(2,4,6,8)
Day2 <- c(3,6,9,12)
Day3 <- c(1,4,9,16)
B <- rbind(Day1,Day2,Day3)
str (B)
Gene1 <- c(2,4,6,8)
Gene2 <- c(3,6,9,12)
Gene3 <- c(1,4,9,16)
Gene <- c("Day 1", "Day 2","Day 3", "Day 4")
RNAseq <- data.frame(Gene1, Gene2, Gene3, row.names = Gene)
str(RNAseq)

#Exampe 6( 23 and me file)
SNP_table <- read.table("23andMe_example_cat25.txt", header = TRUE, sep = "\t")
SNP_table

#Example 7 (Getting information on a dataset
names(SNP_table)
str(SNP_table)
levels(SNP_table$genotype)
dim(SNP_table)
class(SNP_table)
SNP_table
head(SNP_table, n=10)
tail(SNP_table, n=5)
help("read.table")
SNP_table$chromosome <-as.factor(SNP_table$chromosome)
str(SNP_table)
SNP_table$chromosome <- as.integer(SNP_table$chromosome)
str(SNP_table) 
SNP_table_AG <- subset(SNP_table, genotype == 'AG') 
SNP_table_AG
table(SNP_table_AG$chromosome)
subset(SNP_table, position > 700000 & position < 800000)


#Exercise 1
x<-c(1,3,6,9,12)
y<-c(1,0,1,0,1)
x+y
x-y
x*y
x/y

#Exercise 2
A<-c(0,1,2,3)
B<-c("aa","bb","cc","dd")
C<-c("aa",1,"bb",2)
str(A)
str(B)
str(C)

#Exercise 3
genotype1<-c("AA","AA","AG","GG","GG")
genotype2<-c("AA","AA","GG","GG","GG")
A<-cbind(genotype1,genotype2)
A

table (genotype1)
table (genotype2)

#Excercise 4
treatment1<-c(0,1,2,3,4)
treatment2<-c(0,2,4,6,8)
treatment3<-c(0,3,6,9,12)
time<-c(0,2,4,6,8)
treatment<-data.frame(treatment1,treatment2,treatment3,time,row.names = time)
treatment
treatment$treatment3
plot(treatment$treatment3,treatment$time)

#Exercise 5
SNP_table <- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")

str(SNP_table)
# the trunceted file shows that it is integers which means that it has no characters but in this file there are characters which means that there is a mix between number and characters or it has only characters.This chromosome is shown as a factor.

#Exercise 6
table(SNP_table$genotype)

#Exercise 7
SNP_table_A<-subset(SNP_table,genotype=='A')
table(SNP_table_A$chromosome)
