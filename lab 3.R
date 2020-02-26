library(ggplot2)

# I_Jean
I_jean <- read.delim("http://bit.ly/avml_ggplot2_data")
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_log10(breaks = c(50, 100,200,300,400))+
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_bw()+
  ggtitle("394 tokens of 'I' from one speaker")

#The data layer

#Example 1
head(I_jean)

#Example 2
p <- ggplot(I_jean, aes(x = Dur_msec, y = F1.n))

#The geometries layer

#Example 1
p <- p + geom_point()
p

#Example 2
ggplot(I_jean, aes(x=Dur_msec, y=F1.n)) +
  geom_point(shape = 3)

#Example 3
ggplot(I_jean, aes(x=Dur_msec, y=F1.n)) +
  geom_point(color = "red", size = 3)

#The statistics layer

#Example 1
p <- p + stat_smooth()
p

#Example 2
ggplot(I_jean, aes(x = Dur_msec, y = F1.n))+
  stat_smooth()

#Scale transformations

#Example 1
p <- p + scale_x_log10(breaks = c(50, 100,200,300,400))+
  scale_y_reverse()
p

#Cosmetic alterations

#Example 1
p <- p + ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_bw()+
  ggtitle("394 tokens of 'I' from one speaker")
p

#Example 2
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_log10(breaks = c(50, 100,200,300,400))+
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_bw()+
  ggtitle("394 tokens of 'I' from one speaker")

#Aesthetics

#Example 1
I_subset <- subset(I_jean, Word != "I")

ggplot(I_subset, aes(Dur_msec, F1.n, color = Word))+
  geom_point()

#Example 2
ggplot(I_subset, aes(Dur_msec, F1))+
  geom_point(color = "red")

#Example 3
I_subset$Color <- c("black",
                    "red","blue",
                    "green","goldenrod")[I_subset$Word]

ggplot(I_subset, aes(Dur_msec, F1, color = Color))+
  geom_point()

#Inhertiance

#Example 1
ggplot(I_subset, aes(Dur_msec, F1.n, color = Word))+
  geom_point()+
  geom_line()

#Example 2
ggplot(I_subset, aes(Dur_msec, F1.n))+
  geom_point(aes(color = Word))+
  geom_line()

#Example 3
ggplot(I_subset, aes(Dur_msec, F1.n))+
  geom_point()+
  geom_line( aes(color = Word))+
  scale_color_hue(direction = -1)

#Grouping

#Example 1
ggplot(I_subset, aes(Dur_msec, F1.n, color=Word))+
  geom_point()+
  stat_smooth(se = F)

#Example 2
ggplot(I_subset, aes(Dur_msec, F1.n))+
  geom_point(aes(color=Word))+
  stat_smooth(se = F)

#Example 3
ggplot(I_subset, aes(Dur_msec, F1.n, shape=Word))+
  geom_point()

#Example 4
ggplot(I_subset, aes(Dur_msec, F1.n, shape=Word))+
  geom_point()+
  stat_smooth(se = F)

#Example 5
ggplot(I_subset, aes(Dur_msec, F1.n, shape=Word))+
  geom_point()+
  stat_smooth(se = F, aes(group = 1))

#Example 6
ggplot(I_subset, aes(Dur_msec, F1.n, color=Word))+
  geom_line(aes(group = 1))

#More aesthetics and their use

#Example 1
ggplot(I_jean, aes(Dur_msec, F1.n, color = F1.n))+
  geom_point()

#Example 2
ggplot(I_jean, aes(Word))+
  geom_bar()

#Example 3
ggplot(I_jean, aes(Word, color = Word))+
  geom_bar()

#Example 4
ggplot(I_jean, aes(Word, fill = Word))+
  geom_bar()

#Example 5
ggplot(I_subset, aes(Name, fill = Word))+
  geom_bar()

#Example 6
ggplot(I_subset, aes(Name, fill = Word))+
  geom_bar(color = "black")

#Geometries

#Example 1
apropos("^geom_")

#Example 2
ggplot(I_jean, aes(F1.n))+
  geom_histogram()

#Example 3
ggplot(I_jean, aes(Dur_msec, F1.n))+
  geom_smooth()

#Some special geoms
# geom_line() vs geom_path()
#Example 1
mod_F1 <- loess(F1.n ~ Dur_msec, data = I_jean)
mod_F2 <- loess(F2.n ~ Dur_msec, data = I_jean)

pred <- data.frame(Dur_msec = seq(50, 400, length = 100))
pred$F1.n <- predict(mod_F1, newdata = pred)
pred$F2.n <- predict(mod_F2, newdata = pred)

ggplot(pred, aes(-F2.n, -F1.n, color = Dur_msec))+
  geom_path()+
  geom_point()

#Example 2 
ggplot(pred, aes(-F2.n, -F1.n, color = Dur_msec))+
  geom_line()+
  geom_point()

#Geom_text()

#Example 1
ggplot(I_subset, aes(Dur_msec, F1.n))+
  geom_text(aes(label = Word))

#Positioning
# jitter
#Example 1
ggplot(I_jean, aes(Word, F1.n))+
  geom_boxplot()

#Example 2
ggplot(I_jean, aes(Word, F1.n))+
  geom_point()

#Example 3
ggplot(I_jean, aes(Word, F1.n))+
  geom_point(position = "jitter")

#Example 4
ggplot(I_jean, aes(Word, F1.n))+
  geom_jitter()

#Dodge, stack, and fill

#Example 1
I_subset$Dur_cat <- I_subset$Dur_msec > mean(I_subset$Dur_msec)

ggplot(I_subset, aes(Dur_cat))+
  geom_bar()

#Example 2
ggplot(I_subset, aes(Dur_cat, fill = Word))+
  geom_bar(color = "black")

#Example 3
ggplot(I_subset, aes(Dur_cat, fill = Word))+
  geom_bar(position = "dodge", color = "black")

#Example 4
ggplot(I_subset, aes(Dur_cat, fill = Word))+
  geom_bar(position = "fill", color = "black")

#Example 5
ggplot(I_subset, aes(Word, fill = Dur_cat))+
  geom_bar(position = "fill", color = "black")

#Example 6
ggplot(I_subset, aes(Dur_msec, fill = Word))+
  geom_density(alpha = 0.6)

#Example 7
ggplot(I_subset, aes(Dur_msec, fill = Word))+
  geom_density(position = "stack", aes(y = ..count..))

#Example 8
ggplot(I_subset, aes(Dur_msec, fill = Word))+
  geom_density(position = "fill", aes(y = ..count..))

#Some new exciting geoms

#Example 1
ggplot(I_subset, aes(Word, F1.n))+
  geom_violin()+
  geom_dotplot(binaxis="y", stackdir="center")

#Statistics

#Example 1
apropos("^stat_")

#Example 2
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth()

#Example 3
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth(geom = "point")

#Example 4
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth(geom = "pointrange")

#Example 5
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  geom_point()

#Example 6
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  geom_point(stat = "smooth")

#Example 7
geoms <- gsub("geom_", "", apropos("^geom_"))
stats <- gsub("stat_", "", apropos("^stat_"))

stats[stats %in% geoms]

#Particularly useful Statistics
#stat_smooth()
#Example 1
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth()

#Example 2
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth(method = lm)

#Example 3
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth(method = lm, formula = y ~ poly(x, 3))

#Example 4
library(splines)
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth(method = lm, formula = y ~ bs(x, df = 10))

#Example 5
library(mgcv)

#Example 6
ggplot(I_jean, aes(Dur_msec, F1.n)) + 
  stat_smooth(method = gam, formula = y ~ s(x, bs = "cs"))

#Example 7
I_jean$F1_median <- (I_jean$F1.n > median(I_jean$F1.n)) * 1
head(I_jean)

#Example 8
ggplot(I_jean, aes(Dur_msec, F1_median))+
  stat_smooth(method = glm, family = binomial)

#Example 9
## b-splines
ggplot(I_jean, aes(Dur_msec, F1_median))+
  stat_smooth(method = glm, 
              family = binomial, 
              formula  = y ~ bs(x, df = 10))

#Example 10
## cubic regression splines
ggplot(I_jean, aes(Dur_msec, F1_median))+
  stat_smooth(method = gam, 
              family = binomial, 
              formula  = y ~ s(x, bs = "cs"))
#stat_summary()
#Example 11
ggplot(I_jean, aes(Word, Dur_msec))+
  stat_summary(fun.y = mean, geom = "bar")

#Example 12
ggplot(I_jean, aes(Word, Dur_msec))+
  stat_summary(fun.y = mean, geom = "bar", fill = "grey40")+
  stat_summary(fun.data = mean_cl_normal, geom = "errorbar")

#Example 13
ggplot(I_jean, aes(Word, Dur_msec))+
  stat_summary(fun.y = mean, geom = "bar", fill = "grey40")+
  stat_summary(fun.data = mean_cl_boot, geom = "pointrange")

#Values created by statistics
#Example 1
ggplot(I_jean, aes(Dur_msec, color = Word))+
  geom_density()

#Example 2
ggplot(I_jean, aes(Dur_msec, color = Word))+
  geom_density(aes(y = ..count..))

#Example 3
ggplot(I_jean, aes(Dur_msec, fill = Word))+
  geom_density(aes(y = ..count..), position = "fill")

#Example 4
ggplot(I_jean, aes(Dur_msec, fill = Word))+
  geom_density(aes(y = ..density..), position = "fill")

#Example 5
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d()

#Example 6
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "polygon", aes(fill = ..level..))

#Example 7
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "point",contour = F, 
                 aes(size = ..density..), alpha = 0.3)

#Example 8
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile", contour = F, aes(alpha = ..density..))

#Example 9
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile", contour = F, aes(fill = ..density..))

#Scales
#x andy scales
#Example 1
apropos("^scale_x_")

#Scale_arguments
# scale_[xy]_continuous
#Example 1
ggplot(I_jean, aes(Dur_msec, F1.n))+
  geom_point()

#Example 2
ggplot(I_jean, aes(Dur_msec, F1.n))+
  geom_point()+
  scale_x_continuous(name = "Vowel Duration (msec)")

#Example 3
ggplot(I_jean, aes(Dur_msec, F1.n))+
  geom_point()+
  xlab("Vowel Duration (msec)")

#Example 4
ggplot(I_jean, aes(log2(Dur_msec), F1.n))+
  geom_point()+
  scale_x_continuous("log2 Vowel Duration (msec)")

#Example 5
ggplot(I_jean, aes(Dur_msec, F1.n))+
  geom_point()+
  scale_x_continuous("Vowel Duration (msec)",
                     trans = "log2")

#Example 6 
apropos("_trans")

#Example 7
ggplot(I_jean, aes(Dur_msec, F1.n))+
  geom_point()+
  scale_x_continuous("Vowel Duration (msec)",
                     trans = "sqrt")

#Example 8
ggplot(I_jean, aes(Dur_msec, F1.n))+
  geom_point()+
  scale_x_continuous("Vowel Duration (msec)",
                     trans = "reverse")

#Color and fill scales
apropos("^scale_color_")

#Categorical color scales

#Example 1
ggplot(I_jean, aes(Word, Dur_msec, fill = Word))+
  stat_summary(fun.y = mean, geom = "bar")+
  scale_fill_hue()

#Example 2
ggplot(I_jean, aes(Word, Dur_msec, fill = Word))+
  stat_summary(fun.y = mean, geom = "bar")+
  scale_fill_hue(name = "Lexical Item",
                 limits = c("I'D","I'VE","I'LL","I'M","I"),
                 labels = c("'D","'VE","'LL","'M",""))

#Example 3
ggplot(I_jean, aes(Word, Dur_msec, fill = Word))+
  stat_summary(fun.y = mean, geom = "bar")+
  scale_fill_brewer(palette = "Set1")

#Example 4
ggplot(I_jean, aes(Word, Dur_msec, fill = Word))+
  stat_summary(fun.y = mean, geom = "bar")+
  scale_fill_manual(values=c("bisque", "chartreuse4",
                             "hotpink","yellow", "red"))

#Example 5
ggplot(I_jean, aes(Word, Dur_msec, fill = Word))+
  stat_summary(fun.y = mean, geom = "bar")+
  scale_fill_grey()

#Gradient color scales

#Example 1
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradient()

#Example 2
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradient(low="darkblue",high="darkred")

#Example 3
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradient2(low="darkblue",
                       high="darkred",
                       mid="white",
                       midpoint=0.5)

#Example 4
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradientn(colours = c("bisque", "chartreuse4",
                                   "hotpink","yellow"))

#Example 5
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradientn(colours = rainbow(6))

#Example 6
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradientn(colours = terrain.colors(6))

#Example 7
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradientn(colours = topo.colors(6))

#Guides

#Example 1
ggplot(I_jean, aes(-F2.n, -F1.n))+
  stat_density2d(geom = "tile",contour = F, aes(fill = ..density..))+
  scale_fill_gradientn(colours = rainbow(6),
                       guide = "colorbar")

#Shape and linetype

#Example 1
apropos("^scale_shape_")

#Example 2
apropos("^scale_linetype_")

#Example 3 
ggplot(I_subset, aes(Dur_msec, F1.n, shape = Word))+
  geom_point()

#Example 4
ggplot(I_subset, aes(Dur_msec, F1.n, shape = Word))+
  geom_point()+
  scale_shape_manual(values=c(1,1, 19, 19))

#Other scales

#Example 1
apropos("^scale_size_")

#Example 2
apropos("^scale_alpha_")

#More on guides

#Example 1
ggplot(I_subset, aes(Dur_msec, F1.n, 
                     color = Word,
                     shape = Word, 
                     linetype = Word))+
  geom_point()+
  geom_line()

#Example 2
ggplot(I_subset, aes(Dur_msec, F1.n, 
                     color = Word, 
                     shape = Word, 
                     linetype = Word))+
  geom_point()+
  geom_line()+
  scale_color_hue(guide = F)

#Example 3
ggplot(I_subset, aes(Dur_msec, F1.n, color = Word, label = Word))+
  geom_text()+
  geom_line()

#Example 4
ggplot(I_subset, aes(Dur_msec, F1.n, color = Word, label = Word))+
  geom_text(show_guide = F)+
  geom_line()

#Coordinate systems
#faceting

#Example 1
I_jean$Dur_cat <- I_jean$Dur_msec > mean(I_jean$Dur_msec)

#facet_wrap

#Example 1
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()

#Example 2
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_wrap(~Word)

#Example 3
ggplot(I_jean, aes(Dur_cat, F1.n))+
  stat_summary(fun.data = mean_cl_boot)+
  facet_wrap(~Word)

#Example 4
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_wrap(~Word, ncol = 2)

#Example 5
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_wrap(~Word, nrow = 1)

#Example 6
# Inadvisable
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_wrap(~Word, scales = "free_x")

#example 7
# Inadvisable
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_wrap(~Word, scales = "free_y")

#Example 8
# Inadvisable
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_wrap(~Word, scales = "free")

#Facet_grid

#Example 1
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_grid(Dur_cat~Word)

#Example 2
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_grid(Word~Dur_cat)

#Example 3
ggplot(I_jean, aes(-F2.n, -F1.n ))+
  geom_point()+
  facet_grid(Dur_cat~Word, scales = "free")

#Additional options

#Example 1
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_grey()

#Example 2
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_grey(base_size = 16, base_family = "serif")

#Example 3
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_grey(base_size = 16, base_family = "mono")

#Example 4
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme_bw()

#Example 5
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme(panel.background = element_rect(colour = 'purple', 
                                        fill = 'pink', 
                                        size = 3, 
                                        linetype='dashed'))

#Example 6
ggplot(I_jean, aes(x=Dur_msec, y=F1.n))+
  geom_point()+
  stat_smooth()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  ggtitle('Plot of "I"')

#Example 7
ggplot(I_jean, aes(x=Dur_msec, y=F1.n, color = Word))+
  geom_point()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  scale_color_brewer(palette = "Set1")+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme(legend.position = "right")


#Example 8
ggplot(I_jean, aes(x=Dur_msec, y=F1.n, color = Word))+
  geom_point()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  scale_color_brewer(palette = "Set1")+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme(legend.position = "top")

#Example 9
ggplot(I_jean, aes(x=Dur_msec, y=F1.n, color = Word))+
  geom_point()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  scale_color_brewer(palette = "Set1")+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme(legend.position = c(0.9,0.5))

#Example 10
ggplot(I_jean, aes(x=Dur_msec, y=F1.n, color = Word))+
  geom_point()+
  scale_x_continuous(trans = "log2")+ 
  scale_y_reverse()+
  scale_color_brewer(palette = "Set1")+
  ylab("Normalized F1")+
  xlab("Vowel duration (msec)")+
  theme(legend.position = "none")

#Building plots

#Example 1
library(plyr)
word_means <- ddply(I_jean, .(Word), numcolwise(mean))

ggplot(I_subset, aes(F2.n, F1.n, color = Word)) + 
  geom_point()+
  geom_text(data = word_means, 
            aes(label = Word),
            show.legend = F)+
  scale_y_reverse()+
  scale_x_reverse()+
  coord_fixed()

#Example 2
fdw <- read.delim("http://bit.ly/fdw_2005")
head(fdw)

#Example 3
fdw <- ddply(fdw, .(Child), transform, prob = value/sum(value))

ggplot(fdw, aes(Age/12, fill = variable)) + 
  geom_density(aes(weight = prob, y = ..count..), position = "fill")+
  facet_wrap(~Sex)+
  scale_fill_brewer(name = "variant", palette = "Set1")+
  theme_bw()

#Additional notes on the structure of the complete 23andMe file

SNPs<- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")
str(SNPs)

class(SNPs)

typeof(SNPs)

str(SNPs)

summary(SNPs)

class(SNPs$genotype)

typeof(SNPs$genotype)

str(SNPs$genotype)

summary(SNPs$genotype)

summary(SNPs$chromosome)

summary(SNPs$position)

SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))
summary(SNPs$chromosome)

#Exercises

#Exercise 1
SNPs<- read.table("23andMe_complete.txt", header = TRUE, sep = "\t")
p<- ggplot(SNPs,aes(chromosome))+ geom_bar()
p

#Exercise 2
SNPs$chromosome = ordered(SNPs$chromosome, levels=c(seq(1, 22), "X", "Y", "MT"))
p<- ggplot(SNPs,aes(chromosome))+
  geom_bar()
p

#Exercise 3
ggplot(SNPs,aes(chromosome, fill = genotype))+
  geom_bar(color = "black")

#Exercise 4
ggplot(SNPs,aes(chromosome, fill = genotype))+
  geom_bar(position = "fill", color = "black")

#Exercise 5
ggplot(SNPs, aes(chromosome, fill = genotype))+
  geom_bar(position = "dodge")
#Exercise 6
ggplot(SNPs, aes(chromosome, fill = genotype))+
  geom_bar(position = "dodge") + facet_wrap(~genotype)



