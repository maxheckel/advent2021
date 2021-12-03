library(tidyverse)

#sample
data <- read.fwf('sample.txt', widths = c(1, 1, 1, 1, 1))
flatData <- read_delim("sample.txt", "\n", col_names=FALSE)

# input
#data <- read.fwf('input.txt', widths = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1))
#flatData <- read_delim("input.txt", "\n", col_names=FALSE)
bits = c()

for (i in 1:ncol(data)){
  newBit = 0
  if(isTRUE(sum(data[paste("V", i, sep="")]) >= ceiling(nrow(data)/2))){
    newBit = 1
  }
  rowsToKeep = data[paste("V", i, sep="")] == newBit
  data=data[rowsToKeep,]
  bits = c(bits, newBit)
  bitsStr = paste(bits, collapse="")
  print(bitsStr)
  res = flatData %>% filter(substr(X1, 1, i) == bitsStr)
  if(isTRUE(length(res$X1) == 1)){
    oxygen = res$X1
  }
}
oxygenDec = strtoi(oxygen, base = 2)

data <- read.fwf('sample.txt', widths = c(1, 1, 1, 1, 1))

#data <- read.fwf('input.txt', widths = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1))
bits = c()
for (i in 1:ncol(data)){
  newBit = 1
  if(isTRUE(sum(data[paste("V", i, sep="")]) >= ceiling(nrow(data)/2))){
    newBit = 0
  }
  rowsToKeep = data[paste("V", i, sep="")] == newBit
  data=data[rowsToKeep,]
  bits = c(bits, newBit)
  bitsStr = paste(bits, collapse="")
  print(bitsStr)
  res = flatData %>% filter(substr(X1, 1, i) == bitsStr)
  if(isTRUE(length(res$X1) == 1)){
    co2 = res$X1
  }
}
co2Dec = strtoi(co2, base = 2)
print(co2Dec)