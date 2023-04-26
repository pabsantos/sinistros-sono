library(tidyverse)
library(lubridate)

load("data/prf-sinistros-2022.rda")
load("data/renaest-sinistros-2022.rda")

glimpse(prf_sinistros)

calc_sinistros_sonolencia <- function() {
    prf_sinistros |> 
        mutate(
            ano = year(data_inversa),
            sonolencia = if_else(
                causa_acidente %in% c("Dormindo", "Condutor Dormindo"),
                "Sonolência",
                "Outros"
            )
        ) |> 
        count(ano, sonolencia) |> 
        filter(ano == 2022)
}

prf_sinistros_2022 <- calc_sinistros_sonolencia()


