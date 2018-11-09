## ----include=FALSE-------------------------------------------------------
require(knitr)
opts_chunk$set(
concordance=FALSE, echo=TRUE, cache=FALSE, warning=FALSE, error=FALSE, message=TRUE, fig.height=4, size = "footnotesize")

def.chunk.hook  <- knitr::knit_hooks$get("chunk")
knitr::knit_hooks$set(chunk = function(x, options) {
  x <- def.chunk.hook(x, options)
  ifelse(options$size != "normalsize", paste0("\\", options$size,"\n\n", x, "\n\n \\normalsize"), x)
})

## ----setLicense, child = 'license.Rmd', eval =F--------------------------
## NA

## ---- eval=FALSE---------------------------------------------------------
##     library(readxl)
##     diabetes <- read_excel("datasets/diabetes.xls")
##     summary(diabetes)

## ---- echo=FALSE---------------------------------------------------------
    library(readxl)
    diabetes <- read_excel("datasets/diabetes.xls")
    summary(diabetes)

## ------------------------------------------------------------------------
    library(forcats)
    diabetes$mort <- as_factor(diabetes$mort)
    diabetes$tabac <- as_factor(diabetes$mort)
    diabetes$ecg <- as_factor(diabetes$ecg)
    diabetes$chd <- as_factor(diabetes$chd)

## ------------------------------------------------------------------------
    summary(diabetes)

## ----eval=FALSE----------------------------------------------------------
##     for (val in sequence)
##     {
##     statement
##     }

## ------------------------------------------------------------------------
    diabetes <- data.frame(read_excel("datasets/diabetes.xls"))
are_char <- c(2,7,10,11)
    for (i in are_char) {
      diabetes[,i]<-as_factor(diabetes[,i])
    cat(colnames(diabetes)[i], class(diabetes[,i]), "\n")
    }

## ------------------------------------------------------------------------
summary(diabetes)

## ----eval=FALSE----------------------------------------------------------
##     if (test_expression) {
##         statement
##       }

## ----eval=FALSE----------------------------------------------------------
##     if (test_expression) {
##         statement_1
##     }else{
##         statement_2
##       }

