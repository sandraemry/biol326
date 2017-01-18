########### chi squared goodness of fit test ###########

warm <- 18 # if 18 of 25 isopods ended up on the warm side
cold <- 7 # if 7 of 25 isopods ended up on the cold side
temperature <- data.frame(warm, cold)

# if your expected frequencies are all equal, you don't need to specify these in the code. 
# Just put your observed numbers in between the brackets (or dataframe if it's stored in one as this example shows)
chisq.test(temperature)
# or....
chisq.test(c(18, 7))
# same results as...
chisq.test(c(18, 7), p = c(0.5,0.5))

# if instead you have reason to believe that 75% of the time they should end up on the warm side
# and 25% of the time on the cold side, you would need to specify this with p = c(.75, .25)
chisq.test(c(18, 7), p = c(.75, .25))
chisq.test(temperature, p = c(.75, .25))
