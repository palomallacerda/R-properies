#### Primeiro voc� le� a tabela #########

#AOV l� primeiro os valores dps os labels ###
Amostra <- data.frame(KM = c(85,75,82,76,71,85,
                             71,75,73,74,69,82,
                             59,64,62,69,76,67), 
                       setores = c("Atlanta", "Atlanta", "Atlanta", "Atlanta","Atlanta", "Atlanta",  
                                   "Dallas","Dallas","Dallas","Dallas","Dallas","Dallas",
                                   "Seatle", "Seatle","Seatle", "Seatle","Seatle", "Seatle"))

result <- aov(Amostra$KM ~ factor(Amostra$setores))

#Mostra se existe diferen�as/ Caso  muito baixo n�oo existir� diferen�a####
anova(result)

# Para saber quem difere de quem #####
## Para os valores de p<alfa as amostras diferem
## Para p > alfa as amostras n�o diferem
TukeyHSD(result)


#Calculando a �rea, se as variancias forem proximas ser� homogenio
aggregate(Amostra~ factor(Amostra$setores),Amostra$KM,Amostra$setores )

#Teste de Homogenialidade, se o p-value > alfa ser� homogenio
bartlett.test(Amostra$KM,Amostra$setores)


#Verificar normalidade dos dados
shapiro.test(Amostra$KM) 
