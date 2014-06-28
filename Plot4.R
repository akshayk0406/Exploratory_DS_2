source("read.R")
scc_coal <- SCC[grep("coal", SCC$Short.Name, ignore.case = TRUE),]
neir_coal <- NEI[(NEI$SCC %in% scc_coal$SCC),]
tc <- aggregate(neir_coal$Emissions ~ neir_coal$year,neir_coal,sum)
png(filename="plot4.png")
plot(tc,xlab="Year",ylab="Coal Emissions",title("Change in Emissions from Coal combustion-related sources"))
dev.off();


