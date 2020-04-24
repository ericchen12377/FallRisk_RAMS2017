data<-read.csv(file="Data/daystofall_Demo.csv",header=FALSE, sep=",")
cov<-read.csv(file="Data/covirates_Demo.csv",header=TRUE, sep=",",na.strings = " ")


###Data Processing for Openbugs inputs
#convert data into a vector
vector<-c()
for(i in 1:51){
  vector<-cbind(vector,t(data[,i]))
}

#use the vector to create the data list, including covirates
data<-list(
  M=38,
  K=c(2,51,11,7,2,20,2,15,6,16,5,6,2,3,3,2,13,5,2,4,6,2,5,3,2,2,5,2,7,8,7,2,5,2,4,2,2,4),
  t=structure(.Data=vector,dim=c(38,51)),
  covA=cov$A,
  covB=cov$B
)

###Create the model file for Openbugs
sink("daystofall_Demo.txt")
cat("
    
    model {
    for (j in 1:M) {
    for (i in 1:(K[j]-1)) {
    zeros[j,i] <- 0;
    log(X[j,i]) <- b0+b[1]*covA[j]+b[2]*covB[j]+theta[j];
    lambda[j,i] <- X[j,i]*pow(t[j,i+1],beta[j])-X[j,i]*pow(t[j,i],beta[j]);
    lambda_d[j,i] <- X[j,i]*beta[j]*pow(t[j,i+1],beta[j]-1);
    L[j,i]<-lambda_d[j,i]*exp(-lambda[j,i]);
    phi[j,i] <- -log(L[j,i]);
    zeros[j,i] ~ dpois(phi[j,i]);
    }
    theta[j] ~ dnorm(0,10);
    beta[j] ~ dunif(0,1);

    }
    for(k in 1:2){
    b[k]~ dnorm(-1,10);
    }
    b0~ dnorm(-1,10);
    }
    ", fill = TRUE)
sink()

#Specify the required parameters and run with arguments.
params <- c("theta","beta","b","b0")
outputs<-bugs(model.file = "daystofall_Demo.txt", 
           data = data, 
           inits = NULL, 
           parameters.to.save = params, 
           n.chains = 1, 
           n.iter = 10000,
           n.burnin = 1000, 
           debug=T)

