source("read.R")

TotalYearEmission		<- aggregate(NEI$Emissions ~ NEI$year, NEI, sum)
colnames(TotalYearEmission) 	<- c("Year","Emissions")
png(filename="plot1.png")
plot(TotalYearEmission,xlab="Year",ylab=expression(paste('PM', ''[2.5], ' in tons')),
     title(main=expression(paste('Change in Total Emissions from PM', ''[2.5]))))
dev.off();
