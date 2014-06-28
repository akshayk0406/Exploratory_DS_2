source("read.R")
library(plyr)
SCC_M <- SCC[grep("motor",SCC$Short.Name ,ignore.case=TRUE),]
NEIB  <- NEI[NEI$fips == "24510",]
NEIB_R <- NEIB[NEIB$SCC %in% SCC_M$SCC,]
png(filename="plot5.png")
res <- ddply(NEIB_R,.(year),summarize,sum_emissions=sum(Emissions))
plot(res,xlab="Year",ylab="Coal Emissions",title("Change in Emissions from motor vehicle sources"))
dev.off();


