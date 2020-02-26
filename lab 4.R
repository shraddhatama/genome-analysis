library(tidyverse)
library(plotly)
library(DT)

#Exercises

#Exercise 1
SNPs<- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")
p<- ggplot(SNPs,aes(chromosome)) +
  geom_bar(fill = "blue") +
  ggtitle("Total SNPs for each chromosome") +
  ylab("Total number of SNPs") +
  xlab("chromosome")
p


#Exercise 3
ppi <- 300
png("exercise3_plot", width=6*ppi, height=6*ppi, res=ppi)
ggplot(SNPs, aes(chromosome, fill = genotype)) +
  geom_bar(position = "dodge")
dev.off()

#exercise 4
chromosome_subset <- subset(SNPs, chromosome == "Y")
datatable(chromosome_subset)







