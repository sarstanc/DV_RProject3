#import libraries
library("RCurl")
library("reshape2")
library("ggplot2")
library("jsonlite")
require(tidyr)
require(dplyr)
#import data

dfPOPULATION <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from POPULATION"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

head(dfPOPULATION)
