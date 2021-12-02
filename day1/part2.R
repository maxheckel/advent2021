data <- read.csv("input1.txt")
# convert it from a data frame to a vector
input <- data[["ids"]]
class(input)

len = length(input)
print(input[0])
incrementing <- 0
for (i in 3:len){
  bVal <- input[i] + input[i-1] + input[i-2]
  aVal <- input[i-1] + input[i-2] + input[i-3]

  
  if(isTRUE(aVal < bVal)) {
    incrementing = incrementing + 1
  }
  
}

print(incrementing)