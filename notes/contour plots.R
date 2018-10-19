x<-seq(-10,10,length=100)
y<-seq(-10,10,length=100)
z<-outer(x,y,function(x,y) 140+(4*x^2)-(2*y^2)+(5*x*y) )
contour(x,y,z,levels=c(0,50, 100, 125, 135, 150, 175, 200), xlab="X", ylab="Y", main="Contour Plot of ")
contour(x,y,z,levels=c(0,-50, -100, -125, -135), add=TRUE)


