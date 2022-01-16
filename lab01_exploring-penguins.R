library(palmerpenguins) # load package

penguins # print package 

mean(penguins$bill_length_mm, na.rm = TRUE) # mean of bill length no NA's

penguins$bill_length_mm > 40 # which bill lengths are greater than 40 mm 

names(penguins) # column names 

sd(penguins$flipper_length_mm, na.rm = TRUE) # standard deviation flipper length
mm 

