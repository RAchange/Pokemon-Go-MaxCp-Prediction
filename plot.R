source("load.R")
require(ggplot2)
library(car)

for (each in names(Pokemon.Cp[5:12])) {
  ggplot(data=Pokemon.Cp) + 
  geom_point(aes(x=each,y=max.cp, color=Species)) +
  theme_bw() 
}

for (i in 5:12){
  par(mfrow = c(2,2))
  qqPlot(Pokemon.Cp[i], glab=names(Pokemon.Cp)[i])
  matplot(Pokemon.Cp[,13], Pokemon.Cp[i],type="l")
  hist(Pokemon.Cp[i],probability = TRUE)
  curve(dnorm(x,mean(Pokemon.Cp[i],sd(Pokemon.Cp[i]))),add = TRUE,col = "Red")
}

shapiro.test(Pokemon.Cp[,5])
shapiro.test(Pokemon.Cp[,6])
shapiro.test(Pokemon.Cp[,7])
shapiro.test(Pokemon.Cp[,8])
shapiro.test(Pokemon.Cp[,9])
shapiro.test(Pokemon.Cp[,10])
shapiro.test(Pokemon.Cp[,11])
shapiro.test(Pokemon.Cp[,12])

