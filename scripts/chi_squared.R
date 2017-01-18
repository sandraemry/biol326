# chi squared goodness of fit test 

warm <- 20 # if 20 of 30 isopods ended up on the warm side
cold <- 10 # if 10 of 30 isopods ended up on the cold side
temperature <- data.frame(warm, cold)

# if your expected frequencies are all equal, you don't need to specify these in the code. 
# Just put your observed numbers in between the bracket (or dataframe if it's stored in one as this example shows)
chisq.test(temperature)
# or....
chisq.test(c(20, 10))

