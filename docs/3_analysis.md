---
title: "Analysis"
output: html_notebook
editor_options:
  chunk_output_type: inline
---

# Analysis



## Setup



```r
library(tidyverse)
#> -- Attaching packages ------------------------------------------------------------------------------ tidyverse 1.3.0 --
#> v ggplot2 3.3.2     v purrr   0.3.4
#> v tibble  3.0.3     v dplyr   1.0.2
#> v tidyr   1.1.2     v stringr 1.4.0
#> v readr   1.3.1     v forcats 0.5.0
#> -- Conflicts --------------------------------------------------------------------------------- tidyverse_conflicts() --
#> x dplyr::filter() masks stats::filter()
#> x dplyr::lag()    masks stats::lag()
library(ggplot2)
library(ggthemes)
library(ggforce)
library(ggridges)
library(ggsci)
library(wesanderson)
library(gghighlight)
```


## Data overview

An overview of the samples as of 26th April 2021 is stored in *Guineafowl-lcWGS_DataOverview_20210426.csv*. This is needed to later assign the relatedness estimates to specific individuals


```r
sample_overview <- read.csv("vignettes/data/Guineafowl-lcWGS_DataOverview_20210426.csv", header = TRUE, sep = ";", as.is = TRUE)
str(sample_overview)
#> 'data.frame':	119 obs. of  17 variables:
#>  $ individual                   : chr  "W1398" "W1429" "W1429" "W1502" ...
#>  $ library                      : chr  "L16926" "L16927" "L16927" "L16928" ...
#>  $ run                          : chr  "S2" "S1" "S3" "S4" ...
#>  $ original.o..resequenced.r.   : chr  "o" "r" "o" "o" ...
#>  $ readGroupID                  : int  4 5 4 4 4 5 4 4 4 4 ...
#>  $ total.reads                  : int  6720264 21332072 6069840 13390576 12081324 11995744 5684766 7759668 12174890 11373232 ...
#>  $ trim.input.reads             : int  3360132 10666036 3034920 6695288 6040662 5997872 2842383 3879834 6087445 5686616 ...
#>  $ trim.reads.survived.both     : int  2544284 9427764 2360036 5279275 4602830 5309238 2225803 2852960 4754568 4400910 ...
#>  $ trim.reads.dropped....       : num  0.24 0.12 0.22 0.21 0.24 0.11 0.22 0.26 0.22 0.23 ...
#>  $ mapped.reads                 : int  4987783 18494700 4631339 10376967 9021788 10412331 4367512 5598370 9342782 8636957 ...
#>  $ mapped.reads....             : num  98 98.1 98.1 98.3 98 ...
#>  $ coverage.mean                : num  0.56 2.06 0.52 1.14 0.97 1.14 0.48 0.63 1.05 0.98 ...
#>  $ coverage.st.dev.             : num  2.48 4.96 2.58 2.8 3.81 3.56 2.18 2.43 2.58 3.13 ...
#>  $ Duplicates....               : num  5.07 8.13 4.92 5.2 5.09 9.35 5.56 4.54 4.59 4.84 ...
#>  $ Lib.complexity.total.reads   : int  2250000 8750000 2250000 5000000 4250000 4750000 2000000 2750000 4500000 4250000 ...
#>  $ Lib.complexity.distinct.reads: int  2224740 8608220 2221360 4963340 4181270 4688400 1979850 2722780 4466910 4203570 ...
#>  $ number.of.snps               : logi  NA NA NA NA NA NA ...
```





## Analysis 2


---
