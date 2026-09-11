
############################# BIENVENUE #############################

############# I SOLEMNLY SWEAR THAT I AM UP TO NO GOOD ##############

#################################
## Loading packages

library(lavaan)

#################################

n <- 400 ## sample size

rm <- matrix(c( ## correlations reported by Suriano & Valentino (2026)
  
   1.000, -0.185, -0.155, -0.149, 
  -0.185,  1.000,  0.230,  0.296,
  -0.155,  0.230,  1.000,  0.235,
  -0.149,  0.296,  0.235,  1.000), nrow=4)

colnames(rm) <- rownames(rm) <- c("ACE","RE","PH","AT") ## names of variables
nv <- nrow(rm)

#################################
## Alternative model

altmod <- "

## Loadings

CSE =~ ACE+1*RE+PH+AT

## Intercepts, set to zero

ACE ~ 0*1
RE ~ 0*1
PH ~ 0*1
AT ~ 0*1

CSE ~ 0*1

## (Error) variances

ACE ~~ ACE
RE ~~ RE
PH ~~ PH
AT ~~ AT

CSE ~~ CSE

"

fit.alt <- lavaan(altmod, sample.cov=rm, ## fitting model to data 
            sample.nobs=n, sample.mean=rep(0,nv))

summary(fit.alt, fit.measures=T, ci=T, standardized=T, rsq=T) ## the results


########################## MISCHIEF MANAGED #########################

############################# AU REVOIR #############################


