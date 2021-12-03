library(tidyverse)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
data <- read_delim('input.txt', delim = ' ', col_names = c('direction', 'amount'))
print(data)
horizontal = 0
depth = 0
for (i in 0:nrow(data)){
  currentDirection <- data[i, "direction"]
  currentAmount <- data[i, "amount"]
  if (isTRUE(currentDirection == "forward")){
    horizontal = horizontal + currentAmount
  }
  if(isTRUE(currentDirection == "up")){
    depth = depth - currentAmount
  }
  if(isTRUE(currentDirection == "down")){
    depth = depth + currentAmount
  }
}

print(horizontal*depth)

