# Load packages:
library(tidyverse)
library(GGally)

# Load data:
data(iris)

# Explore Data:
head(iris) # First 6 rows of dataset
summary(iris) # Simple summary statistics overview of all variables
str(iris) # Structure of object together with class information

# From simple data.frame to tibble:
iris <- 
  iris |> 
  as_tibble()

# Manipulate data
# Compute mean of Sepal/Petal Length/Width for each Species:
iris |> 
  group_by(Species) |> 
  summarize(across(everything(), mean))

# Some data visualizations with ggplot2...

# Scatter-pLots of Sepal Width vs Length by Species:
iris |> 
  ggplot(aes(Sepal.Length, Sepal.Width, 
             color = Species, shape = Species)) + 
  geom_point() + 
  labs(
    title = "Sepal dimensions", 
    x = "Length", 
    y = "Width"
    )
# Box-plots of Sepal.Length by Species, including means:
iris |> 
  ggplot(aes(Species, Sepal.Length, 
             fill = Species)) + 
  geom_boxplot() + 
  stat_summary(fun = mean, 
               geom = "point", 
               shape = 5, 
               size = 4) + 
  labs(
    title = "Sepal Length", 
    y = "Length"
    )
# Histograms of Sepal.Width by Species:
iris |> 
  ggplot(aes(Sepal.Width, 
             fill = Species)) + 
  geom_histogram(binwidth=0.2, 
                 color="black") + 
  labs(
    title = "Sepal Width Distribution", 
    subtitle = "by Species", 
    x = "Width"
    )
# Bar-plot of number of observations by Species:
iris |> 
  ggplot(aes(Species, 
             fill = Species)) + 
  geom_bar() + 
  labs(title = "Observation Counts")
# Scatter-plots again, but now faceted along columns:
iris |> 
  ggplot(aes(Sepal.Length, Sepal.Width, 
             color = Species, 
             shape = Species)) + 
  geom_point(size = 1.5) + 
  facet_grid(. ~ Species) + 
  labs(
    title = "Sepal dimensions", 
    x = "Length", 
    y = "Width"
    )

# Pairs-plot of numeric variables by Species:
iris |> 
  ggpairs(aes(color = Species), 
          columns = 1:4, 
          upper = list(continuous = "points"), 
          legend = 3) + 
  labs(title = "Dimensions and their Relationships")

