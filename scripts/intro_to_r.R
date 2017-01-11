# Intro to R --------------------------------------------------------------

#calculator
5+9

#assign values to variables
x <- 5
y <- 9
x + y

#logical operators
x == y
x !=y
x > y
x < y

# vector of numbers
a <- c(1,2,3,4)
a <- c(1:4)

# summary stats
sum(a)
max(a)
min(a)
mean(a)
var(a)
sd(a)


# Reading in data ---------------------------------------------------------

# clear workspace
rm(list = ls())

# install.packages("gapminder")

# load gapminder package
library(gapminder)

# look at structure of gapminder dataset
str(gapminder)

# look at first few rows
head(gapminder)

# names of columns
names(gapminder)

# how many columns?
ncol(gapminder)

# how many rows?
nrow(gapminder)

# length of dataframe
length(gapminder)

# plot two variables
plot(lifeExp ~ continent, data = gapminder)


# T-tests, ANOVAs, and Regression -----------------------------------------


setwd("/Users/sandraemry/Documents/biol326/biol326")
library(tidyverse)

# read in data
mydata <- read_csv("")

## t-test and ANOVAs

# check that your categorical variable is a factor
is.factor(mydata$x)

# to convert to factor
mydata$x <- factor(mydata$x)

# fit a linear model to data
model1<-lm(y ~ x, data = mydata)

# parameter estimates and model fit
summary(model1)    

# check assumptions of model: plots of residuals, normal quantiles, leverage
plot(model1)

# ANOVA table
anova(model1)

## Regression

model2 <- lm(y ~ x, data = mydata)

# add a regression line to a scatter plot
plot(y ~ x, data = mydata)
abline(model2)

#estimates of slope, intercept and SEs
summary(model2)
confint(model2)

# test Ho of zero slope 
anova(model2)





