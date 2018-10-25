
## ------------------------------------------------------------------------
# install.packages("tidyverse", dependencies = TRUE)
library(tidyverse)

## ---- size="footnotesize"------------------------------------------------
require(readxl)
diab <- read_excel("datasets/diabetes.xls")
diab_filt <- filter(diab, tabac == "No fumador", edat >= 50)
head(diab_filt, n = 4)

## ------------------------------------------------------------------------
diab_small <- select(diab, mort, edat, tabac, sbp)
head(diab_small, n = 4)

## ------------------------------------------------------------------------
# sort, with males before 'vivo', then by age, youngest first
diab_sort <- arrange(diab, desc(mort), edat) 
head(diab_sort, n = 4)

## ---- size="tiny"--------------------------------------------------------
diab_mut <- mutate(diab,
            edatcat = cut(edat, breaks = c(40,50,60,70,120)),
            highbmi = bmi > mean(bmi))
head(diab_mut, n = 4)

## ---- eval = FALSE-------------------------------------------------------
## table(diab_mut$edatcat, diab_mut$highbmi)



## ------------------------------------------------------------------------
diab40 <- filter(diab, mort == "Vivo" & edat < 40)
diab40_small <- select(diab40, edat, dbp)
head(diab40_small,n = 4)

## ------------------------------------------------------------------------
diab40_small <- diab %>%   
  filter(mort == "Vivo" & edat < 40) %>% 
  select(edat, dbp)
head(diab40_small,n = 4)

## ---- eval = F-----------------------------------------------------------
## df <- filter(diab,sbp > 160 | tabac == "Fumador")
## 
## dfs <- select(df, edat,bmi,sbp,sbp)
## 
## dfsa <- arrange(dfs, desc(tempsviu))
## 

## ---- eval = F, echo=F---------------------------------------------------
## diab %>%
##   filter(sbp > 160 | tabac == "Fumador") %>%
##   select(edat,tempsviu,bmi,sbp,sbp) %>%
##   arrange(desc(tempsviu))
## 

## ------------------------------------------------------------------------
band_members

band_instruments

## ------------------------------------------------------------------------
bind_rows(band_members, band_instruments)


## ------------------------------------------------------------------------

bind_cols(band_members, band_instruments)

## ------------------------------------------------------------------------
band_members %>% 
	inner_join(band_instruments, by = "name")

## ------------------------------------------------------------------------
band_members %>% 
	left_join(band_instruments)

## ---- eval = F-----------------------------------------------------------
## band_members %>%
## 	right_join(band_instruments)

## ---- eval = F-----------------------------------------------------------
## band_members %>%
## 	full_join(band_instruments)

## ---- size="tiny"--------------------------------------------------------
dept <- read_csv("datasets/dept1.csv")
dept_by_year <- dept %>% 
  gather(key = "year", value = "grad", -id)
dept_by_year

## ---- size="tiny"--------------------------------------------------------
worms <- read_csv("datasets/worms.csv")
head(worms, n = 6)

## ------------------------------------------------------------------------
by_worm <- worms %>% 
  spread(key = feature, value = measure)
by_worm

