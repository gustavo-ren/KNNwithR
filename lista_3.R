nome <- c("Rafael", "Michelangelo", "Donatelo", "Leonardo", "Leonidas")
sobrenome <- c("Teenage", "Mutant","Ninjas", "Turtles", "King")
cpf <- c("123456789", "987654321", "234567890", "098765432", "543210987")
idade <- c(17, 17, 17, 17, 40)

df <- data.frame(nome, sobrenome, cpf, idade)

digito_verificador <- substr(df$cpf, 9, 9)
digito_verificador

nome_completo <- paste(df$nome, df$sobrenome, sep = " ")
nome_completo

df$digito_verificador <- digito_verificador
df$nome_completo <- nome_completo

View(df)
#2################################################################################
attach(Banco)

Banco$faixaSalarial <- cut(salário, breaks = c(
  15000, 35000, 45000, 55000, 135000), right = TRUE)


#3################################################################################
medSal<- function(salarin, salário){
  (salário - salarin)/salarin*100
}

Banco$percent <- medSal(Banco$salarin, Banco$salário)

#4################################################################################
install.packages('gmodels')
library(gmodels)
tabela <- CrossTable(Banco$faixaSalarial, Banco$sexo)

#5################################################################################

selectC <- subset(Banco, Banco$catemp == 3)

boxplot(formula = Banco$salário ~ Banco$sexo, col= c("blue", "yellow"))




