library(readxl)
library(esquisse)
library(ggplot2)

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

# Quantity x Discount
ggplot(sales) +
  aes(x = Quantity, y = `Discount%`) +
  geom_point(size = 1L, colour = "#0c4c8a", position = "jitter") +
  geom_smooth(method='lm',aes(x  = Quantity, y = `Discount%`))
  

# Quantity x Discount
ggplot(sales) +
  geom_jitter(aes(x = PRICE, y = Quantity),size = 0.7,colour = "#0c4c8a",width = 5) +
  geom_smooth(method='lm',aes(x  = PRICE, y = Quantity))


# Price x Discount - Consequencia indireta das relacoes anteriores
ggplot(sales) +
  aes(x = PRICE, y = `Discount%`) +
  geom_jitter(aes(x = PRICE, y = `Discount%`),size = 0.7,colour = "#0c4c8a",width = 5) +
  geom_smooth(method='lm',aes(x  = PRICE, y = `Discount%`))

# Venda por warehouse
ggplot(sales) +
  aes(x = NAME...28, y = `Price after discount`) +
  geom_col(fill = "#0c4c8a")

# Venda por sales representaive
ggplot(sales) +
  aes(x = NAME...33, y = `Price after discount`) +
  geom_col(fill = "#0c4c8a") +
  coord_flip()

#Inventario por preco de prduto
ggplot(inventory) +
  geom_jitter(aes(x = Amount, y = PRICE), size = 1L, colour = "#0c4c8a", width = 2 )

#Inventario por data
ggplot(inventory) +
  aes(x = DATE, y = Amount) +
  geom_col(fill = "#0c4c8a")


#Inventario por warehouse
ggplot(inventory) +
  aes(x = NAME...11, y = Amount) +
  geom_boxplot(fill = "#0c4c8a")
