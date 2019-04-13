source("load.R")
names(Pokemon.Cp)
Pokemon.Cp.lm <- lm(max.cp ~ Height.m. + Weight.kg. + HP + Attack + Defense 
              + Sp..Atk + Sp..Def+ Speed , data = Pokemon.Cp)
summary(Pokemon.Cp.lm)
