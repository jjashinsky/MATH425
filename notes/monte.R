N <- 10
time <- rep(NA,N)
n <-1000

for(j in 1:N)
{
  start.time <- Sys.time()
  circle.points<-0
  square.points<-0
  x<-runif(n,0,1)
  y<-runif(n,0,1)
  z<-rep(0, n)
  for (i in 1:n)
  {
    if ((x[i]-.5)^2 + (y[i]-.5)^2 <=.5^2)
    {
      circle.points<-circle.points+1
      square.points<-square.points+1
      z[i]<-1
    } else
    {
      square.points<-square.points+1
    }
  }


  Sys.time() - start.time
  
}


