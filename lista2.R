########################Exercicio 1####################################

library(readxl)

dataset <- read_excel("D:\\VMs_23BDT\\Edmar\\Arquivos de Aula\\Bank.xlsx")

table(dataset$sex)
graph1 <- table(dataset$sex)
barplot(graph1)

table(dataset$jobcat)
graph2 <- table(dataset$jobcat)
barplot(graph2)

table(dataset$sexrace)
graph3 <- table(dataset$sexrace)
barplot(graph3)

max(dataset$age)
min(dataset$age)
mean(dataset$age)
median(dataset$age)
sd(dataset$age)

max(dataset$time)
min(dataset$time)
mean(dataset$time)
median(dataset$time)
sd(dataset$time)

max(dataset$salnow)
min(dataset$salnow)
mean(dataset$salnow)
median(dataset$salnow)
sd(dataset$salnow)

hist(dataset$age)
hist(dataset$time)
hist(dataset$salnow)


########################Exercicio 2####################################

boxplot(dataset$salnow ~ dataset$sex)

########################Exercicio 3####################################

install.packages("gmodels")
library(gmodels)

CrossTable(dataset$sex, dataset$minority)

########################Exercicio 4####################################

selecionados <- dataset[dataset$sex=="Males" & dataset$jobcat=="Clerical",]
selecionados





