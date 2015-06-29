## Analysis of BSPA Ver 4 with CFA

## Assumes data file and .R file are in same directory

## Load lavaan (LAtent VAriable ANalysis) package

library(lavaan)

## Load BSPA data spreadsheet

BSPA <-read.csv("BSPAforCFA.csv")

## Latent variables need a special regression operator '=~' instead of just '~'
## Variances and covariances are set with '~~' operator

## The following code specifies a one factor model 

BSPAmodel <- ' 

# latent variable definitions 
BSPA =~ Q1 + Q2 + Q3 + Q4 + Q5 + Q6 + Q7 + Q8 + Q9 + Q10 + Q11 + Q12 + Q13
'
## This code actually runs the CFA and chooses to standardize the factors instead of fixing a loading to 1
BSPAfit <- cfa(BSPAmodel, data = BSPA, std.lv=TRUE)

summary(BSPAfit, fit.measures = TRUE)

## Plotting
library(semPlot)
semPaths(BSPAfit, what="est", layout="circle", title=T, style="LISREL") 
