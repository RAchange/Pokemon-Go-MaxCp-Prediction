Pokemon.Cp = read.csv("crawler/Pokemon-maxcp.csv", 
                      encoding = "Latin15", fileEncoding = "Big-5", 
                      quote = "", sep = ",")

Pokemon.Pred = read.csv("./crawler/Pokemon-without.csv", 
                      encoding = "Latin15", fileEncoding = "UTF-8", 
                      quote = "", sep = ",")

print(Pokemon.Cp)
summary(Pokemon.Cp)
print(Pokemon.Pred)
summary(Pokemon.Pred)

names(Pokemon.Cp)

for (type1 in Pokemon.Cp[,3]){
  
}
  

cor(Pokemon.Cp$Height.m., Pokemon.Cp$max.cp)
cor(Pokemon.Cp$Weight.kg., Pokemon.Cp$max.cp)
cor(Pokemon.Cp$HP, Pokemon.Cp$max.cp)
cor(Pokemon.Cp$Attack, Pokemon.Cp$max.cp)
cor(Pokemon.Cp$Defense, Pokemon.Cp$max.cp)
cor(Pokemon.Cp$Sp..Atk, Pokemon.Cp$max.cp)
cor(Pokemon.Cp$Sp..Def, Pokemon.Cp$max.cp)
cor(Pokemon.Cp$Speed, Pokemon.Cp$max.cp)
cor(Pokemon.Cp[,5:13])

table(is.na(Pokemon.Cp))

