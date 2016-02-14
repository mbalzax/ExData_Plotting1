### Exploratory Data Analisys course - Week 1 Assigment
### This function reads a text file frow the working directory and loads it
### into a dataset. Then It draws the required plot and saves it to a png file
### Source : UC Irvine Machine Learning Repository - "Individual household electric power consumption Data Set"

plot4 <-function () 
{
  ### Reading and subsetting the data
  datos<-read.table("household_power_consumption.txt",sep=";", na.strings = "?", stringsAsFactors = FALSE, header = TRUE)
  data1<-subset(datos, Date=="1/2/2007" | Date== "2/2/2007")

  
  ### Formating the Date and Time columns
  data1$Date<-as.Date (data1$Date, "%d/%m/%Y" )
  data1$Time<-strptime(paste(data1$Date,data1$Time) , format = "%Y-%m-%d %H:%M:%S")

    
  ### Drawing the plot and saving it to a PNG file
  
  par(mfrow=c(2,2))
  plot(data1$Time, data1$Global_active_power , type = "l" , main = "" , ylab = "Global Active Power" , xlab="")
  plot(data1$Time, data1$Voltage , type = "l" , main = "" , ylab = "Voltage" , xlab="datetime")
  plot(data1$Time,  data1$Sub_metering_1  ,type = "l" , ylab = "Energy sub metering" , xlab="")
  lines(data1$Time, data1$Sub_metering_2  ,type = "l" , col="red")
  lines(data1$Time, data1$Sub_metering_3  ,type = "l" , col="blue")
  legend('topright', names(data1)[c(7,8,9)] , lty=1, col=c('black','red', 'blue'), bty='n', cex=.75)
  plot(data1$Time, data1$Global_reactive_power , type = "l" , main = "" , ylab = "Global_reactive_power" , xlab="datetime")
  
  dev.copy(png,'plot4.png', width=480, height=480)
  dev.off()  
}
