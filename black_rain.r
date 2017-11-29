uniao <- rbind(Apend_1, Apend_2)
uniao

install.packages("plyr")
library(plyr)
uni <- rbind.fill(Apend_11, Apend_22)
uni


chave <- merge(Apend_A, Apend_B, by = c("id"))
chave

merge(Uniao_1, uniao_2, by = "id", all = FALSE)

s<-subset(Banco, estudo >= 10)

View(s)
print(min(s))

attach(Banco)

Banco[order(Banco$salário, decreasing = TRUE),]
bla <- replace(salário, salário >= 10000, 99999)
bla
boxplot(salário)

install.packages("sqldf")
library(sqldf)
selecionados2 <- sqldf("SELECT * FROM Banco WHERE sexo = 2")
selecionados2

sqldf("select estudo,avg(salário) as caralho from Banco group by estudo")




