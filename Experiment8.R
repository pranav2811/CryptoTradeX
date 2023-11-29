#a
data <- read.csv(file.choose())
#b
dim(data)
head(data,10)
#c
mean(data$Wall.Thickness)
hist(data$Wall.Thickness)
#d
abline(v=12.8,col="red")
#since the histogram is not a bell shaped curve ,is symetric about the mean and doesnt have a single peak it is not normal distribution


#a
s10 <- c()
for(i in 1 :9000){
  s = sample(data$Wall.Thickness,size = 10,replace = TRUE)
  s10[i] = mean(s)
}
hist(s10)
abline(v = 12.8,col = "red")

