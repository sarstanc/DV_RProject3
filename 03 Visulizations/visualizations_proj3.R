# population by zipcode
pop <- ggplot(dfJOIN, aes(x=ZIP_CODE))
pop <- pop + geom_histogram() + ggtitle("Population by Zipcode")
pop

# commute times by zipcode including margin of error
