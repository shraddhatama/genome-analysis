#Basic computation

#example 1
3*3

#example 2
3+3/3

#example 3
(3+3)/3

#example 4:Natural logarithm with base e=2.718282
log(10)

#example 6:exponential function
exp(2)

#example 7:3 raised to the third power
3^3

#example 8:square root
sqrt(9)

#example 9:absolute value of 1-7
abs(1-7)

#R data types

#example 10: Numerics
x=3.5
x
sqrt(x)

#example 11:Integers
x=3.33
y=as.integer(x)
y

#example 12:logical
x=1;y=2
z=x>y
z

#example 13:standard logical operations
x=TRUE;y=FALSE
x&y
x|y
!x

#example 14:character
x="ATGAAA"
y ="TTTTGA"
x
DNA=paste(x,y)
DNA

#example 15:complex
x=1+2i 
x

#example 16:vectors
x<-c(1,10,100)    
x
x * 2
sum (x)
#example 17:arithmatic
x<-c(1,10,100) 
y<-c(1,2,3) 
x*y

#example 18:characters
codons<-c("AUG","UAU","UGA") 
codons

#example 19:simple graph
RNA_levels<- c(7, 28, 100, 201, 208)
barplot(RNA_levels)

#exercise 1
x=2
y=8
#sum
x+y
#difference
x-y
#product
x*y
#quotient
x/y

#exercise 2
x=3.5
y=5
x^5>y^4

#exercise 3
x<-c (211,62,108,43,129) 
x
#sum of vector
sum(x)
#related frequency
x/sum(x)

#exercise 4
nucleotides<-c("A","T","C","G")
sort(nucleotides)