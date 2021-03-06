---
  title: "Chapter 5"
tutorial:
  id: "code.r-journalism/chapter-5"
version: .8
output:
  learnr::tutorial:
  progressive: true
theme: lumen
highlight: espresso

include:
  before_body: _navbar.html
runtime: shiny_prerendered
---
  
  ```{r setup, include=FALSE}
library(learnr)
library(tidyverse)
library(checkr)
knitr::opts_chunk$set(echo = FALSE)
tutorial_options(exercise.checker = checkr::check_for_learnr)
#knitr::opts_chunk$set(exercise.checker = checker)
```




## Static maps

### Map a shapefile

### Join it to data

### Map out the joined data

### Facet maps

### Map out locations as circles


## Interactive maps

### Find the latitude and longitude of an address

### Map that out in an interactive map

### Points in a polygon join

### Map out joined data as interactive choropleth






## Intro to R

### Objects

Assign the number 17 to the object **ub**
  
  ```{r object-check, exercise=T, exercise.timelimit=60}
ub    17

ub
```


### Array

Create an array of numbers: 301, 978, and 101.

Assign it to the object "years"

```{r arrays, exercise=T, exercise.timelimit=60}
years #replace this with your code

years
```

### Functions

```{r years_array, include=FALSE}
years <- c(301, 978, 101)
```

What's the average of the array of numbers assigned to "years"?

```{r average, exercise=T, exercise.timelimit=60}
(years)
```

### Classes

```{r factors_df, include=FALSE}
burgers <- data.frame(id=c(60006,60007,60008,60009, 60010), name=c("Bob", "Linda", "Louise", "Tina", "Gene"), age=c(45, 44, 12, 13, 11), shirt=c("White", "Red", "Pink", "Blue", "Yellow"))
burgers$shirt<- factor(burgers$shirt)
burgers$id <- factor(burgers$id)
burgers$name <- as.character(burgers$name)
```

Take a look at the structure of **burgers**:

```{r structure, exercise=T, exercise.timelimit=60}

```


```{r first_quiz}
quiz(
question("What kind of class is the variable id?",
answer("character"),
answer("number"),
answer("factor", correct = TRUE),
answer("date"),
random_answer_order= TRUE
))
```

## Data structures in R


### Pulling a column of data

Consider this data frame **burgers**

```{r burger_show}
burgers
```


How do you refer to the the *shirt* variable/column with []?

```{r variable1, exercise=T, exercise.timelimit=60}
# Add to the line below

burgers
```

How do you refer to the the *shirt* variable/column with $?

```{r variable2, exercise=T, exercise.timelimit=60}
# Add to the line below

burgers
```

### Pulling a row of data

Extract entire row for Linda using [].

```{r variable4, exercise=T, exercise.timelimit=60}
# Add to the line below

burgers
```

### Converting data classes

Convert the *id* variable of the **burgers** data frame to numeric.

```{r variable3, exercise=T, exercise.timelimit=60}
# Add to the line below

burgers
```

### Boolean logic

Check if Gene's age is 11.

*Note:* Is the answer the same as above (correct) or is it 1-5 (false)? 
  
  ```{r boolean, exercise=T, exercise.timelimit=60}
# Modify the line of code below

age_test <- burgers$age[5]    11

age_test
```


