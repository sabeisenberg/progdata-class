library(tidyverse)
library(gapminder)
ggplot(gapminder)
ggplot(gapminder) + 
  aes(x = gdpPercap, y = lifeExp) + 
  geom_point(shape = 21, color = "green", 
             fill = "purple", alpha = .3) +
  scale_x_continuous(
    name = "GDP per capita", 
    trans = "log10", 
    labels = scales::dollar_format()
  ) +
  theme_bw() +
  ylab("Life Expectancy")

