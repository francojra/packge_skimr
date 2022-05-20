
# Pacote skimr -----------------------------------------------------------------------------------------------------------------------------
# Autoria do script: Jeanne Franco ---------------------------------------------------------------------------------------------------------
# Data: 19/05/22 ---------------------------------------------------------------------------------------------------------------------------
# Referência: Curso-R ----------------------------------------------------------------------------------------------------------------------

# Baixar pacote ----------------------------------------------------------------------------------------------------------------------------

install.packages("skimr")
library(skimr)

# Aplicando o pacote em uma base de dados --------------------------------------------------------------------------------------------------

### Agora, vamos aplicar a função skim em uma base de dados de interesse. No caso, 
### estamos usando a base dados_starwars do pacote dados.

dados::dados_starwars |> skim()

### Veja que a saída da função skim mostra uma visão geral da base de dados, 
### nos dando informações como número de linhas, número de colunas, e os tipos das colunas.

### Ela fornece também informações individuais sobre cada coluna da base, separando as
### colunas por tipo: cada tipo nos dá um conjunto diferente de estatísticas, que façam
### sentido para aquele tipo de dado.

### Além disso, se salvarmos a saída da função em um objeto, podemos obter um data frame 
### no qual cada linha é referente a uma coluna da base de dados.

### Isso é muito útil quando estamos lidando com bases que tem muitas colunas.

# Visualizando as informações dos dados em data.frame --------------------------------------------------------------------------------------

info_skim <- dados::dados_starwars |> 
  skim() |> 
  tibble::as_tibble()
