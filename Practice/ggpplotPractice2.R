library(tidyverse)

(mauna <- tsibble::as_tsibble(co2) |> 
    rename(month = index, conc = value)) ## assigns and prints

pmauna <- ggplot(mauna) +
  aes(x = month, y = conc) + ##ggproto means you forgot a "+" 
geom_line() + 
  tsibble::scale_x_yearmonth() 

ggplot(palmerpenguins::penguins) +
  aes(x = body_mass_g, y = bill_depth_mm, color = species) + # global, will color species for all layers
geom_point(aes(color = species))+ 
  geom_smooth()

ggplot(palmerpenguins::penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) + 
  geom_point(aes(color = species))+  # color only in one layer (point) 
  geom_smooth()

ggplot(palmerpenguins::penguins) +
  aes(x = body_mass_g, y = bill_depth_mm) + 
  geom_point()+  
  geom_smooth(aes(color = species)) # color = species only in lines 

pmauna

pmauna + geom_smooth(color = "darkgreen") # aes is when you are mapping color to a variable. here, 
# we are not specifying it to a variable, we just want to assing the color green 

library(gapminder)

ggplot(gapminder) +
  geom_point(x = gapminder$gdpPercap, y = gapminder$lifeExp, alpha = 0.1)

# need to map the x and y 

ggplot(gapminder) +
  geom_point(aes(x = gdpPercap, y = lifeExp, alpha = 0.1))

ggplot(cars) +
  geom_point(aes(x = speed, y = dist, color = speed))
