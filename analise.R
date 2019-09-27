library(readxl)

#Ler dados de sales
sales <- read_excel("Dados Trabalho.xlsx", 
                    sheet = "SALES", skip = 2)

#Ler dados de inventory
inventory <- read_excel("Dados Trabalho.xlsx", 
    sheet = "INVENTORY", skip = 2)
