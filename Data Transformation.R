library(tidyverse)

#Creating new objects with <-
x <- 3 * 4
x
x <- mpg
x<- 6

#Click option button and - 
#Sometimes people use = instead of <-, do not do this, it is very confusing for your script 

x <- seq(1,10)
x

#Makes sequence go up by 2s
seq(1,10,2)

#Exercise

library(tidyverse)
install.packages("gapminder")
library(gapminder)

head(gapminder)

#Data types: fct is a categorical variable, int whole number and dbl is decimal 
#chr: character vectors or strings 
#dttm stands for date and times 
#lgl stands for logical, true or false, 0 or 1 

#Five basic functions dplyr
#filter(), arrange(), select(), mutate(), summarise() 

filter(gapminder, country == "Australia", year > 2000)

#your first argument in a script is a dataset of sorts that you will want to transform into whatever

filter(gapminder, continent %in% c("Asia","Oceania"))
view(filter(gapminder, continent %in% c("Asia","Oceania")))


df <- filter(gapminder, continent %in% c("Asia","Oceania"))

gapminder$country

#Filter rows with filter()

filter(gapminder, pop > 500000 & pop < 1000000)

filter(gapminder, pop > 500000 | pop < 1000000)

#"|" means OR, which has less restrictions and can give more options 

#Exercise 

filter(gapminder, pop > 1000000000)

filter(gapminder, continent %in% c("Oceania"))
distinct(filter(gapminder, continent %in% c("Asia", "Europe")), country)

filter(gapminder, lifeExp > 50 & lifeExp < 60)
filter(gapminder, lifeExp < 50 | lifeExp > 60)

#Handy operations 
# == is equal to 
# != is not equal to 
# >= is greater than or equal to 
# <= is less than or equal to 
# | is or 
# & is AND 
# %in% is in

#using arrange()
arrange(gapminder, country, year)

arrange(gapminder, country, desc(year))

arrange(gapminder, lifeExp)
arrange(gapminder, desc(pop))

#To eliminate desc on your arugment, use min or max to find the max or min in your argument 
slice_min(gapminder, lifeExp)
slice_max(gapminder, lifeExp)

#how to select your colomns (top label: country, year and pop)
select(gapminder, country, year, pop)

select(gapminder, country:pop)

#how to see everything BUT a certain column
select(gapminder, -(lifeExp:pop))

select(gapminder, country, year, lifeExp)

select(gapminder, any_of(vars))

vars <- c("country", "year", "lifeExp")

#creating new variables, use mutate()

mutate(gapminder, gdp = gdpPercap * pop)

#Select, transform and add a new variable with transmute 

transmute(gapminder, country, year, gdp = gdpPercap * pop)
mutate(gapminder, gdp = gdpPercap * pop, gdpPercap2 = gdp / pop)

summarise(
  gapminder, avg_pop = mean(pop), avp_gdp_per_cap = mean(gdpPercap))

gapminder_continent <- group_by(gapminder, continent)

summarise(
  gapminder_continent, avp_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap))

#Exercise 

mutate(gapminder, gdp = pop * gdpPercap)

gapminder_country <- group_by(gapminder, country)

gapminder_country_avg <- summarise(
  mutate(gapminder_country, gdp = pop * gdpPercap), avg_gdp = mean(gdp))

head(gapminder_country_avg)

arrange(gapminder_country_avg, avg_gdp)

arrange(gapminder_country_avg, desc(avg_gdp))


#Introducting the pipe - tells R to do things in order 

#|> (and then do this, is what this function does)
#%>% requires dplyr or magrittr

gapminder |> 
  group_by(continent) |> 
  summarise(avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)) |> 
  arrange(avg_gdp_per_cap)


gapminder |> 
  group_by(continent) |> 
  summarise(avg_pop = mean(pop), avg_gdp_per_cap = mean(gdpPercap)) |> 
  ggplot(aes(x = continent, y = avg_gdp_per_cap)) + 
  geom_col() + 
  theme_minimal()

gapminder_americas_2000 <- gapminder |> 
  filter(continent == "Americas", year == 2007) |> 
  select(country, gdpPercap) |>
  ggplot(aes(x = gdpPercap, y = country))
  geom_col() 
  theme_minimal()
