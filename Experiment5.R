# q1
prob_a <- 1 - punif(45, min = 0, max = 60,lower.tail = FALSE)

prob_b <- punif(30, min = 0, max = 60) - punif(20, min = 0, max = 60)

cat("Probability that waiting time is more than 45 minutes:", prob_a, "\n")
cat("Probability that waiting time lies between 20 and 30 minutes:", prob_b, "\n")

#q2

lambda <- 1/2
density_function <- dexp(3,rate=lambda)

x_values <- seq(0,5,by = 0.01)
density_values <- dexp(x_values,rate = lambda)
plot(x_values,density_values)


prob_at_most_3 <- pexp(3, rate = lambda)
print(prob_at_most_3)

cumulative_values <- pexp(x_values, rate = lambda)
plot(x_values, cumulative_values)


simulated_data <- rexp(1000, rate = lambda)
plot(density(simulated_data))



#Q3
beta <- 1/3
alpha <- 2

#we can either use lower.tail = FALSE or subtract the probability from 1
prob_atleast_1 <- pgamma(1,shape = alpha, rate = beta,lower.tail = FALSE)

threshold <- 0.70
c <- qgamma(threshold, shape = alpha, rate = beta)
print(c)

