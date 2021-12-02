data <- read.csv("input1.txt",)
# convert it from a data frame to a vector
input <- data[,1]
class(input)

len = length(input)
incrementing <- 0
for (i in 1:len){
  
  if(isTRUE(input[i] > input[i-1])) {
    incrementing = incrementing + 1
  }
  
}
print(incrementing)