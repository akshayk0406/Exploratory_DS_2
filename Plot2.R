source("read.R")

NEIB <- NEI[(NEI$fips == "24510"),]
TotalYearEmission		<- aggregate(NEIB$Emissions ~ NEIB$year, NEIB, sum)
colnames(TotalYearEmission) 	<- c("Year","Emissions")
png(filename="plot2.png")
plot(TotalYearEmission,xlab="Year",ylab=expression(paste('PM', ''[2.5], ' in tons')),
     title(main=expression(paste('Change in Total Emissions from PM', ''[2.5],' in Baltimore City'))))
dev.off();
