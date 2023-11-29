#p means cumulative 
#f function is for distribution

#should know when to use r- random p q- quantile d
#q1
n=100
df=n-1=99
sample=rt(100,99)
hist(sample)

#q2
n=100
df=c(2,10,25)
sample1<-chisq(n,df[1])
sample2<-chisq(n,df[2])
sample3<-chisq(n,df[3])

#q3
x<-seq(-6,6,length=100)
df<-c(1,4,10,30)
r1<-dt(x,df[1])
r2<-dt(x,df[2])
r3<-dt(x,df[3])
r4<-dt(x,df[4])
#or
for(i in 1:4){
  px[i]=dt(x,df[i])
}
#plotting density function for df=30
plot(x,r4, col="red", type="l")
color=c("blue", "green", "yellow")
for(i in 1:3){
  lines(x,dt(x,df[i]), col=color[i])
}
#q4
v1 <- 10
v2 <- 20
#i
qf(0.95,v1,v2)


#ii

pf(1,5,v1,v2)

#iii
q <- c(0.25,0.5,0.75,0.999)
qf(q,v1,v2)

#iv
pf(1.5,v1,v1,lower.tail = FALSE)
v1 = 10
v2 = 20
n = 1000
sample <- rf(n,df1 = v1,df2 = v2)
hist(sample)



