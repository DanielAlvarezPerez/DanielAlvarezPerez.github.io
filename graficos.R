
library(dplyr)
library(ggvis)
library(lubridate)
library(Quandl)
library(ggplot2)
library(manipulate) 
library(dygraphs)
library(xts)
library(wbstats)
library(WDI)
library(gdata)
datos_clase2 <- wbcache(lang = "es")

BOLIVIA = WDI(indicator = c("NE.TRD.GNFS.ZS","BG.GSR.NFSV.GD.ZS","NV.AGR.TOTL.ZS","NV.IND.MANF.ZS","NY.GDP.MKTP.KD"),
              country = c("BO"),
              start = 1976, end = 2018 , extra = TRUE)

BOLIVIA <-rename.vars(BOLIVIA, c("NE.TRD.GNFS.ZS","BG.GSR.NFSV.GD.ZS","NV.AGR.TOTL.ZS","NV.IND.MANF.ZS","NY.GDP.MKTP.KD"),c("COMERCIO","SERVICIOS","AGRICULTURA","INDUSTRIALIZACION","PIB"))


C <- (((BOLIVIA$COMERCIO/100)*BOLIVIA$PIB)/1000000)
S <- (((BOLIVIA$SERVICIOS/100)*BOLIVIA$PIB)/1000000)
I <- (((BOLIVIA$INDUSTRIALIZACION/100)*BOLIVIA$PIB)/1000000)

x <-matrix(c(C,S,I), ncol = 3)
colnames(x)<-c("Comercio","Servicios","Industria")
t<- seq(as.Date('1976-01-01'),as.Date('2017-01-01'),by = "years")
Datos <- xts(x,order.by = t)


GRAPH1 <- cbind(Datos)
dygraph(GRAPH1) %>% 
  dyRangeSelector()
dygraph(GRAPH1, main ="Actividad Económica en Bolivia(millones de dólares)") %>% 
  dyOptions(stackedGraph = TRUE) %>%
  dyRangeSelector(height = 60)




