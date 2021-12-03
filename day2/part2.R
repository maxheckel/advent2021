library(tidyverse)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
data <- read_delim('input.txt', delim = ' ', col_names = c('direction', 'amount'))
print(data)
horizontal = 0
depth = 0
aim = 0
for (i in 0:nrow(data)){
  currentDirection <- data[i, "direction"]
  currentAmount <- data[i, "amount"]
  if (isTRUE(currentDirection == "forward")){
    horizontal = horizontal + currentAmount
    depth = depth + aim*currentAmount
  }
  if(isTRUE(currentDirection == "up")){
    aim = aim - currentAmount
  }
  if(isTRUE(currentDirection == "down")){
    aim = aim + currentAmount
  }
}

print(horizontal*depth)

