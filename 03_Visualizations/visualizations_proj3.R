# population by zipcode
pop <- ggplot(dfJOIN, aes(x=ZIP_CODE))
pop <- pop + geom_point() + ggtitle("Population by Zipcode")
pop

# commute times by population
commute <- ggplot(dfJOIN, aes(x=CENSUS_POPULATION))
commute <- commute + geom_histogram() + ggtitle("Commute times by Population")
commute

