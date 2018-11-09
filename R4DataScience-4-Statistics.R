## ---- message=FALSE------------------------------------------------------
# install.packages("dplyr", dependencies = TRUE)
# install.packages("ggplot2", dependencies = TRUE)
# install.packages("readxl", dependencies = TRUE)

library(dplyr)
library(ggplot2)
library(readxl)

## ---- size="footnotesize", message=FALSE---------------------------------
diab <- read_excel("datasets/diabetes_mod.xls")

## ---- size="tiny"--------------------------------------------------------
diab[1:4, 1:8]

## ----size="tiny"---------------------------------------------------------
head(diab)

## ------------------------------------------------------------------------
dim(diab)
nrow(diab)
colnames(diab)

## ----size="tiny"---------------------------------------------------------
glimpse(diab)

## ----size="tiny"---------------------------------------------------------
diab <- diab %>% mutate_if(is.character, as.factor)

glimpse(diab)

## ------------------------------------------------------------------------
diab$mort <- recode_factor(diab$mort, "Muerto" = "muerto")
levels(diab$mort)

## ------------------------------------------------------------------------
diab$mort <- recode_factor(diab$mort, "muerto" = "Muerto")
levels(diab$mort)

## ----size="tiny"---------------------------------------------------------
#display all the values
diab$edat

## ----size="tiny"---------------------------------------------------------
# Get the unique values of edat
diab$edat %>% unique()
diab$edat %>% unique() %>% length()

## ----size="tiny"---------------------------------------------------------
#Mean, median and rang
mean(diab$edat)
median(diab$edat)
sd(diab$edat)
var(diab$edat)
range(diab$edat)

## ----size="tiny"---------------------------------------------------------
diab %>% 
  group_by(tabac, ecg) %>%
  summarize(mean(edat))

## ----size="tiny"---------------------------------------------------------
summary(diab[, 2:11])

## ----size="tiny"---------------------------------------------------------
mean(diab$sbp)

## ----size="tiny"---------------------------------------------------------
diab$sbp

## ----size="tiny"---------------------------------------------------------
?mean
mean(diab$sbp, na.rm = TRUE)
is.na(diab$sbp)

## ------------------------------------------------------------------------
sum(is.na(diab$sbp))
sum(is.na(diab$dbp))

## ------------------------------------------------------------------------
ggplot(diab, aes(edat)) + 
  geom_histogram(bins = 30)

## ------------------------------------------------------------------------
ggplot(diab, aes(dbp)) + 
  geom_histogram(bins = 30)

## ------------------------------------------------------------------------
ggplot(diab, aes(tempsviu, sbp, col = ecg)) + 
  geom_point()

## ----echo=FALSE----------------------------------------------------------
ggplot(diab, aes(tempsviu, sbp, col = ecg)) + 
  geom_point(size = 4, pch = 17) +
  geom_smooth(lwd=2, se=FALSE, method="lm", col="red")



## ----echo=FALSE, fig.height=6--------------------------------------------
ggplot(diab, aes(tempsviu, sbp, col = ecg)) +
  geom_point(size = 4, pch = 17) +
  geom_smooth(lwd = 2, se=FALSE, method="lm", col="red") +
  facet_wrap(~ ecg, ncol = 1)

## ------------------------------------------------------------------------
ggplot(diab, aes(tabac, edat)) + 
  geom_boxplot()

## ------------------------------------------------------------------------
ggplot(diab, aes(x= reorder(tabac, edat), y = edat)) + 
  geom_boxplot()

## ----eval=FALSE, echo=FALSE----------------------------------------------
## diab %>%
##  filter(dbp < 500) %>%
##  ggplot(aes(sbp, dbp)) +
##  geom_point(size = 4, pch = 17, col = "blue") +
##  geom_smooth(lwd = 2, se=FALSE, method="lm", col="red")

## ------------------------------------------------------------------------
levels(diab$tabac)

diab$tabac <- recode_factor(diab$tabac, "Ex fumador" = "Fumador")

levels(diab$tabac)

## ------------------------------------------------------------------------
t.test(bmi ~ chd, data = diab)

## ------------------------------------------------------------------------
t.test(edat ~ tabac, data = diab)

## ------------------------------------------------------------------------
ggplot(diab, aes(tempsviu)) + 
  geom_histogram(bins = 30)

## ------------------------------------------------------------------------
wilcox.test(tempsviu ~ chd, data = diab)

## ------------------------------------------------------------------------
xtabs(~ chd + tabac, data = diab)

addmargins(xtabs(~ chd + tabac, data = diab))

## ------------------------------------------------------------------------
chisq.test(xtabs(~ chd + tabac, data = diab))

## ------------------------------------------------------------------------
fisher.test(xtabs(~ chd + tabac, data = diab))

## ------------------------------------------------------------------------
mosaicplot(xtabs(~ chd + tabac, data = diab))

## ----eval=FALSE, echo=FALSE----------------------------------------------
## xtabs(~ mort + tabac, data = diab)
## mosaicplot(xtabs(~ mort + tabac, data = diab))
## chisq.test(xtabs(~ mort + tabac, data = diab))

## ----eval=FALSE----------------------------------------------------------
## t.test(edat ~ ecg, data = diab)
## 
## Error in t.test.formula(edat ~ ecg, data = diab) :
##   grouping factor must have exactly 2 levels

## ------------------------------------------------------------------------
fit <- lm(edat ~ ecg, data = diab)
anova(fit)

## ----size="tiny"---------------------------------------------------------
TukeyHSD(aov(fit))

## ------------------------------------------------------------------------
ggplot(diab, aes(ecg, edat)) + 
  geom_boxplot()

## ----size="tiny"---------------------------------------------------------
fit <- lm(edat ~ sbp, data = diab)
summary(fit)


## ----echo=FALSE, fig.height=6--------------------------------------------
ggplot(diab, aes(sbp, edat)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)

