require(car)
source("load.R")
source("model.R")
shapiro.test(Pokemon.Cp.lm$residuals)
durbinWatsonTest(Pokemon.Cp.lm)
ncvTest(Pokemon.Cp.lm)
AIC(Pokemon.Cp.lm)
BIC(Pokemon.Cp.lm)

Cpredict<-data.frame(Pokemon.Pred[,5:12])

data.frame(cbind(Pokemon.Pred[1] ,predict(Pokemon.Cp.lm, Cpredict)))
