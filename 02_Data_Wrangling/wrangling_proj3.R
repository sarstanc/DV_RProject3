# import libraries
library("RCurl")
library("reshape2")
library("ggplot2")
require(tidyr)
require(dplyr)
require("jsonlite")

# import data
dfCOMMUTE <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from COMMUTE_TIMES"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))
dfPOPULATION <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select * from POPULATION"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnDimensions = 'False', returnFor = 'JSON'), verbose = TRUE)))

# ERROR IN COMMUTE TIME ESTIMATES FOR POPULATION (LOW TO HIGH)
# inner join
dfINNER <- inner_join(dfCOMMUTE, dfPOPULATION, by="ZIP_CODE") %>% group_by(MARGIN_OF_ERROR) %>% summarise(POPULATION = max(CENSUS_POPULATION), n = n()) %>% arrange(POPULATION) %>% tbl_df()
dfINNER

# COMMUTE TIMES (HIGH TO LOW) BY POPULATION
# outer join (right_join)
# dfRIGHT <- right_join(dfCOMMUTE, dfPOPULATION, by="ZIP_CODE") %>% group_by(CENSUS_POPULATION) %>% summarise(TIME = max(COMMUTE_TIME_MINS_EST), n = n()) %>% tbl_df()
# dfRIGHT

# ZIPCODES WITH THE HIGHEST POPULATION
# full join - retain all values
dfJOIN <- full_join(dfCOMMUTE, dfPOPULATION, by="ZIP_CODE") %>% group_by(ZIP_CODE) %>% summarise(POPULATION = max(CENSUS_POPULATION), n = n()) %>% arrange(desc(POPULATION)) %>% tbl_df()
dfJOIN



