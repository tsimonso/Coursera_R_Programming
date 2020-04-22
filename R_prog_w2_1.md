---
title: "R_prog_w2_1"
author: "Thomas Simonson"
date: "23/04/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## R programming, week 2 assignment
### Part 1 : Mean of a pollutant (sulfate or nitrate) across a specified list of monitors.

```{r}
print(R.version.string)
```

```{r}
source("R_prog_w2_1.R")
pollutantMean("specdata","sulfate",1:10)
```

```{r}
pollutantMean("specdata","nitrate",70:72)
```

```{r}
pollutantMean("specdata","nitrate",23)

```