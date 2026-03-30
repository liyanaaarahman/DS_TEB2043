install.packages("plotrix")
library(plotrix)
data()
#Load whole dataset
data(mtcars)
#Print the first 10 rows
print(head(mtcars,10))

#Store only 2 colums in a variable
input <- mtcars[,c('mpg','cyl')]
#Print the first 5 rows
print(head(input))

demo(graphics)
demo(image)
#Press Enter to see image

#create pie chart
x <- c(21,62,10,53)
labels <- c("London","New York","Singapore","Mumbai")
pie(x,labels)

pie(x,labels,main = "City pie chart",col=rainbow(length(x)))

piepercent<- round(100*x/sum(x), 1) 
# Plot the chart. 
pie(x, labels = piepercent, main = "City pie chart",col = 
      rainbow(length(x))) 
legend("topright", c("London","New York","Singapore","Mumbai"), cex 
       = 0.8,fill = rainbow(length(x))) 
pie3D(x,labels = lbl,explode = 0.1, main = "Pie Chart of Countries") 

#Plot box plot
boxplot(mpg ~ cyl, data = mtcars, xlab = "Number of Cylinders", 
        ylab = "Miles Per Gallon", main = "Mileage Data")

#Box plot with notch
boxplot(mpg ~ cyl, data = mtcars,  
       xlab = "Number of Cylinders", 
       ylab = "Miles Per Gallon",  
       main = "Mileage Data", 
       notch = TRUE,  
       varwidth = TRUE,
       col = c("green","yellow","purple"), 
       names = c("High","Medium","Low") 
) 

#Create histogram
v <-  c(9,13,21,8,36,22,12,41,31,33,19) 
hist(v,xlab = "Weight",col = "yellow",border = "blue") 

#Creating Histogram Range of X and Y values  
v <- c(9,13,21,8,36,22,12,41,31,33,19) 
hist(v,xlab = "Weight",col = "green",border = "red", xlim = c(0,40), 
     ylim = c(0,5), breaks = 5) 

#Scatter plot
# Get the input values. 
input <- mtcars[,c('wt','mpg')] 
# Plot the chart 
plot(x = input$wt,y = input$mpg, 
     xlab = "Weight", 
     ylab = "Milage", 
     xlim = c(2.5,5), 
     ylim = c(15,30),    
     main = "Weight vs Milage")  

#Scatter plot matrices
# Plot the matrices between 4 variables giving 12 plots. 
# One variable with 3 others and total 4 variables. 
pairs(~wt+mpg+disp+cyl,data = mtcars, 
      main = "Scatterplot Matrix") 

#Bar chart
# Create the data for the chart 
H <- c(7,12,28,3,41) 
# Plot the bar chart  
barplot(H) 
# 
# Creating Bar Chart Labels, Title and Colors 
H <- c(7,12,28,3,41) 
M <- c("Mar","Apr","May","Jun","Jul") 
barplot(H,names.arg=M,xlab="Month",ylab="Revenue",col="blue", 
        main="Revenue chart",border="red") 

#Creating Group Bar Chart and Stacked Bar Chart
# Create the input vectors. 
colors = c("green","orange","brown") 
months <- c("Mar","Apr","May","Jun","Jul") 
regions <- c("East","West","North") 
# Create the matrix of the values. 
Values <- matrix(c(2,9,3,11,9,4,8,7,3,12,5,2,8,10,11), nrow = 3, 
                 ncol = 5, byrow = TRUE) 
# Create the bar chart 
barplot(Values, main = "total revenue", names.arg = months, xlab = 
          "month", ylab = "revenue", col = colors) 
# Add the legend to the chart 
legend("topleft", regions, cex = 1.3, fill = colors) 

#Line Graph
v <- c(7,12,28,3,41) 
plot(v,type = "o") 

# Creating Line Chart Title, Color and Labels  
plot(v,type = "o", col = "red", xlab = "Month", ylab = "Rain fall", 
     main = "Rain fall chart") 

#Creating Multiple Lines in a Line Chart   
# Add more data for the chart. 
t <- c(14,7,6,19,3) 
plot(v,type = "o",col = "red", xlab = "Month", ylab = "Rain fall",  
     main = "Rain fall chart") 
lines(t, type = "o", col = "blue") 
