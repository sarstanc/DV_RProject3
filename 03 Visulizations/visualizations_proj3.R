#This graph demonstrates that there are some crime types that are more prevailent than others, the most being vehicle burglary, accounting for more than 8.5% of all crimes reported
p <- ggplot(df,aes(x = "", fill = CRIME_TYPE)) + geom_bar(width = 1)
p <- p + coord_polar(theta = "y") + ggtitle("Percentage of Crime Type")
p
#This graph demonstrates the more frequent crimes that occur around the early morning and night hours. The suspicious spike at exactly noon may be something that is entered when the reported time was not availiable or perhaps some reports do not get processed until that exact time.
r <- ggplot(df, aes(x=TIME))
r <- r + geom_histogram() + ggtitle("Popular times for crime")
r
#The cyclical nature of this graph proves that different days in the week invoke more crime than others (weekends). The fact that this repeats weekly proves this is a common trend in crimes or at least the reporting of crimes.
q <- ggplot(df, aes(x=DATE_I))
q <- q + geom_histogram()+ ggtitle("Crimes by date")
q
