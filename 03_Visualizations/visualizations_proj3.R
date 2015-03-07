# population by zipcode
pop <- ggplot(dfJOIN, aes(x=ZIP_CODE, y=CENSUS_POPULATION))
pop <- pop + geom_point() + ggtitle("Population by Zipcode")
pop

# commute times by population
commute <- ggplot(dfJOIN, aes(x=CENSUS_POPULATION))
commute <- commute + geom_histogram() + ggtitle("Commute times by Population")
commute

# average error in calculating commutes
error <- ggplot(dfJOIN, aes(x=COMMUTE_TIME_MINS_EST, y=MARGIN_OF_ERROR))
error <- error + geom_point() + ggtitle("Error in Commute Times")
error
