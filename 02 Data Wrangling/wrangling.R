#import libraries
library("RCurl")
library("reshape2")
library("ggplot2")
require(tidyr)
require(dplyr)
#import data

df <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from DIAMONDS"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

# SHORTEST COMMUTE TIMES BY ZIPCODE
dfPERCENT<- df %>% group_by(CRIME_TYPE) %>% summarise(Percentage = (n()/2833)*100, n = n()) %>% arrange(desc(n)) %>% tbl_df()
dfPERCENT

# AVERAGE COMMUTE TIMES ORDERED BY ZIPCODE


