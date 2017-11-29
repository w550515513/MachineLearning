library(kernlab)

letters <- read.csv("letterdata.csv")
str(letters)

letters_train <- letters[1:16000,]
letters_test <- letters[16001:20000,]

#bbh
letter_classifier <- ksvm(letter ~ .,data = letters_train,kernel = "vanilladot")
letter_classifier

letter_predictions <- predict(letter_classifier,letters_test)
head(letter_predictions)
table(letter_predictions,letters_test$letter)


agreement <- letter_predictions == letters_test$letter

prop.table(table(agreement))