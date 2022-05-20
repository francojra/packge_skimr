
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

### Podemos, por exemplo, ordenar pelas variáveis que tem maior número de NA:

info_skim |> 
  dplyr::arrange(desc(n_missing))

# Outros modos de uso do pacote ------------------------------------------------------------------------------------------------------------

### By design, the main focus of skimr is on data frames; it is intended to fit well 
### within a data pipeline and relies extensively on tidyverse vocabulary, which focuses 
### on data frames.

skim(iris) %>%
  dplyr::filter(skim_variable == "Petal.Length") %>%
  tibble::as_tibble() %>%
  View()

skim(iris) %>%
  dplyr::select(skim_type, skim_variable, n_missing)

skim(iris) %>%
  dplyr::select(skim_type, skim_variable, numeric.mean) # Média das variáveis

iris %>%
  dplyr::group_by(Species) %>% # Informações de todas as variáveis para cada espécie
  skim()

s <- skim(iris, Sepal.Length, Species) # Informações de apenas uma variável para cada 
# espécie
View(s)

skim(iris, starts_with("Sepal")) %>%
  View()
