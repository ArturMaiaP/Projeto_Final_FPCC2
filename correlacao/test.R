
library(tidyverse)
library(broom)
library(modelr)
#install.packages("pastecs")
library(pastecs)

dados = read_csv(here::here("data/questOnEcomm.csv"))

ncol(dados)

dados.num = dados[,-c(1:9,30)]

names(dados.num)[1] = "price_negociation"
names(dados.num)[2] = "physical_contact"
names(dados.num)[11] = "site_navigation_speed"
names(dados.num)[4] = "credit_card_pay"
names(dados.num)[5] = "new_product_curiosity"
names(dados.num)[6] = "risk_credit_card"
names(dados.num)[7] = "detailed_info"
names(dados.num)[8] = "images_better_text"
names(dados.num)[9] = "organization_speed"
names(dados.num)[10] = "transaction_security"
names(dados.num)[3] = "transaction_speed"
names(dados.num)[12] = "acc_info"
names(dados.num)[13] = "prod_price_comp"
names(dados.num)[14] = "effec_shop_cart"
names(dados.num)[15] = "brand_classif"
names(dados.num)[16] = "others_opi"
names(dados.num)[17] = "effec_search_mech"
names(dados.num)[18] = "megastore_better_especialized"
names(dados.num)[19] = "personal_info_privacy"
names(dados.num)[20] = "relutance_credit_card"

media.geral = round(mean(colMeans(dados.num)),2)

cols.relev = c()
for (coluna in colnames(dados.num)){
  print(coluna)
  temp = dados.num %>% select(coluna) %>% pull() %>%mean()
  print(mean(temp))
  if (mean(temp) >= media.geral) {
    cols.relev = c(cols.relev, coluna)
  }
  
}

print(cols.relev)
