
```{r setup, include=FALSE}
library(learnr)
library(tidyverse)
library(checkr)
knitr::opts_chunk$set(echo = FALSE)
tutorial_options(exercise.checker = checkr::check_for_learnr)
#knitr::opts_chunk$set(exercise.checker = checker)
movies <- readRDS("movies.rds") %>%
  filter(country=="USA") %>% 
  mutate(genre1=gsub("\\|.*", "", genres)) %>% 
  filter(content_rating %in% c("G", "PG", "PG-13", "R")) %>% 
  filter(title_year>1982)
```

## ggplot2

Consider this data set from IMDB on 5,000 movies we have in the environment called **movies**.


```{r display}
movies
```

This is what `glimpse(movies)` outputs.

```{r glimpse}
glimpse(movies)
```


### Make a scatterplot

Let's start easy with a simple scatter plot comparing box office gross to the budget.

```{r scatter1, exercise=T, exercise.timelimit=60, warning=F, message=F}
ggplot(______) + geom_________(aes(______,______))
```

### Change the color

Let's change the color of the circles to blue.

```{r scatter2, exercise=T, exercise.timelimit=60, warning=F, message=F}
ggplot(______) + geom_________(aes(______,______), ________)
```

### Make a scatterplot with color groups

Add a color factor based on `content_rating`.

```{r scatter3, exercise=T, exercise.timelimit=60, warning=F, message=F}
ggplot(______) + geom_________(aes(______, ______, ______))
```

Did you notice the placement of the second-to-last parenthesis for color this time?
  
  ### Bar plot
  
  Make a bar plot chart that counts up the number of titles per year.

```{r geom_bar1, exercise=T, exercise.timelimit=60, warning=F, message=F}
ggplot(______,
             aes(x=_________)) +
  geom__________()
```

### Stacked bar plot ver. 1

Add *content_rating* as a grouping per year counting up the movies to create a stacked bar chart.

```{r geom_bar2, exercise=T, exercise.timelimit=60, warning=F, message=F}
ggplot(______,
             aes(x=_________,__________)) +
  geom__________()
```


<div id="geom_bar2-hint">
  **Hint:** You may want to use the `fill` argument.
</div>
  
  ### Stacked bar plot ver. 2
  
  Great, now split up the bars so they're not stacked but next to each other.

And we'll focus on movies created after 2001 (*title_year* is the variable).

```{r geom_bar3, exercise=T, exercise.timelimit=60, warning=F, message=F}

movies %>% 
  filter(___________) %>%
  ggplot(aes(x=_________,__________)) +
  geom__________(________________)
```


<div id="geom_bar3-hint">
  **Hint:** You may want to use the `position` argument in the `geom_bar()` function.
</div>
  
  ### Stacked bar plot ver. 3
  
  Alright, let's make a percent stacked chart this time:

```{r geom_bar4, exercise=T, exercise.timelimit=60, warning=F, message=F}

movies %>% 
filter(___________) %>%
ggplot(aes(x=_________,__________)) +
geom__________(________________)
```

## Customizing charts

### Another bar chart

Consider this data set from IMDB on 5,000 movies we have in the environment called **movies**.


```{r display2}
movies
```

This is what `glimpse(movies)` outputs.

```{r glimpse2}
glimpse(movies)
```

Let's look at box office results for all the movies that James Cameron has created (variable is *director_name*).

```{r jc1, exercise=T, exercise.timelimit=60, warning=F, message=F}
movies %>% 
  filter(__________) %>% 
  ggplot(aes(__________,___________)) +
  geom_bar(___________)
```


<div id="jc1-hint">
  **Hint:** You may want to pass the argument `stat=` to the `geom_bar()` function. What do you fill with stat? You'll need to check your [notes](https://learn.r-journalism.com/en/visualizing/charts_with_ggplot/ggplot2/).
</div>

### Flip that chart

Transpose that chart so that the movies are on the y axis instead of the x axis (without swapping the coords from the code above).


```{r jc2, , exercise=T, exercise.timelimit=60, warning=F, message=F}
movies %>% 
filter(__________) %>% 
ggplot(aes(__________,___________)) +
geom_bar(___________) +
__________()
```


<div id="jc2-hint">
**Hint:** What's that line you need to add? You're **flip**ping the **coord**inates.
</div>

### Reorder the labels in the chart

Let's recreate the chart so that the movies listed are in order of release date (variable is *title_year*).

Remember, you'll need to use the library **forcats** and the function `fct_reorder()`.

```{r jc3, exercise=T, exercise.timelimit=60, warning=F, message=F}
library(forcats)

movies %>% 
filter(__________) %>%
ggplot(aes(x=fct_reorder(_________,desc(_______)), y=___________)) +
geom_bar(___________) +
__________()
```


<div id="jc3-hint">
**Hint:** I've already given you the `fct_reorder()` function! Just [look up](http://learn.r-journalism.com/en/visualizing/customizing_charts/customizing-exporting-ggplot2/) how it works so you use it right.
</div>
  
  ```{r forcats, warning=F, message=F, include=F}
library(forcats)
```

### Style it

Let's fix the x-axis and y-axis labels, as well as add a title to the chart ("How James Cameron movies performed at the box office"") and caption for where the data came from ("Source: IMDB.com"")

```{r jc4, exercise=T, exercise.timelimit=60, warning=F, message=F}
movies %>% 
filter(__________) %>%
ggplot(aes(x=fct_reorder(_________,desc(_______)), y=___________)) +
geom_bar(___________) +
__________() +
____(____=___________,
____=___________,
______=__________________,
______=___________________) +
theme_minimal()
```


<div id="jc4-hint">
**Hint:** You might want to use the `labs()` function. But you'll have to [look up](http://learn.r-journalism.com/en/visualizing/customizing_charts/customizing-exporting-ggplot2/) the rest.
</div>
  
  
  ### Color palettes
  
  Let's look at Wes Anderson's box office performance using the code as above, but with Wes Anderson substituted out for James Cameron.

And for fun, we'll use the **wesanderson** color palette from his first movie, Bottle Rocket.

Because you're changing the color of the bars based on the *movie_title* variable, you need to add that to the `aes()`.

```{r jc5, exercise=T, exercise.timelimit=60, warning=F, message=F}
#install.packages("wesanderson")
library(wesanderson)

movies %>% 
  filter(__________) %>%
  ggplot(aes(x=fct_reorder(_________,desc(_______)), y=___________, ____=_____________)) +
  geom_bar(___________) +
  __________() +
  ____(____=___________,
           ____=___________,
           ______=__________________,
           ______=___________________) +
  theme_minimal() +
  ______________(values=wes_palette("BottleRocket1"), guide=F)
```


<div id="jc5-hint">
  **Hint:** In the last line, you're using a scale function that lets you change the fill colors manually. Here's the [documentation](https://github.com/karthik/wesanderson) on the Wes Anderson palette
</div>
  
  ### Labeling
  
  Let's filter these movies to those directed by "Kathryn Bigelow", "Martin Scorsese", and "Steven Spielberg" and then make a scatter plot comparing box office to budget. 

The color should represent the different director.

Then add a label for the movie using the [**ggrepel**](https://cran.r-project.org/web/packages/ggrepel/vignettes/ggrepel.html) package.

```{r ggrepel, exercise=T, exercise.timelimit=60, warning=F, message=F, fig.width=9, fig.height=6}
#install.packages("ggrepel")
library(ggrepel)

movies %>% 
filter(director_name ____ c("Kathryn Bigelow", "Martin Scorsese", "Steven Spielberg")) %>% 
ggplot(aes(x=gross, y=budget, color=______________, ______=___________)) +
geom_point() +
geom_____________()

```

<div id="ggrepel-hint">
**Hint:** The filter code that lets you filter by group is `%in%`. The color is based on the director and the label is based on the movie name. Can you find those variable names in the **movies** data frame? And what's the function for the last line? If you forgot, refer to [the lesson](http://learn.r-journalism.com/en/visualizing/more_charts/fancy-charts/).
</div>
  
  
  ### Small multiples
  
  Nice! Let's break them out individually by director so it's easier to see the patterns.

```{r ggrepel_load, include=F, warning=F, message=F}
library(ggrepel)
```

```{r ggrepel_facet, exercise=T, exercise.timelimit=60, warning=F, message=F, fig.width=6, fig.height=6}
movies %>% 
  filter(director_name ____ c("Kathryn Bigelow", "Martin Scorsese", "Steven Spielberg")) %>% 
  ggplot(aes(x=gross, y=budget, color=______________, ______=___________)) +
  geom_point() +
  geom_____________(size=2)
_____________(~____________, nrow=2) +
  theme(legend.position="none")
```

<div id="ggrepel_facet-hint">
  **Hint:** What's the term for creating facets of the chart? It's facet_*something*. There's [more than one](http://learn.r-journalism.com/en/visualizing/charts_with_ggplot/ggplot2/), but we want the one that we can specify the number of rows in the output (with `nrow`).
</div>



