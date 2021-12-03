library(tidyverse)

#sample
#data <- read.fwf('sample.txt', widths = c(1, 1, 1, 1, 1))

# input
 data <- read.fwf('input.txt', widths = c(1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1))
bits = c()
for (i in 1:ncol(data)){
  if(isTRUE(sum(data[paste("V", i, sep="")]) > nrow(data)/2)){
    bits = c(bits, 1)
  } else {
    bits = c(bits, 0)
  }
}

gamma = paste(bits, collapse = '')
gammaDec = strtoi(gamma, base = 2)

# invert the bits, probably a cleaner way to do this but ¯\_(ツ)_/¯
for(i in 0:length(bits)){
  if(isTRUE(bits[i] == 1)){
    bits[i] = 0
  } else {
    bits[i] = 1
  }
}

epsilon = paste(bits, collapse = '')
epsilonDec = strtoi(epsilon, base = 2)
print(epsilonDec*gammaDec)




