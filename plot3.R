### Exploratory Data Analisys course - Week 1 Assigment
### This function reads a text file frow the working directory and loads it
### into a dataset. Then It draws the required plot and saves it to a png file
### Source : UC Irvine Machine Learning Repository - "Individual household electric power consumption Data Set"

plot3 <-function () 
{
  ### Reading and subsetting the data
  datos<-read.table("household_power_consumption.txt",sep=";", na.strings = "?", stringsAsFactors = FALSE, header = TRUE)
  data1<-subset(datos, Date=="1/2/2007" | Date== "2/2/2007")

  
  ### Formating the Date and Time columns
  data1$Date<-as.Date (data1$Date, "%d/%m/%Y" )
  data1$Time<-strptime(paste(data1$Date,data1$Time) , format = "%Y-%m-%d %H:%M:%S")

    
  ### Drawing the plot and saving it to a PNG file
  plot(data1$Time,  data1$Sub_metering_1  ,type = "l" , ylab = "Energy sub metering" , xlab="")
  lines(data1$Time, data1$Sub_metering_2  ,type = "l" , col="red")
  lines(data1$Time, data1$Sub_metering_3  ,type = "l" , col="blue")
  legend('topright', names(data1)[c(7,8,9)] , lty=1, col=c('black','red', 'blue'), bty='o', cex=.75)
  
  dev.copy(png,'plot3.png', width=480, height=480)
  dev.off()

}
