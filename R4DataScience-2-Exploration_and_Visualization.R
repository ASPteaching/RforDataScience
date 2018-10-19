## ----setLicense, child = 'license.Rmd'-----------------------------------



## ----eval=FALSE----------------------------------------------------------
## install.packages('tidyverse')

## ----eval=FALSE----------------------------------------------------------
## install.packages('ggplot2')

## ------------------------------------------------------------------------
library(readxl)
diabetes <- read_excel("datasets/diabetes.xls")
head(diabetes)

## ------------------------------------------------------------------------
require(dplyr)
diabetesF <- filter(diabetes, tabac=='Fumador')
dim(diabetesF)

## ----fig.height=4--------------------------------------------------------
library(ggplot2)
ggplot(diabetes)+geom_point(aes(x=edat,y=sbp))

## ----eval=FALSE----------------------------------------------------------
## ggplot(data=diabetes,aes(x=edat,y=sbp))+geom_point()

## ----eval=FALSE----------------------------------------------------------
## ggplot()+geom_point(data=diabetes,aes(x=edat,y=sbp))

## ----fig.height=2--------------------------------------------------------
ggplot(diabetes)+geom_bar(aes(x=as.factor(ecg)))

## ----fig.height=2--------------------------------------------------------
ggplot(diabetes)+geom_histogram(aes(x=bmi),bins=10)


## ----fig.height=4--------------------------------------------------------
ggplot(diabetes)+geom_point(aes(x=edat,y=sbp, col=tabac))

## ----fig.height=4--------------------------------------------------------
ggplot(diabetes)+geom_point(aes(x=edat,y=sbp, col=tabac, shape=chd))

## ----fig.height=2--------------------------------------------------------
ggplot(diabetes)+geom_point(aes(x=edat, y=sbp), col='red')

## ----fig.height=2--------------------------------------------------------
ggplot(diabetes)+geom_point(aes(x=edat, y=sbp, col='red'))

## ----eval=FALSE----------------------------------------------------------
## (p <- ggplot(diabetesF, aes(x=edat, y=sbp)))
## (p<- p + geom_point())
## (p<- p + geom_smooth(method='lm'))

## ---- fig.height=4-------------------------------------------------------
(p<- ggplot(diabetes, aes(x=chd, y=tempsviu)) +   geom_boxplot())
(p<- p+ ggtitle("Relation between temps viu and chardiac disease"))

## ----fig.height=3--------------------------------------------------------
ggplot(diabetesF, aes(x=edat, y=sbp))+ geom_point() + geom_text(aes(label=chd), size = 3)

## ----eval=FALSE----------------------------------------------------------
## install.packages("ggrepel")

## ----eval=FALSE----------------------------------------------------------
## require(ggrepel)
## ggplot(diabetesF, aes(x=edat, y=sbp))+ geom_point() +
##   geom_label_repel(aes(label=chd), size = 3)

## ----echo=FALSE, fig.height=4--------------------------------------------
require(ggrepel)
ggplot(diabetesF, aes(x=edat, y=sbp))+ geom_point() + geom_label_repel(aes(label=chd), size = 3)

## ------------------------------------------------------------------------
require(readr)
housing <- read_csv("datasets/landdata-states.csv")

## ----eval=FALSE----------------------------------------------------------
## p5 <- ggplot(housing, aes(x = Date, y = Home.Value))
## p5 + geom_line(aes(color = State))

## ----fig.height=4--------------------------------------------------------
p5 <- ggplot(housing, aes(x = Date, y = Home.Value))
p5 + geom_line(aes(color = State)) 

## ----eval=FALSE----------------------------------------------------------
## p5 <- ggplot(housing, aes(x = Date, y = Home.Value))
## (p5 <- p5 + geom_line() +
##    facet_wrap(~State, ncol = 10))

## ----echo=FALSE, fig.height=4--------------------------------------------
p5 <- ggplot(housing, aes(x = Date, y = Home.Value))
(p5 <- p5 + geom_line() +
   facet_wrap(~State, ncol = 10))

## ----eval=FALSE----------------------------------------------------------
##  ggplot(mtcars,aes(x=wt,y=mpg))+geom_point()+
## + geom_smooth()+
## + facet_grid(as.factor(am)~as.factor(gear))

## ----eval=FALSE----------------------------------------------------------
## args(geom_histogram)
## args (stat_bin)

## ---- fig.height=4-------------------------------------------------------
p <-ggplot(housing, aes(x = Home.Value))
(p<-p + geom_histogram())

## ---- fig.height=4-------------------------------------------------------
p<- ggplot(housing, aes(x = Home.Value))
(p<-p+geom_histogram(stat= 'bin', binwidth=4000))

