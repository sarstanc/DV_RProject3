# categoricals
myplot <- function(df, x) {
  names(df) <- c("x", "n")
  ggplot(df, aes(x=x, y=n)) + geom_point()
}

categoricals <- eval(parse(text=substring(gsub(",)", ")", getURL(URLencode('http://129.152.144.84:5001/rest/native/?query="select * from COMMUTE_TIMES"'), httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL', USER='C##cs329e_sks2435', PASS='orcl_sks2435', MODE='native_mode', MODEL='model', returnFor = 'R', returnDimensions = 'True'), verbose = TRUE)), 1, 2^31-1)))


l <- list()
for (i in names(dfCOMMUTE)) { 
  if (i %in% categoricals[[1]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\", count(*) n from COMMUTE_TIMES group by \\\""i"\\\""'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_sks2435',PASS='orcl_sks2435',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON', i=i),verbose = TRUE)))
    p <- myplot(r,i)
    print(p) 
    l[[i]] <- p
  }
}

png("/Users/sarahstancik/Documents/Development/DataVisualization/DV_RProject3/01_Data/categoricals.png", width = 25, height = 10, units = "in", res = 72)
grid.newpage()
pushViewport(viewport(layout = grid.layout(1, 12)))   

print(l[[1]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:4))
print(l[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 5:8))
print(l[[3]], vp = viewport(layout.pos.row = 2, layout.pos.col = 9:12))

dev.off()


myplot1 <- function(df, x) {
  names(df) <- c("x")
  ggplot(df, aes(x=x)) + geom_histogram()
}

l1 <- list()
for (i in names(dfCOMMUTE)) {   
  if (i %in% categoricals[[2]]) {
    r <- data.frame(fromJSON(getURL(URLencode('129.152.144.84:5001/rest/native/?query="select \\\""i"\\\" from COMMUTE_TIMES"'),httpheader=c(DB='jdbc:oracle:thin:@129.152.144.84:1521:ORCL',USER='C##cs329e_sks2435',PASS='orcl_sks2435',MODE='native_mode',MODEL='model',returnDimensions = 'False',returnFor = 'JSON', i=i),verbose = TRUE)))
    p <- myplot1(r,i)
    print(p) 
    l1[[i]] <- p
  }
}

png("/Users/sarahstancik/Documents/Development/DataVisualization/DV_RProject3/01_Data/categoricals2.png", width = 25, height = 10, units = "in", res = 72)
grid.newpage()
pushViewport(viewport(layout = grid.layout(2, 12)))   

print(l1[[1]], vp = viewport(layout.pos.row = 1, layout.pos.col = 1:3))
print(l1[[2]], vp = viewport(layout.pos.row = 1, layout.pos.col = 4:6))
print(l1[[3]], vp = viewport(layout.pos.row = 1, layout.pos.col = 7:9))
print(l1[[4]], vp = viewport(layout.pos.row = 1, layout.pos.col = 10:12))

dev.off()
