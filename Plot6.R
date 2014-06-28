source("read.R")
library(plyr)
library(ggplot2)
SCC_M <- SCC[grep("motor",SCC$Short.Name ,ignore.case=TRUE),]
NEIB  <- NEI[NEI$fips == "24510",]
NEIL  <- NEI[NEI$fips == "06037",]
NEIB_R <- NEIB[NEIB$SCC %in% SCC_M$SCC,]
NEIB_L <- NEIL[NEIL$SCC %in% SCC_M$SCC,]
res_r  <- ddply(NEIB_R,.(year),summarize,sum_emissions=sum(Emissions))
res_l  <- ddply(NEIB_L,.(year),summarize,sum_emissions=sum(Emissions))
res_r$fips <- rep("24510",nrow(res_r))
res_l$fips <- rep("06037",nrow(res_l))
res <- rbind(res_r,res_l)
res$fips <- factor(res$fips,levels=c("24510","06037"),labels=c("Baltimore","LA"))
g <- qplot(year,sum_emissions,data=res,color=fips,geom=c("point","line"))
g + labs(y = "Total Emissions") + ggtitle("Emissions Comparison in LA and Baltimore") + geom_point()
ggsave(filename="plot6.png",plot=g)
