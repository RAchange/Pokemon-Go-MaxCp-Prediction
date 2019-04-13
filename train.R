source("load.R")
source("model.R")

set.seed(100)  # setting seed to reproduce results of random sampling
trainingRowIndex <- sample(1:nrow(Pokemon.Cp), 0.8*nrow(Pokemon.Cp))  # row indices for training data
trainingData <- Pokemon.Cp[trainingRowIndex, ]  # model training data
testData  <- Pokemon.Cp[-trainingRowIndex, ]   # test data

# Build the model on training data -
Pokemon.Cp.lm <- lm(max.cp ~ Height.m. + Weight.kg. + HP + Attack + Defense 
                 + Sp..Atk + Sp..Def+ Speed , data=trainingData)  # build the model
distPred <- predict(Pokemon.Cp.lm, testData)  # predict distance
summary(Pokemon.Cp.lm)

actuals_preds <- data.frame(cbind(actuals=testData$max.cp, predicteds=distPred))
correlation_accuracy <- cor(actuals_preds)  # 82.7%
head(actuals_preds)

min_max_accuracy <- mean(apply(actuals_preds, 1, min) / apply(actuals_preds, 1, max))  
# => 58.42%, min_max accuracy
mape <- mean(abs((actuals_preds$predicteds - actuals_preds$actuals))/actuals_preds$actuals)  
# => 48.38%, mean absolute percentage deviation

print(min_max_accuracy)
print(mape)

# k-Fold
library(DAAG)
cvResults <- suppressWarnings(CVlm(data=Pokemon.Cp , form.lm=max.cp ~ Height.m. + Weight.kg. + HP + Attack + Defense 
                                   + Sp..Atk + Sp..Def+ Speed, m=5, dots=FALSE, seed=29, 
                                   legend.pos="topleft",  printit=FALSE, 
                                   main="Small symbols are predicted values while bigger ones are actuals."));  # performs the CV
attr(cvResults, 'ms')  
