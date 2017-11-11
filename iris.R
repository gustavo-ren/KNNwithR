i <- read.csv(url("http://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data"), header = FALSE)

head(i)

#Funcao que adiciona nomes aos campos do csv
names(i) <- c("Sepal.Length", "Sepal.Width", "Petal.Length", "Petal.Width", "Species")

i

#Comentar durante o uso de caret
library(ggvis)

i %>% ggvis(~Sepal.Length, ~Sepal.Width, fill=~Species) %>% layer_points()

i %>% ggvis(~Petal.Length, ~Petal.Width, fill=~Species) %>% layer_points()

#Correlacao entre comprimento e largura da petala
cor(i$Petal.Length, i$Petal.Width)

x=levels(i$Species)

#Imprime a matrix de correlacao da Setosa
print(x[1])
cor(i[i$Species == x[1], 1:4])

#Imprime a matrix de correlacao da Versicola
print(x[2])
cor(i[i$Species == x[2], 1:4])

#Imprime a matrix de correlacao da Virginica
print(x[3])
cor(i[i$Species == x[3], 1:4])

str(i)

#divisao de especies
table(i$Species)

#divisao percentual de especies
round(prop.table(table(i$Species)) * 100, digits = 1)

#pacote class: pacote para classificacao, inclui k-nearest neighbour, Learning Vector Quantization and Self-Organizing Maps.

set.seed(1234)

#Divide os rows e classifica como 1 ou 2
#replece = true significa que ele classificara as linhas como 1 ou 2 e depois
#reseta o vetor de 2 para o valor original
#prob escolhe a probabilidade de ocorrencia de cada categoria.
#67% de probabilidade de ocorrer 1 e 33% de probabilidade de ocorrer 2
ind <- sample(2, nrow(i), replace = TRUE, prob = c(0.67, 0.33))

#compoe do conjunto de treino
i.training <- i[ind == 1, 1:4]

#inspeciona o conjunto de treino
head(i.training)

#compoe o conjunto de teste
i.test <- i[ind == 2, 1:4]

#inspeciona o conjunto de teste
head(i.test)

#compoe os labels de treino
i.trainLabels <- i[ind == 1, 5]

#inspeciona os labels
print(i.trainLabels)

#compoe os labels de teste
i.testLabels <- i[ind == 2, 5]

#inspeciona o resultado
print(i.testLabels)

library(class)

#construcao do k-nearest neighbour
#dento do knn estao:
#o conjunto de treino, de teste, de labels e a quantidade de vizinhos que se
#espera encontrar.
#O resultado e um factor vector com as classes preditas para o conjunto de teste
i_pred <- knn(train = i.training, test = i.test, cl = i.trainLabels, k = 3)

#Inspeciona
i_pred

#envia os labels para um data frame
iTesteLabels <- data.frame(i.testLabels)

#merge i_pred com i.testLabels
merge <- data.frame(i_pred, i.testLabels)

#especifica o nome de colunas para o merge
names(merge) <- c("Predicted Species", "Observed Species")

#inspeciona o merge
merge

#biblioteca com ferramentas de programacao para model fitting
library(gmodels)

#tabela que ajuda a entender o relacionamento entre duas variaveis
#prop.chisq indica se a chi-square sera usada, chi-square e usada para
#somar a contribuicao de cada celula e e usada para decidir se a diferenca
#entre o valor observado e esperado e significante
CrossTable(x = i.testLabels, y = i_pred, prop.chisq = FALSE)

#Classification and regression training
library(caret)

#cria um index para separar baseado no label
index <- createDataPartition(i$Species, p = 0.75, list= FALSE)

#subconjunto de treino com o index
i.training2 <- i[index, ]

#subconjunto de teste
i.test2 <- i[-index, ]

#traina o modelo
model_knn <- train(i.training2[, 1:4], i.training2[, 5], method = 'knn')

#uso de outro metodo
model_cart <- train(i.training2[, 1:4], i.training2[, 5], method='rpart2')

#faz predicoes
predictions <- predict.train(object= model_knn, i.test2[, 1:4], type = "raw")

#avalia as predicoes
table(predictions)

#matriz de confusao
confusionMatrix(predictions, i.test2[, 5])

#treina o modelo com pre-processamento
modelKNN <- train(i.training2[, 1:4], i.training2[, 5], method = "knn", preProcess = c("center", "scale"))

#prediz os valores
predictions2 <- predict.train(object = modelKNN, i.test2[, 1:4], type = "raw")

#matriz de confusao
confusionMatrix(predictions2, i.test2[, 5])
