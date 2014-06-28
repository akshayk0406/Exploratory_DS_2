source("read.R")
library(ggplot2)

NEIB <- NEI[(NEI$fips == "24510"),]
NEIB$year <- factor(NEIB$year,levels=c(1999,2002,2005,2008))
p <- ggplot(data=NEIB,aes(x=year, y=Emissions)) + ggtitle("Pollution from different types of sources in Baltimore City") + facet_grid( . ~ type) + ylab(expression(paste('PM'[2.5], ' Emissions'))) + xlab('Year')  + geom_line()
ggsave(filename="plot3.png",plot=p)
