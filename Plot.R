###Visualize Days to event
data<-read.csv(file="Data/daystofall_Plot.csv",header=TRUE, sep=",")
attach(data)
library(lattice)
par(family = 'serif',font=1)
dotplot(id~daystofall,pch=19,type = "b",groups = id, col="black",
        xlab="Cumulative days", ylab = "Elder people ID",
        xlim=c(-20,900))
