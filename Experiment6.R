#q1
library(pracma)



f <- function(x, y) {
  return(2*(2*x+3*y)/5)
}


is_joint_density <- integral2(f, 0, 1, 0, 1)  

print(is_joint_density$Q)


g_x <- function(y){f(1,y)}
I1 <- integral(g_x,0,1)
print(I1)


hy <- function(x){f(x,0)}
I2 <- integral(hy,0,1)
print(I2)

f <- function(x, y) {
  return(x*y*2*(2*x+3*y)/5)
}

expected_value <- integral2(f,0,1,0,1)
print(expected_value$Q)


#Q2
f = function(x,y){(x+y)/30}

m = matrix(c(f(0,0:2),f(1,0:2),f(2,0:2),f(3,0:2)),nrow = 4, ncol = 3,byrow = TRUE)
x <- c(0,1,2,3)
y<- c(0,1,2)
sum(m)
gx <- apply(m,1,sum)
hy <- apply(m,2,sum)
conditional_prob <- m[1,2]/hy[2]

exp_x = sum(x*gx)
exp_x

exp_x2 <- sum(x*x * gx)
exp_x2

var_x <- exp_x2 - exp_x*exp_x
var_x


f1 <- function(x,y){x*y*f(x,y)}
m1 = matrix(c(f1(0,0:2),f1(1,0:2),f1(2,0:2),f1(3,0:2)),nrow = 4, ncol = 3,byrow = TRUE)
exp_xy <- sum(m1)
exp_xy

exp_y = sum(y*hy)
exp_y2 = sum(y*y*hy)
var_y <- exp_y2 - exp_y*exp_y
cov <- exp_xy - exp_x*exp_y
corre <- cov/(var_x*var_y)
cov
corre

