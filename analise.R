library(readxl)
library(esquisse)
library(ggplot2)
library(dplyr)

#Ler dados de sales
sales <- read_excel("Dados Trabalho.xlsx", 
                    sheet = "SALES", skip = 2)

#Ler dados de inventory
inventory <- read_excel("Dados Trabalho.xlsx", 
    sheet = "INVENTORY", skip = 2)

#Esquisse com sales
#esquisse::esquisser(sales)

#Esquisse com inventory
#esquisse::esquisser(inventory)

#sales = sales %>% mutate(`Discount%` = `Discount%` * 100)

# Quantity x Discount
ggplot(sales) +
  aes(x = Quantity, y = `Discount%`) +
  geom_point(size = 1L, colour = "#0c4c8a", position = "jitter") +
  geom_smooth(method='lm',aes(x  = Quantity, y = `Discount%`)) +
  labs(x = 'Quantidade vendida', y = 'Disconto (%)')
ggsave('Quantity x Discount.pdf')  

# Price x Quantity
ggplot(sales) +
  geom_jitter(aes(x = PRICE, y = Quantity),size = 0.7,colour = "#0c4c8a",width = 5) +
  geom_smooth(method='lm',aes(x  = PRICE, y = Quantity))+
  labs(x = 'Preço', y = 'Quantidade vendida')
ggsave('Price x Quantity.pdf') 

# Price x Discount - Consequencia indireta das relacoes anteriores
ggplot(sales) +
  aes(x = PRICE, y = `Discount%`) +
  geom_jitter(aes(x = PRICE, y = `Discount%`),size = 0.7,colour = "#0c4c8a",width = 5) +
  geom_smooth(method='lm',aes(x  = PRICE, y = `Discount%`))+
  labs(x = 'Preço', y = 'Disconto (%)')
ggsave('Price x Discount.pdf')

# Venda por warehouse
ggplot(sales) +
  aes(x = NAME...28, y = `Price after discount`) +
  geom_col(fill = "#0c4c8a") +
  labs(x = 'Warehouse', y = 'Total Sales')
ggsave('Sales by warehouse.pdf')

# Venda por sales representaive
ggplot(sales) +
  aes(x = NAME...33, y = `Price after discount`) +
  geom_col(fill = "#0c4c8a") +
  labs(x = 'Sales Representative', y = 'Total Sales') + 
  coord_flip()
ggsave('Sales by representative.pdf')

#Inventario por preco de prduto
ggplot(inventory %>% mutate(PRICE = as.factor(inventory$PRICE))) +
  aes(x = PRICE, y = Amount, fill = PRICE) +
  labs(x = 'Preço', y = 'Quantidade em estoque') +
  geom_boxplot()
ggsave('Inventario por preco.pdf')

#Inventario por data
ggplot(inventory) +
  aes(x = DATE, y = Amount) +
  geom_col(fill = "#0c4c8a") + 
  labs(x = 'Data', y = 'Quantidade em estoque')
ggsave('Inventario por data.pdf')

#Inventario por warehouse
ggplot(inventory) +
  aes(x = NAME...11, y = Amount) +
  geom_boxplot(fill = "#0c4c8a") +
  labs(x = 'Warehouse', y = 'Quantidade em estoque')
ggsave('Inventario por warehouse.pdf')
