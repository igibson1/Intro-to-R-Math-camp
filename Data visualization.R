library(tidyverse)


# Load the Data
mpg

#Learn more about data set
?mpg

glimpse(mpg)

# Set up plot
install.packages("ggthemes")

library(ggplot2)
library(ggthemes)

# Map Aesthetics 

ggplot(data = mpg)
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
geom_point()


ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = class)) +
  geom_point()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, colour = class)) +
    geom_point() +
    geom_smooth(method = "lm") +
    scale_color_colorblind()
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
    geom_point(mapping = aes (colour = class)) +
    geom_smooth(method = "lm") +
    scale_color_colorblind()

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes (colour = class)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "values for seven different classes of cars",
    x = "Engine displacement (L)",
    y = "Highway values per gallon"
  ) +
  scale_color_colorblind()
 
# Second Day 

nrow(mpg)
ncol(mpg)

?mpg

# Two categorical variables, hard to see relation with a dot plot
ggplot(data = mpg)
ggplot(data = mpg, mapping = aes(x = hwy, y = cyl)) +
  geom_point() 

ggplot(data = mpg)
ggplot(data = mpg, mapping = aes(x = class, y = drv)) +
  geom_point(mapping = aes (colour = class)) +
  geom_smooth(method = "lm")

#Error message example - they help you by saying what went wrong - missing aes

ggplot(data = mpg) +
    geom_point()

#Adding caption to the plot we made last session 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +
  geom_point(mapping = aes (colour = class)) +
  geom_smooth(method = "lm") +
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "values for seven different classes of cars",
    caption = "Data comes from the ggplot2 package",
    x = "Engine displacement (L)",
    y = "Highway values per gallon")

#Flexible Visualization - communicating your findings 

ggplot(data = mpg) +
    geom_point(mapping = aes(x = displ, y = hwy, color = class == "suv"))

#To look at the individual values use distinct(mpg, class)

distinct(mpg, class)

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class == "suv"))

#if you want to look at multiple classes (SUV and other etc), replace "==" with %in%

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = class %in% c("2seater, suv")))

#Changing the look of your plots 

ggplot(data =mpg) +
    geom_point(mapping = aes(x = displ, y = hwy), colour = "pink")

#don't put color in your aes argument, make sure it is separate from it

#Which variables in mpg are categorical (does not have infinite amount) vs continuous (numnbers)

?mpg

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, color = displ))

#size, makes points bigger or smaller depending on the displacement 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, size = displ))

#error will occur when you make a continuous variable to the shape (categorical variable)
#don't or be weary using this function 

ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, shape = class))

#If you map the same variable to multiple aes, it is redundant you told your viewer 

#Cleaning up your graph --> theme_minimal 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) + 
  geom_smooth(method = "lm") + 
  theme_minimal() + 
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon"
  ) + 
  scale_color_colorblind()

#Creating your own theme 

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) + 
  geom_smooth(method = "lm") + 
  theme(
    legend.position = "bottom",
    panel.grid = element_blank(),
    panel.background = element_blank(),
    plot.title.position = "plot",
    plot.title = element_text(face = "bold")
  ) + 
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon"
  ) + 
  scale_color_colorblind()


#do ?theme if you want to adjust your theme at all 
?theme

ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point(mapping = aes(colour = class)) + 
  geom_smooth(method = "lm") + 
  theme(
    legend.position = "top",
    panel.grid = element_blank(),
    panel.background = element_blank(),
    plot.title.position = "plot",
    plot.title = element_text(color = "purple", face = "bold")
  ) + 
  labs(
    title = "Engine displacement and highway miles per gallon",
    subtitle = "Values for seven different classes of cars",
    x = "Engine displacement (L)",
    y = "Highway miles per gallon"
  ) + 
  scale_color_colorblind()

#Visualizing Distributions 

ggplot(mpg, aes(x = drv)) + 
  geom_bar()

#geom_bar and geom_point, gives you your type of graph/visualization 
#Put it in decending bar order 

ggplot(mpg, aes(x = fct_infreq(drv))) +
  geom_bar()

#Visualizing Numeric Variables 

ggplot(mpg, aes(x = hwy)) +
  geom_histogram()

#Visualizing Numeric Variables 
ggplot(mpg, aes(x = hwy)) +
  geom_density()

ggplot(mpg, aes(x = hwy, colour = drv)) +
  geom_density()

#alpha gives the graph fill, transparency instead of all full. Change transparency by changing alpha unit 
ggplot(mpg, aes(x = hwy, colour = drv, fill = drv)) +
  geom_density(alpha = 0.5)


    