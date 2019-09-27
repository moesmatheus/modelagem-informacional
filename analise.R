library(readxl)
library(esquisse)

#Ler dados de sales
sales <- read_excel("Dados Trabalho.xlsx", 
                    sheet = "SALES", skip = 2)

#Ler dados de inventory
inventory <- read_excel("Dados Trabalho.xlsx", 
    sheet = "INVENTORY", skip = 2)

#Esquisse com sales
esquisse::esquisser(sales)

#Esquisse com inventory
esquisse::esquisser(inventory)