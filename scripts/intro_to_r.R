# Intro to R --------------------------------------------------------------

# calculator
5 + 9

# assign values to variables
x <- 5
y <- 9
x + y

# logical operators
x == y
x != y
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

# dataframes ---------------------------------------------------------

# install gapminder package 
install.packages("gapminder")

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

# what are the dimensions?
dim(gapminder)

# length of dataframe
length(gapminder)

# plot two variables
plot(lifeExp ~ continent, data = gapminder)
plot(lifeExp ~ gdpPercap, data = gapminder)
plot(lifeExp ~ log(gdpPercap), data = gapminder)

# grazer habitat preference - t-tests -----------------------------------------

# clear workspace
rm(list = ls())

# set working directory to where your data files are located
setwd("/Users/sandraemry/Documents/biol326/data")

# load packages
library(tidyverse)

# read in fucus data
habitat_pref <- read_csv("/Users/sandraemry/Documents/biol326/data/fucus.csv")

# structure of dataframe
str(habitat_pref)

# view entire dataset
View(habitat_pref)

# how many unique cases of the treatment variable?
unique(habitat_pref$treatment)

# load stringr package
library(stringr)

# fix variable names
habitat_pref <- habitat_pref %>% 
  mutate(treatment = str_replace(treatment, "(Fucus\n|Fucus|fucus\n)", "fucus")) %>% 
  mutate(treatment = str_replace(treatment, "Bare", "bare"))

# how many unique cases of the treatment variable?
unique(habitat_pref$treatment)

# create variable for total grazers
habitat_pref <- habitat_pref %>% 
  mutate(total_grazers = (snails + limpets))

# check that your categorical variable is a factor
is.factor(habitat_pref$treatment)

# convert to factor
habitat_pref$treatment <- factor(habitat_pref$treatment)

# fit a linear model to data for limpets
model1a <- lm(limpets ~ treatment, data = habitat_pref)

# parameter estimates and model fit
summary(model1a)    

# check assumptions of model: plots of residuals, normal quantiles, leverage
par(mfrow = c(2,2))
plot(model1a)

# ANOVA table
anova(model1a)

# fit a linear model to data for snails
model1b <- lm(snails ~ treatment, data = habitat_pref)

# parameter estimates and model fit
summary(model1b)    

# check assumptions of model: plots of residuals, normal quantiles, leverage
par(mfrow = c(2,2))
plot(model1b)

# ANOVA table
anova(model1b)

# Boulder Sides - Paired t-test -------------------------------------------

# read in boulder data
boulder <- read_csv("/Users/sandraemry/Documents/biol326/data/boulder.csv")

# structure of dataframe
str(boulder)

# view entire dataset
View(boulder)

# check to see if data is normal
boulder <- boulder %>% 
  mutate(difference = top - bottom)

# histogram of the difference between top & bottom 
hist(boulder$difference)

# reshape dataset to a tidy one!
boulder <- gather(boulder, key = 'side', value = 'species_richness', top, bottom)

# view entire dataset
View(boulder)

# paired t - test
model3 <- t.test(species_richness  ~ side, data = boulder, paired = TRUE)

# mussel size gradient - regression ---------------------------------------

mussels <- read_csv("/Users/sandraemry/documents/biol326/data/mussels.csv")

# structure of dataframe
str(mussels)

# view entire dataset
View(mussels)

# model 3
model3 <- lm(mussel_length ~ distance, data = mussels)

# check assumptions
plot(model3)

# add a regression line to a scatter plot
plot(mussel_length ~ distance, data = mussels)
abline(model3)

# how to deal with outliers 


#estimates of slope, intercept and SEs
summary(model3)
confint(model3)

# test H0 of zero slope 
anova(model3)


# Whelk size gradient- regression ------------------------------------------------------

whelks <- read_csv("/Users/sandraemry/Documents/biol326/data/whelks.csv")

# structure of dataset
str(whelks)

# view entire dataset
View(whelks)

# model 4
model4 <- lm(whelk_length ~ distance, data = whelks)

# check assumptions
par(mfrow = c(2,2))
plot(model4)

# add a regression line to a scatter plot
par(mfrow = c(1,1))
plot(whelk_length ~ distance, data = whelks)
abline(model4)

# how to deal with unequal variance 


#estimates of slope, intercept and SEs
summary(model4)
confint(model4)

# test H0 of zero slope 
anova(model4)

