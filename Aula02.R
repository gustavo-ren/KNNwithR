matriz <- matrix(data = 1:12, nrow = 3, ncol = 4, byrow = T)

a <- matrix(data = 1:12, nrow = 3, ncol = 4, byrow = T)

a

aa <- a[2, 2]

aa

10+aa

a <- c("hello", "Pendejos")
b <- c(42, 300)
c <- list(cbind(a, b))

c


nome <- c("Sterling", "Archer")
seasons <- c(1, 9)
al <- c("World's greatest spy", "Duchess")

archer <- data.frame(nome, seasons, al)
archer

filho <- c(1, 2)
filho

archer$filho <- c(filho)
archer

salario <- c(1000, 2000)

archer$salario <- c(salario)

archer

archer$salario=archer$salario + archer$salario*0.06
archer

names(archer)
write.csv(archer, file="teste.csv")

attach(Apend_BB)
Apend_BB [order(Apend_BB$id),]

unique(Apend_BB)

attach(Salario)
library(dplyr)
grupo <- group_by(Salario, id)
grupo

agregar <- summarize(grupo, salario_m = mean(salario_m),
                     data_pagamento_min = min(data_pagamento),
                     data_pagamento_max = max(data_pagamento))

agregar

attach(Banco)

data_atual <- as.Date("2017-11-16")
data_atual

Banco$data_atual <- c(data_atual)
Banco
idade <- difftime(data_atual, datanasc)/365.25
idade

Banco$idade <- c(idade)
Banco

is.numeric(idade)
idade <- as.numeric(idade)
is.numeric(idade)
idade

min(idade)
max(idade)
faixa_etaria <- cut(idade, breaks = c(46, 50, 60, 70, 89), right = T)


Banco$faixa_etaria <- c(faixa_etaria)
Banco

attach(Banco_1)

round(mean(Banco_1$filhos, na.rm = TRUE))

table(sexo, Situacao)

library(gmodels)
CrossTable(Banco_1$sexo, Banco_1$Situacao, digits = 3,
           expected = FALSE,
           prop.r = TRUE,
           prop.c = TRUE,
           prop.t = TRUE,
           chisq = TRUE)
attach(Bank)
library(ggplot2)

dispersao <- ggplot(Bank, aes(x = age, y = salbeg, color = sex))
dispersao + geom_point() + facet_wrap((~sex))

boxplot(Banco_1$idade ~Banco_1$sexo,
        main="BoxPlot",
        xlab= "sexo", ylab = "idade",
        col = c ("blue", "red"))

notas <- c(5, 7, 8, 9)
names(notas) <- c("A", "B", "C", "D")

barplot(notas)
media <- mean(notas)
media

abline(h=media)

