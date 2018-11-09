#Ctrl l, para borrar


# Instalar Bioconductor Packcages

source("https://bioconductor.org/biocLite.R")
biocLite()


# El siguiente comando nos arrojará la lista de los paquetes que ya tenemos instalados

library()

..................................................................................


# Colócate en el directorio donde esté la tabla de trabajo
Desde la consola ves a Archivo-Cambiar Dir...



............................................................................................

# Test de normalidad de Shapiro-Wilk (Si p>0.05 los datos siguen una distribución normal)

my_data <- read.table ("marker1.csv", header = TRUE, sep = ",", quote = "\"’", dec = ".")
my_data
set.marker1 (14)
x <- rnorm (14)
x.test <- shapiro.test(x)
print(x.test)


# Dado un vector dibuja el histograma asociado y la distribución normal

plot <- function(x,main="Histograma de frecuencias \ny distribución normal",ACCNBR,RESULT_marker1_methodA) {
  min <- min(x)
  max <- max(x)
  media <- mean(x)
  dt <- sd(x)
 
  hist(x,freq=F,main=main,xlab="ACCNBR",ylab="RESULT_marker1_methodA")
  curve(dnorm(x,media,dt), min, max,add = T,col="blue")
}
 
plot(x,main="Distribución normal")



# Creamos una variable con distribución uniforme (no normal) con 14 valores
x2 <- marker1 (14) 
x2.test <- shapiro.test(x2)
print(x2.test)

plotn <- function(x2,main="Histograma de frecuencias \ny distribución uniforme",
                  xlab="ACCNBR",ylab="RESULT_marker1_methodA") {
  min <- min(x)
  max <- max(x)
  media <- mean(x)plot(
  dt <- sd(x)
 
  hist(x,freq=F,main="METHOD-A",xlab="ACCNBR",ylab="RESULT_marker1_methodA")
  curve(dnorm(x,media,dt), min, max,add = T,col="blue")
}
my_data

#Crear Dta.frame
data.frame("marker1", x= "RESULT_marker1_methodA", y= RESULT_marker1_methodB)

..........................................................................................................................



# Cálculo de la correlación: correlación de Pearson; Correlación de Spearman; Lin concordance correlation coefficient


# correlación de Pearson (test paramétrico) entre dos variables(Un valor de P-value mayor de 0.05 nos indica que no existe correlación entre ambas variables)

my_data <- read.table ("marker1.csv", header = TRUE, sep = ",", quote = "\"’", dec = ".")
my_data
cor (my_data$methodA, my_data$methodB)
test <- cor.test(my_data$methodA, my_data$methodB)
print(test)



# Correlación de Spearman (test no paramétrico)
install.packages("pspearman")
library(pspearman)
spearman.test(my_data$methodA, my_data$methodB, approximation = "exact")

Esta prueba genera un valor de S, un valor de probabilidad y un rho (el r de Spearman). 
Recuerden que esta es una prueba no paramétrica que funciona ordenando los datos, y esta función en ocasiones advierte 
que no puede calcular el valor exacto de probabilidad porque hay "empates" 
(Warning message: In spearman.test(averts, pCbeltFish, approximation = "exact") : 
Cannot compute exact p-values with ties). 

Entonces, podemos llamar otra función que se llama pspearman,
y le damos el valor de S que acabamos de calcular, los grados de libertad, 
y la aproximación. Entonces la forma general es: pspearman(S, grados.de.libertad, approximation = "exact")

pspearman (S, grados de libertad, approximation = "exact")



# Lin concordance correlation coefficient

The statistic, ?c, is an index of how well a new test or measurement (Y) reproduces a gold standard test. 

library(epiR)
epi.ccc(my_data$methodA, my_data$methodB, ci = "z-transform", conf.level = 0.95, rep.measure = FALSE, subjectid)
help(epi.ccc)


INTERPRETACION LIN CCC:

A list containing the following:
rho.c    the concordance correlation coefficient.
s.shift  the scale shift.
l.shift  the location shift.
C.b      a bias correction factor that measures how far the best-fit line deviates from a line at 45 degrees. No deviation from the 45 degree line occurs when C.b = 1. See Lin (1989, page 258).
blalt    a data frame with two columns: mean the mean of each pair of measurements, delta vector y minus vector x.
sblalt   a data frame listing the average difference between the two sets of measurements, the standard deviation of the difference between the two sets of measurements and the lower and upper confidence limits of the difference between the two sets of measurements. If rep.measure == TRUE the confidence interval of the difference is adjusted to account for repeated observations across individual subjects.
nmissing a count of the number of measurement pairs ignored due to missingness.

............................................................................................


# Gráficos de dispersión

plot(my_data$RESULT_marker1_methodA)
plot(my_data$RESULT_marker1_methodB)

