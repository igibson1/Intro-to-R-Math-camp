install.packages("here")
here::here
library(tidyverse)

df <- read_csv(here::here("API_NY.GDP.MKTP.CD_DS2_en_csv_v2_5728855.csv"))

gdp_raw <- read_csv(
  here::here("API_NY.GDP.MKTP.CD_DS2_en_csv_v2_5728855.csv"), 
  skip = 4, 
  col_select = 1:66)

gdp_raw

install.packages("skimr")
skimr::skim(gdp_raw)

gdp_raw <- pivot_longer(
  data = gdp_raw, 
  cols = `1960`:`2021`,
  names_to = "year",
  values_to = "gdp"
)
gdp_raw %>% 
  clean_names()


install.packages("janitor") 
library(janitor)



