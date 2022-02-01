
<!-- rnb-text-begin -->

---
title: "Analysis"
output: html_notebook
editor_options:
  chunk_output_type: inline
---

# Analysis


<!-- rnb-text-end -->



<!-- rnb-text-begin -->


## Setup

Load reqired packages


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeSh0aWR5dmVyc2UpXG5gYGBcbmBgYCJ9 -->

```r
```r
library(tidyverse)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiUmVnaXN0ZXJlZCBTMyBtZXRob2RzIG92ZXJ3cml0dGVuIGJ5ICdkYnBseXInOlxuICBtZXRob2QgICAgICAgICBmcm9tXG4gIHByaW50LnRibF9sYXp5ICAgICBcbiAgcHJpbnQudGJsX3NxbCAgICAgIFxuXHUwMDFiWzMwbS0tIFx1MDAxYlsxbUF0dGFjaGluZyBwYWNrYWdlc1x1MDAxYlsyMm0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHRpZHl2ZXJzZSAxLjMuMSAtLVx1MDAxYlszOW1cblx1MDAxYlszMG1cdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bWdncGxvdDJcdTAwMWJbMzBtIDMuMy41ICAgICBcdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bXB1cnJyICBcdTAwMWJbMzBtIDAuMy40XG5cdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bXRpYmJsZSBcdTAwMWJbMzBtIDMuMS41ICAgICBcdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bWRwbHlyICBcdTAwMWJbMzBtIDEuMC43XG5cdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bXRpZHlyICBcdTAwMWJbMzBtIDEuMS40ICAgICBcdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bXN0cmluZ3JcdTAwMWJbMzBtIDEuNC4wXG5cdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bXJlYWRyICBcdTAwMWJbMzBtIDIuMC4yICAgICBcdTAwMWJbMzJtdlx1MDAxYlszMG0gXHUwMDFiWzM0bWZvcmNhdHNcdTAwMWJbMzBtIDAuNS4xXHUwMDFiWzM5bVxuXHUwMDFiWzMwbS0tIFx1MDAxYlsxbUNvbmZsaWN0c1x1MDAxYlsyMm0gLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIHRpZHl2ZXJzZV9jb25mbGljdHMoKSAtLVxuXHUwMDFiWzMxbXhcdTAwMWJbMzBtIFx1MDAxYlszNG1kcGx5clx1MDAxYlszMG06Olx1MDAxYlszMm1maWx0ZXIoKVx1MDAxYlszMG0gbWFza3MgXHUwMDFiWzM0bXN0YXRzXHUwMDFiWzMwbTo6ZmlsdGVyKClcblx1MDAxYlszMW14XHUwMDFiWzMwbSBcdTAwMWJbMzRtZHBseXJcdTAwMWJbMzBtOjpcdTAwMWJbMzJtbGFnKClcdTAwMWJbMzBtICAgIG1hc2tzIFx1MDAxYlszNG1zdGF0c1x1MDAxYlszMG06OmxhZygpXG5cdTAwMWJbMzFteFx1MDAxYlszMG0gXHUwMDFiWzM0bWRwbHlyXHUwMDFiWzMwbTo6XHUwMDFiWzMybXJlY29kZSgpXHUwMDFiWzMwbSBtYXNrcyBcdTAwMWJbMzRtY2FyXHUwMDFiWzMwbTo6cmVjb2RlKClcblx1MDAxYlszMW14XHUwMDFiWzMwbSBcdTAwMWJbMzRtcHVycnJcdTAwMWJbMzBtOjpcdTAwMWJbMzJtc29tZSgpXHUwMDFiWzMwbSAgIG1hc2tzIFx1MDAxYlszNG1jYXJcdTAwMWJbMzBtOjpzb21lKClcdTAwMWJbMzltXG4ifQ== -->

```
Registered S3 methods overwritten by 'dbplyr':
  method         from
  print.tbl_lazy     
  print.tbl_sql      
[30m-- [1mAttaching packages[22m ------------------------------------------------------ tidyverse 1.3.1 --[39m
[30m[32mv[30m [34mggplot2[30m 3.3.5     [32mv[30m [34mpurrr  [30m 0.3.4
[32mv[30m [34mtibble [30m 3.1.5     [32mv[30m [34mdplyr  [30m 1.0.7
[32mv[30m [34mtidyr  [30m 1.1.4     [32mv[30m [34mstringr[30m 1.4.0
[32mv[30m [34mreadr  [30m 2.0.2     [32mv[30m [34mforcats[30m 0.5.1[39m
[30m-- [1mConflicts[22m --------------------------------------------------------- tidyverse_conflicts() --
[31mx[30m [34mdplyr[30m::[32mfilter()[30m masks [34mstats[30m::filter()
[31mx[30m [34mdplyr[30m::[32mlag()[30m    masks [34mstats[30m::lag()
[31mx[30m [34mdplyr[30m::[32mrecode()[30m masks [34mcar[30m::recode()
[31mx[30m [34mpurrr[30m::[32msome()[30m   masks [34mcar[30m::some()[39m
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeShnZ3Bsb3QyKVxubGlicmFyeShnZ3RoZW1lcylcbmxpYnJhcnkoZ2dmb3JjZSlcbmxpYnJhcnkoZ2dyaWRnZXMpXG5saWJyYXJ5KGdnc2NpKVxubGlicmFyeSh3ZXNhbmRlcnNvbilcbmxpYnJhcnkoZ2doaWdobGlnaHQpXG5saWJyYXJ5KG5ldHdvcmspXG5gYGBcbmBgYCJ9 -->

```r
```r
library(ggplot2)
library(ggthemes)
library(ggforce)
library(ggridges)
library(ggsci)
library(wesanderson)
library(gghighlight)
library(network)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG7Do8KkwrzDo8K4wrFuZXR3b3Jrw6PCpMK8w6PCuMKyIDEuMTcuMSAoMjAyMS0wNi0xMiksIHBhcnQgb2YgdGhlIFN0YXRuZXQgUHJvamVjdFxuKiDDo8KkwrzDo8K4wrFuZXdzKHBhY2thZ2U9XFxuZXR3b3JrXFwpw6PCpMK8w6PCuMKyIGZvciBjaGFuZ2VzIHNpbmNlIGxhc3QgdmVyc2lvblxuKiDDo8KkwrzDo8K4wrFjaXRhdGlvbihcXG5ldHdvcmtcXCnDo8KkwrzDo8K4wrIgZm9yIGNpdGF0aW9uIGluZm9ybWF0aW9uXG4qIMOjwqTCvMOjwrjCsWh0dHBzOi8vc3RhdG5ldC5vcmfDo8KkwrzDo8K4wrIgZm9yIGhlbHAsIHN1cHBvcnQsIGFuZCBvdGhlciBpbmZvcm1hdGlvblxuIn0= -->

```

ã¤¼ã¸±networkã¤¼ã¸² 1.17.1 (2021-06-12), part of the Statnet Project
* ã¤¼ã¸±news(package=\network\)ã¤¼ã¸² for changes since last version
* ã¤¼ã¸±citation(\network\)ã¤¼ã¸² for citation information
* ã¤¼ã¸±https://statnet.orgã¤¼ã¸² for help, support, and other information
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeShHR2FsbHkpXG5gYGBcbmBgYCJ9 -->

```r
```r
library(GGally)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiUmVnaXN0ZXJlZCBTMyBtZXRob2Qgb3ZlcndyaXR0ZW4gYnkgJ0dHYWxseSc6XG4gIG1ldGhvZCBmcm9tICAgXG4gICsuZ2cgICBnZ3Bsb3QyXG4ifQ== -->

```
Registered S3 method overwritten by 'GGally':
  method from   
  +.gg   ggplot2
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeShpZ3JhcGgpXG5gYGBcbmBgYCJ9 -->

```r
```r
library(igraph)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5BdHRhY2hlIFBha2V0OiDDo8KkwrzDo8K4wrFpZ3JhcGjDo8KkwrzDo8K4wrJcblxuVGhlIGZvbGxvd2luZyBvYmplY3RzIGFyZSBtYXNrZWQgZnJvbSDDo8KkwrzDo8K4wrFwYWNrYWdlOm5ldHdvcmvDo8KkwrzDo8K4wrI6XG5cbiAgICAlYyUsICVzJSwgYWRkLmVkZ2VzLCBhZGQudmVydGljZXMsIGRlbGV0ZS5lZGdlcywgZGVsZXRlLnZlcnRpY2VzLFxuICAgIGdldC5lZGdlLmF0dHJpYnV0ZSwgZ2V0LmVkZ2VzLCBnZXQudmVydGV4LmF0dHJpYnV0ZSwgaXMuYmlwYXJ0aXRlLCBpcy5kaXJlY3RlZCxcbiAgICBsaXN0LmVkZ2UuYXR0cmlidXRlcywgbGlzdC52ZXJ0ZXguYXR0cmlidXRlcywgc2V0LmVkZ2UuYXR0cmlidXRlLFxuICAgIHNldC52ZXJ0ZXguYXR0cmlidXRlXG5cblRoZSBmb2xsb3dpbmcgb2JqZWN0cyBhcmUgbWFza2VkIGZyb20gw6PCpMK8w6PCuMKxcGFja2FnZTpkcGx5csOjwqTCvMOjwrjCsjpcblxuICAgIGFzX2RhdGFfZnJhbWUsIGdyb3VwcywgdW5pb25cblxuVGhlIGZvbGxvd2luZyBvYmplY3RzIGFyZSBtYXNrZWQgZnJvbSDDo8KkwrzDo8K4wrFwYWNrYWdlOnB1cnJyw6PCpMK8w6PCuMKyOlxuXG4gICAgY29tcG9zZSwgc2ltcGxpZnlcblxuVGhlIGZvbGxvd2luZyBvYmplY3QgaXMgbWFza2VkIGZyb20gw6PCpMK8w6PCuMKxcGFja2FnZTp0aWR5csOjwqTCvMOjwrjCsjpcblxuICAgIGNyb3NzaW5nXG5cblRoZSBmb2xsb3dpbmcgb2JqZWN0IGlzIG1hc2tlZCBmcm9tIMOjwqTCvMOjwrjCsXBhY2thZ2U6dGliYmxlw6PCpMK8w6PCuMKyOlxuXG4gICAgYXNfZGF0YV9mcmFtZVxuXG5UaGUgZm9sbG93aW5nIG9iamVjdHMgYXJlIG1hc2tlZCBmcm9tIMOjwqTCvMOjwrjCsXBhY2thZ2U6c3RhdHPDo8KkwrzDo8K4wrI6XG5cbiAgICBkZWNvbXBvc2UsIHNwZWN0cnVtXG5cblRoZSBmb2xsb3dpbmcgb2JqZWN0IGlzIG1hc2tlZCBmcm9tIMOjwqTCvMOjwrjCsXBhY2thZ2U6YmFzZcOjwqTCvMOjwrjCsjpcblxuICAgIHVuaW9uXG4ifQ== -->

```

Attache Paket: ã¤¼ã¸±igraphã¤¼ã¸²

The following objects are masked from ã¤¼ã¸±package:networkã¤¼ã¸²:

    %c%, %s%, add.edges, add.vertices, delete.edges, delete.vertices,
    get.edge.attribute, get.edges, get.vertex.attribute, is.bipartite, is.directed,
    list.edge.attributes, list.vertex.attributes, set.edge.attribute,
    set.vertex.attribute

The following objects are masked from ã¤¼ã¸±package:dplyrã¤¼ã¸²:

    as_data_frame, groups, union

The following objects are masked from ã¤¼ã¸±package:purrrã¤¼ã¸²:

    compose, simplify

The following object is masked from ã¤¼ã¸±package:tidyrã¤¼ã¸²:

    crossing

The following object is masked from ã¤¼ã¸±package:tibbleã¤¼ã¸²:

    as_data_frame

The following objects are masked from ã¤¼ã¸±package:statsã¤¼ã¸²:

    decompose, spectrum

The following object is masked from ã¤¼ã¸±package:baseã¤¼ã¸²:

    union
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeSh0aWR5Z3JhcGgpXG5gYGBcbmBgYCJ9 -->

```r
```r
library(tidygraph)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiXG5BdHRhY2hlIFBha2V0OiDDo8KkwrzDo8K4wrF0aWR5Z3JhcGjDo8KkwrzDo8K4wrJcblxuVGhlIGZvbGxvd2luZyBvYmplY3QgaXMgbWFza2VkIGZyb20gw6PCpMK8w6PCuMKxcGFja2FnZTppZ3JhcGjDo8KkwrzDo8K4wrI6XG5cbiAgICBncm91cHNcblxuVGhlIGZvbGxvd2luZyBvYmplY3QgaXMgbWFza2VkIGZyb20gw6PCpMK8w6PCuMKxcGFja2FnZTpzdGF0c8OjwqTCvMOjwrjCsjpcblxuICAgIGZpbHRlclxuIn0= -->

```

Attache Paket: ã¤¼ã¸±tidygraphã¤¼ã¸²

The following object is masked from ã¤¼ã¸±package:igraphã¤¼ã¸²:

    groups

The following object is masked from ã¤¼ã¸±package:statsã¤¼ã¸²:

    filter
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeShnZ3JhcGgpXG5saWJyYXJ5KGdyYXBobGF5b3V0cylcbmBgYFxuYGBgIn0= -->

```r
```r
library(ggraph)
library(graphlayouts)
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeShsbWU0KVxuYGBgXG5gYGAifQ== -->

```r
```r
library(lme4)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiTGFkZSBuw6bLnMK8w6PCuMK2dGlnZXMgUGFrZXQ6IE1hdHJpeFxuXG5BdHRhY2hlIFBha2V0OiDDo8KkwrzDo8K4wrFNYXRyaXjDo8KkwrzDo8K4wrJcblxuVGhlIGZvbGxvd2luZyBvYmplY3RzIGFyZSBtYXNrZWQgZnJvbSDDo8KkwrzDo8K4wrFwYWNrYWdlOnRpZHlyw6PCpMK8w6PCuMKyOlxuXG4gICAgZXhwYW5kLCBwYWNrLCB1bnBhY2tcbiJ9 -->

```
Lade næ˜¼ã¸¶tiges Paket: Matrix

Attache Paket: ã¤¼ã¸±Matrixã¤¼ã¸²

The following objects are masked from ã¤¼ã¸±package:tidyrã¤¼ã¸²:

    expand, pack, unpack
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubGlicmFyeShNdU1JbilcbmxpYnJhcnkoY2FyKVxuYGBgXG5gYGAifQ== -->

```r
```r
library(MuMIn)
library(car)
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## Data overview

load relatedness results


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubG9hZChcXGRhdGEvcmVsYXRlX3Jlc3VsdHMuUkRhdGFcXClcbmxvYWQoXFxkYXRhL3NhbXBsZV9JbmZvLlJEYXRhXFwpXG5sb2FkKFxcZGF0YS9kYXRhX292ZXJ2aWV3LlJEYXRhXFwpXG5cbmBgYFxuYGBgIn0= -->

```r
```r
load(\data/relate_results.RData\)
load(\data/sample_Info.RData\)
load(\data/data_overview.RData\)

```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuc3RyKHJlbGF0ZV9yZXN1bHRzKVxuXG5gYGBcbmBgYCJ9 -->

```r
```r
str(relate_results)

```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiJ2RhdGEuZnJhbWUnOlx0NDU2MCBvYnMuIG9mICA4NCB2YXJpYWJsZXM6XG4gJCBhICAgICAgICAgICAgICAgICAgICAgICAgICA6IGludCAgMCAwIDAgMCAwIDAgMCAwIDAgMCAuLi5cbiAkIGIgICAgICAgICAgICAgICAgICAgICAgICAgIDogaW50ICAxIDIgMyA0IDUgNiA3IDggOSAxMCAuLi5cbiAkIFJHU01fYS54ICAgICAgICAgICAgICAgICAgIDogY2hyICBcXFJHSUQxX1M4M1xcIFxcUkdJRDFfUzgzXFwgXFxSR0lEMV9TODNcXCBcXFJHSUQxX1M4M1xcIC4uLlxuICQgUkdTTV9iLnggICAgICAgICAgICAgICAgICAgOiBjaHIgIFxcUkdJRDFfUzgyXFwgXFxSR0lEMV9TMjlcXCBcXFJHSUQxX1MyXFwgXFxSR0lEMl9TMTNcXCAuLi5cbiAkIG5TaXRlcyAgICAgICAgICAgICAgICAgICAgIDogaW50ICA2MTQ5MjQgNTI3NDc0IDQzMDI1NCA2MTI1OTcgNTk5NTM2IDUxNTIxMSA0NjAwNDEgNTkxMjg0IDQ1MjExNiA0ODg5NTIgLi4uXG4gJCBKOSAgICAgICAgICAgICAgICAgICAgICAgICA6IG51bSAgMC44MjMgMC42MzYgMC40MjcgMC44NjMgMC44NjQgLi4uXG4gJCBKOCAgICAgICAgICAgICAgICAgICAgICAgICA6IG51bSAgMC4wIDEuNGUtMDUgMS4wZS0wNiAwLjAgMS4wZS0wNiAwLjAgMC4wIDEuMGUtMDYgMy4wZS0wNiAwLjAgLi4uXG4gJCBKNyAgICAgICAgICAgICAgICAgICAgICAgICA6IG51bSAgMC4wODk1IDAuMDYwMyAwLjExODQgMC4wNTM2IDAuMDQ2OCAuLi5cbiAkIEo2ICAgICAgICAgICAgICAgICAgICAgICAgIDogbnVtICAwIDAuMjA4IDAuNDEyIDAgMCAuLi5cbiAkIEo1ICAgICAgICAgICAgICAgICAgICAgICAgIDogbnVtICA0ZS0wNiAwZSswMCAxZS0wNSAwZSswMCAwZSswMCAwZSswMCAwZSswMCAwZSswMCAwZSswMCAwZSswMCAuLi5cbiAkIEo0ICAgICAgICAgICAgICAgICAgICAgICAgIDogbnVtICAwLjA1Mzg1IDAgMCAwLjAzMDg5MyAwLjAwMDA2MiAuLi5cbiAkIEozICAgICAgICAgICAgICAgICAgICAgICAgIDogbnVtICAwZSswMCAyZS0wNiAwZSswMCAwZSswMCAwZSswMCAwZSswMCAwZSswMCAyZS0wNiAwZSswMCAwZSswMCAuLi5cbiAkIEoyICAgICAgICAgICAgICAgICAgICAgICAgIDogbnVtICAwLjAzMzYgMC4wOTU5IDAuMDQyOSAwLjA1MjggMC4wODg4IC4uLlxuICQgSjEgICAgICAgICAgICAgICAgICAgICAgICAgOiBudW0gIDEuMGUtMDYgMC4wIDQuM2UtMDUgMS4wZS0wNiAwLjAgMC4wIDAuMCAxLjBlLTA2IDAuMCAwLjAgLi4uXG4gJCByYWIgICAgICAgICAgICAgICAgICAgICAgICA6IG51bSAgMC4wODk1IDAuMDYwNCAwLjExODUgMC4wNTM2IDAuMDQ2OCAuLi5cbiAkIEZhICAgICAgICAgICAgICAgICAgICAgICAgIDogbnVtICAwLjA4NzUgMC4wOTYgMC4wNDI5IDAuMDgzNyAwLjA4ODkgLi4uXG4gJCBGYiAgICAgICAgICAgICAgICAgICAgICAgICA6IG51bSAgMC4wMzM2IDAuMzAzNyAwLjQ1NDggMC4wNTI4IDAuMDg4OCAuLi5cbiAkIHRoZXRhICAgICAgICAgICAgICAgICAgICAgIDogbnVtICAwLjA0NDggMC4wMzAyIDAuMDU5MyAwLjAyNjggMC4wMjM0IC4uLlxuICQgaW5icmVkX3JlbGF0ZWRuZXNzXzFfMiAgICAgOiBudW0gIDEuMGUtMDYgMS4wZS0wNiA0LjNlLTA1IDEuMGUtMDYgMC4wIDAuMCAwLjAgMi4wZS0wNiAwLjAgMC4wIC4uLlxuICQgaW5icmVkX3JlbGF0ZWRuZXNzXzJfMSAgICAgOiBudW0gIDMuMGUtMDYgMC4wIDQuOGUtMDUgMS4wZS0wNiAwLjAgMC4wIDAuMCAxLjBlLTA2IDAuMCAwLjAgLi4uXG4gJCBmcmF0ZXJuaXR5ICAgICAgICAgICAgICAgICA6IG51bSAgMC4xMjMgMC4xNTYgMC4xNjEgMC4xMDYgMC4xMzYgLi4uXG4gJCBpZGVudGl0eSAgICAgICAgICAgICAgICAgICA6IG51bSAgMS4wZS0wNiAwLjAgNC4zZS0wNSAxLjBlLTA2IDAuMCAwLjAgMC4wIDEuMGUtMDYgMC4wIDAuMCAuLi5cbiAkIHp5Z29zaXR5ICAgICAgICAgICAgICAgICAgIDogbnVtICAwLjEyMyAwLjE1NiAwLjE2MSAwLjEwNiAwLjEzNiAuLi5cbiAkIFgyb2YzX0lEQiAgICAgICAgICAgICAgICAgIDogbnVtICAwLjE1IDAuMjYgMC4zNjcgMC4xMjIgMC4xMzYgLi4uXG4gJCBGX2RpZmZfYV9iICAgICAgICAgICAgICAgICA6IG51bSAgMC4wMjY5MjUgLTAuMTAzODc1IC0wLjIwNTk1NCAwLjAxNTQ0NiAwLjAwMDAzMSAuLi5cbiAkIGxvZ2xoICAgICAgICAgICAgICAgICAgICAgIDogbnVtICAtOTY5NDMwIC04NDQzNTYgLTY3NzE1NyAtOTY5NTkzIC05NTUxMjIgLi4uXG4gJCBuSXRlciAgICAgICAgICAgICAgICAgICAgICA6IGludCAgNTQgNjIgNzggNjIgNjIgNTQgMzggNDYgNDIgNTggLi4uXG4gJCBiZXN0b3B0aW1sbCAgICAgICAgICAgICAgICA6IGludCAgLTEgLTEgLTEgLTEgLTEgLTEgLTEgLTEgLTEgLTEgLi4uXG4gJCBjb3ZlcmFnZSAgICAgICAgICAgICAgICAgICA6IG51bSAgMC45MjYgMC43OTQgMC42NDggMC45MjIgMC45MDMgLi4uXG4gJCBYMmRzZnMgICAgICAgICAgICAgICAgICAgICA6IGNociAgXFwzLjEzNjgxOWUtMDFcbiJ9 -->

```
'data.frame':	4560 obs. of  84 variables:
 $ a                          : int  0 0 0 0 0 0 0 0 0 0 ...
 $ b                          : int  1 2 3 4 5 6 7 8 9 10 ...
 $ RGSM_a.x                   : chr  \RGID1_S83\ \RGID1_S83\ \RGID1_S83\ \RGID1_S83\ ...
 $ RGSM_b.x                   : chr  \RGID1_S82\ \RGID1_S29\ \RGID1_S2\ \RGID2_S13\ ...
 $ nSites                     : int  614924 527474 430254 612597 599536 515211 460041 591284 452116 488952 ...
 $ J9                         : num  0.823 0.636 0.427 0.863 0.864 ...
 $ J8                         : num  0.0 1.4e-05 1.0e-06 0.0 1.0e-06 0.0 0.0 1.0e-06 3.0e-06 0.0 ...
 $ J7                         : num  0.0895 0.0603 0.1184 0.0536 0.0468 ...
 $ J6                         : num  0 0.208 0.412 0 0 ...
 $ J5                         : num  4e-06 0e+00 1e-05 0e+00 0e+00 0e+00 0e+00 0e+00 0e+00 0e+00 ...
 $ J4                         : num  0.05385 0 0 0.030893 0.000062 ...
 $ J3                         : num  0e+00 2e-06 0e+00 0e+00 0e+00 0e+00 0e+00 2e-06 0e+00 0e+00 ...
 $ J2                         : num  0.0336 0.0959 0.0429 0.0528 0.0888 ...
 $ J1                         : num  1.0e-06 0.0 4.3e-05 1.0e-06 0.0 0.0 0.0 1.0e-06 0.0 0.0 ...
 $ rab                        : num  0.0895 0.0604 0.1185 0.0536 0.0468 ...
 $ Fa                         : num  0.0875 0.096 0.0429 0.0837 0.0889 ...
 $ Fb                         : num  0.0336 0.3037 0.4548 0.0528 0.0888 ...
 $ theta                      : num  0.0448 0.0302 0.0593 0.0268 0.0234 ...
 $ inbred_relatedness_1_2     : num  1.0e-06 1.0e-06 4.3e-05 1.0e-06 0.0 0.0 0.0 2.0e-06 0.0 0.0 ...
 $ inbred_relatedness_2_1     : num  3.0e-06 0.0 4.8e-05 1.0e-06 0.0 0.0 0.0 1.0e-06 0.0 0.0 ...
 $ fraternity                 : num  0.123 0.156 0.161 0.106 0.136 ...
 $ identity                   : num  1.0e-06 0.0 4.3e-05 1.0e-06 0.0 0.0 0.0 1.0e-06 0.0 0.0 ...
 $ zygosity                   : num  0.123 0.156 0.161 0.106 0.136 ...
 $ X2of3_IDB                  : num  0.15 0.26 0.367 0.122 0.136 ...
 $ F_diff_a_b                 : num  0.026925 -0.103875 -0.205954 0.015446 0.000031 ...
 $ loglh                      : num  -969430 -844356 -677157 -969593 -955122 ...
 $ nIter                      : int  54 62 78 62 62 54 38 46 42 58 ...
 $ bestoptimll                : int  -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ...
 $ coverage                   : num  0.926 0.794 0.648 0.922 0.903 ...
 $ X2dsfs                     : chr  \3.136819e-01
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->





load association data

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubG9hZChcXGRhdGEvY28tcm9vc3RpbmctbmV0d29yay5SRGF0YVxcKVxuc3RyKG5ldHdvcmspXG5gYGBcbmBgYCJ9 -->

```r
```r
load(\data/co-roosting-network.RData\)
str(network)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiTGlzdCBvZiA2XG4gJCA6IG51bSBbMToxMCwgMToxMF0gMCAwIDAgMCAwIDAgMCAwIDAgMCAuLi5cbiAgLi4tIGF0dHIoKiwgXFxkaW1uYW1lc1xcKT1MaXN0IG9mIDJcbiAgLi4gLi4kIDogY2hyIFsxOjEwXSBcXDEzMDhcXCBcXDEzMTlcXCBcXDEzMjhcXCBcXDEzOTNcXCAuLi5cbiAgLi4gLi4kIDogY2hyIFsxOjEwXSBcXDEzMDhcXCBcXDEzMTlcXCBcXDEzMjhcXCBcXDEzOTNcXCAuLi5cbiAkIDogbnVtIFsxOjEwLCAxOjEwXSAwIDAgMCAwIDAuNDQ4IC4uLlxuICAuLi0gYXR0cigqLCBcXGRpbW5hbWVzXFwpPUxpc3Qgb2YgMlxuICAuLiAuLiQgOiBjaHIgWzE6MTBdIFxcMTMwOFxcIFxcMTMxOVxcIFxcMTMyOFxcIFxcMTM5M1xcIC4uLlxuICAuLiAuLiQgOiBjaHIgWzE6MTBdIFxcMTMwOFxcIFxcMTMxOVxcIFxcMTMyOFxcIFxcMTM5M1xcIC4uLlxuICQgOiBudW0gWzE6MTAsIDE6MTBdIDAgMCAwIDAgMC40NjYgLi4uXG4gIC4uLSBhdHRyKCosIFxcZGltbmFtZXNcXCk9TGlzdCBvZiAyXG4gIC4uIC4uJCA6IGNociBbMToxMF0gXFwxMzA4XFwgXFwxMzE5XFwgXFwxMzI4XFwgXFwxMzkzXFwgLi4uXG4gIC4uIC4uJCA6IGNociBbMToxMF0gXFwxMzA4XFwgXFwxMzE5XFwgXFwxMzI4XFwgXFwxMzkzXFwgLi4uXG4gJCA6IG51bSBbMToxMywgMToxM10gMCAwIDAgMCAwIDAgMCAwIDAgMCAuLi5cbiAgLi4tIGF0dHIoKiwgXFxkaW1uYW1lc1xcKT1MaXN0IG9mIDJcbiAgLi4gLi4kIDogY2hyIFsxOjEzXSBcXDEzMDhcXCBcXDEzMTlcXCBcXDEzMjhcXCBcXDEzOTNcXCAuLi5cbiAgLi4gLi4kIDogY2hyIFsxOjEzXSBcXDEzMDhcXCBcXDEzMTlcXCBcXDEzMjhcXCBcXDEzOTNcXCAuLi5cbiAkIDogbnVtIFsxOjExLCAxOjExXSAwIDAuODM4IDAgMCAwIC4uLlxuICAuLi0gYXR0cigqLCBcXGRpbW5hbWVzXFwpPUxpc3Qgb2YgMlxuICAuLiAuLiQgOiBjaHIgWzE6MTFdIFxcMTMxOVxcIFxcMTMyOFxcIFxcMTM5OFxcIFxcMTQyOVxcIC4uLlxuICAuLiAuLiQgOiBjaHIgWzE6MTFdIFxcMTMxOVxcIFxcMTMyOFxcIFxcMTM5OFxcIFxcMTQyOVxcIC4uLlxuICQgOiBudW0gWzE6OSwgMTo5XSAwIDAuODY5IDAgMCAwIC4uLlxuICAuLi0gYXR0cigqLCBcXGRpbW5hbWVzXFwpPUxpc3Qgb2YgMlxuICAuLiAuLiQgOiBjaHIgWzE6OV0gXFwxMzE5XFwgXFwxMzI4XFwgXFwxMzk4XFwgXFwxNDQ2XFwgLi4uXG4gIC4uIC4uJCA6IGNociBbMTo5XSBcXDEzMTlcXCBcXDEzMjhcXCBcXDEzOThcXCBcXDE0NDZcXCAuLi5cbiJ9 -->

```
List of 6
 $ : num [1:10, 1:10] 0 0 0 0 0 0 0 0 0 0 ...
  ..- attr(*, \dimnames\)=List of 2
  .. ..$ : chr [1:10] \1308\ \1319\ \1328\ \1393\ ...
  .. ..$ : chr [1:10] \1308\ \1319\ \1328\ \1393\ ...
 $ : num [1:10, 1:10] 0 0 0 0 0.448 ...
  ..- attr(*, \dimnames\)=List of 2
  .. ..$ : chr [1:10] \1308\ \1319\ \1328\ \1393\ ...
  .. ..$ : chr [1:10] \1308\ \1319\ \1328\ \1393\ ...
 $ : num [1:10, 1:10] 0 0 0 0 0.466 ...
  ..- attr(*, \dimnames\)=List of 2
  .. ..$ : chr [1:10] \1308\ \1319\ \1328\ \1393\ ...
  .. ..$ : chr [1:10] \1308\ \1319\ \1328\ \1393\ ...
 $ : num [1:13, 1:13] 0 0 0 0 0 0 0 0 0 0 ...
  ..- attr(*, \dimnames\)=List of 2
  .. ..$ : chr [1:13] \1308\ \1319\ \1328\ \1393\ ...
  .. ..$ : chr [1:13] \1308\ \1319\ \1328\ \1393\ ...
 $ : num [1:11, 1:11] 0 0.838 0 0 0 ...
  ..- attr(*, \dimnames\)=List of 2
  .. ..$ : chr [1:11] \1319\ \1328\ \1398\ \1429\ ...
  .. ..$ : chr [1:11] \1319\ \1328\ \1398\ \1429\ ...
 $ : num [1:9, 1:9] 0 0.869 0 0 0 ...
  ..- attr(*, \dimnames\)=List of 2
  .. ..$ : chr [1:9] \1319\ \1328\ \1398\ \1446\ ...
  .. ..$ : chr [1:9] \1319\ \1328\ \1398\ \1446\ ...
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




## network of relatedness
let's try to visualize the relatedness relationships with network, in which each individual is a node and edges show genetic relationship


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuI3NlbGVjdCByZWxhdGVkbmVzcyBkYXRhIChuZ3NyZWxhdGUgcmFiKSBmcm9tIG1wYWxhXG4jcmVsYXRlZG5lc3NfcmFiIDwtIHJlbGF0ZV9yZXN1bHRzJT4lIHN1YnNldChhX0dyb3VwICVpbiUgYyhcXG1wYWxhXFwsIFxcbXBhbGFfY2hpY2tzXFwpICYgYl9Hcm91cCAlaW4lIGMoXFxtcGFsYVxcLCBcXG1wYWxhX2NoaWNrc1xcKSkgJT4lIHNlbGVjdChJRF9hLCBJRF9iLCByYWIpXG5cbnJlbGF0ZWRuZXNzX3JhYiA8LSByZWxhdGVfcmVzdWx0cyAlPiUgc2VsZWN0KElEX2EsIElEX2IsIHJhYilcblxuI2NyZWF0ZSBub2RlIGxpc3RcbklEX2EgPC0gcmVsYXRlZG5lc3NfcmFiICU+JSBkaXN0aW5jdChJRF9hKSAlPiUgcmVuYW1lKGxhYmVsID0gSURfYSlcblxuSURfYiA8LSByZWxhdGVkbmVzc19yYWIgJT4lIGRpc3RpbmN0KElEX2IpICU+JSByZW5hbWUobGFiZWwgPSBJRF9iKVxuXG5ub2RlcyA8LSBmdWxsX2pvaW4oSURfYSwgSURfYiwgYnkgPSBcXGxhYmVsXFwpXG5cbm5vZGVzIDwtIG5vZGVzICU+JSByb3dpZF90b19jb2x1bW4oXFxpZFxcKVxuXG5ub2RlcyA8LSBsZWZ0X2pvaW4obm9kZXMsIHNhbXBsZV9pbmZvLCBieSA9IGMoXFxsYWJlbFxcPSBcXElEXFwpKVxuXG5ub2Rlc1xuYGBgXG5gYGByXG5OQVxuYGBgXG5gYGAifQ== -->

```r
```r
#select relatedness data (ngsrelate rab) from mpala
#relatedness_rab <- relate_results%>% subset(a_Group %in% c(\mpala\, \mpala_chicks\) & b_Group %in% c(\mpala\, \mpala_chicks\)) %>% select(ID_a, ID_b, rab)

relatedness_rab <- relate_results %>% select(ID_a, ID_b, rab)

#create node list
ID_a <- relatedness_rab %>% distinct(ID_a) %>% rename(label = ID_a)

ID_b <- relatedness_rab %>% distinct(ID_b) %>% rename(label = ID_b)

nodes <- full_join(ID_a, ID_b, by = \label\)

nodes <- nodes %>% rowid_to_column(\id\)

nodes <- left_join(nodes, sample_info, by = c(\label\= \ID\))

nodes
```
```r
NA
```
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjoiZGF0YS5mcmFtZSIsIm5jb2wiOjQsIm5yb3ciOjk2fSwicmRmIjoiSDRzSUFBQUFBQUFBQnEyWTkzUGJOaFRIS1psZWFwclJ2Wk0ybyttd0NvQWtLSGFramVNMm8wM3NxR250VG9lVlpWc1hyWlBrYzM3c1g1NzJTNGswdjVBc210YlpkeDhMRDNnTDd3RzRrNnByVzA1cHEyUloxcHcxdHdEbU1iUVc3bXhJNVNuTHNvdVFDcFp0TFVlZno2SDFLZ1kyZUJrOEhTNWFWbkZvUHBxUDdCZkFJbGdDa1dIay9pVndMclk3RHk2QWkrQVNlQVZFZmw4RHI0TTN3SnZnTGZBMmVBZThDOTRENzRNUHdHVndCWHdJUGdKWHdUVndIZHdBSDRPYjRCUHdLZmdNZkE1V1FCbDhBUVNRQUJ1MUhPQUNEMmpnZ3dvSXdKZmdLL0ExK0FiY0F0K0M3OEJ0c0FydWdEWHdQZmdCM0FYM3dIM3dBUHdJZmdJUHdTT3dEamJBWTFBRlA0TW40QmZ3SzlnRVcrQTM4RHY0QS93Si9nSi9nKzI0L2hlSG42TUdMVzQrRWNLcGFGTlVzVGkvS1YwM1NBVW5xQ1RDYmVsSVVsTitKUlcwcjFuTmNLNEZXZWtLK1ZPQm9laWxXY0NKOEZNcnoxV2NrdVFWajEwSUk1WXZPVjJIRlpWd3lBbGJlY0tsV0JYSnVkT0txbEIranFCYU9KNUloRFhYbHk0blJFRWR5V1gyYU1WVkFSZlQ0d3dDN2hObkVKQURGYmhjU0hhZ09kRzBnNnRRNDk2eU4xMFJaS040UldzdWlKRzFTQVVWVUFZdTc4ZDF5WUdqYVQvS1Q3d04yeVUxbGRGenVROCtIdzJmcXgzd2lyRUpMZGk1RmtidERNV2o5cU9WeWppNlBndFVWYy8wSmptU01nK2E1RXJ3MFVpUDRDcGNHTmVSRDZlaVZGM2oyQ3B1TXg5YlJ4b0NxZm1jbXkrTXk4M2V1UGkrMEdtaWpqVDI2Z3FqTWR4bzg4NUs3YkJINDFvRm5BV3R1Tko0SGZndUcwZEsrV092MzdsV04yeUcyN1g5UnUxWlAyTnUyUXNjdVlKL3lkWnR6enQ2L1pZUEcrMjk3VUc0bDJqUER6MGt3dUZBS0crYWFxNWcrYXpHbFNZbTdKMkRWdmMwTG8zVWpVMGRwMjFYcTV1clUrdEZzYWU3blV6Wjg5S21UNjJxSWJDSlhWMWYzNWhhbjRreWowK1lFYk1UcFVpWmRaNWhGOW1STTJ1VzNZZVRPcHFkdkxITnJEZzhQdmFZVGZONnlvMW45eS92dFU1cmQzTEFpZnBNYmFHeGtIaytjcm5JcDVYcmtodWRJazhuUGdqNVU4OWRPUE54THV3bWc5WlpEM2FuaDVoY3loaE1XczBXTkVQNXJMWXptK2ZacXBvbncxTXBueXJFYk1YTWN4TE9hdSt6OVhTMkEzbWNqdmtkZmI0ZHR1cjkrUExaOFdTeHNaTXNOOE4vNnMxWVdMcmI2eHgwdCsrdnhmSmN2LzU4ek4xeXIzTllUbHhHWDkyTC8xckR2NmZqY1d2TnNKL0VUU1pMTytFZ0xPLzJZQS9weFpqSllxYzdhSFRhTUNwR1gvNmpId3RLMXVnSGhjS1lvK0xWV3htcmhkN1l4SVdEZHBUenprcHQvNkQ5YkVXVHJSWHZvekRhdzlIWUhpVlgvQzkydFpUVXFOWnBOc051djU0a1hldTBXdlgySUhrWjY3WDlUanhlcUxmM0d1MzZjWlUranpJT3ExanU5aHBIeGlYTTlzdUR6aUJNOUVxSWxzd01DMmE5K0IvRFdaUTNvUkVBQUE9PSJ9 -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id"],"name":[1],"type":["int"],"align":["right"]},{"label":["label"],"name":[2],"type":["chr"],"align":["left"]},{"label":["Group_ID"],"name":[3],"type":["chr"],"align":["left"]},{"label":["sex"],"name":[4],"type":["chr"],"align":["left"]}],"data":[{"1":"1","2":"WT00386","3":"mpala_chicks","4":"f"},{"1":"2","2":"WT00382","3":"mpala_chicks","4":"m"},{"1":"3","2":"W1449","3":"5931-5938","4":"m"},{"1":"4","2":"W1398","3":"5512","4":"m"},{"1":"5","2":"A1312","3":"wing_tags","4":"m"},{"1":"6","2":"W1278","3":"mpala","4":"m"},{"1":"7","2":"W1676","3":"wt025","4":"m"},{"1":"8","2":"A1316","3":"wing_tags","4":"m"},{"1":"9","2":"WT00602","3":"mpala_chicks","4":"m"},{"1":"10","2":"W1688","3":"5931-5938","4":"m"},{"1":"11","2":"A1296","3":"wing_tags","4":"f"},{"1":"12","2":"WT00582","3":"mpala_chicks","4":"f"},{"1":"13","2":"A1307","3":"wing_tags","4":"m"},{"1":"14","2":"W1542","3":"wing_tags","4":"f"},{"1":"15","2":"W1391","3":"dump","4":"f"},{"1":"16","2":"W1545","3":"wing_tags","4":"f"},{"1":"17","2":"WT00002","3":"mpala_chicks","4":"f"},{"1":"18","2":"W1671","3":"wt025","4":"f"},{"1":"19","2":"W1273","3":"mpala","4":"m"},{"1":"20","2":"WT00203","3":"mpala_chicks","4":"f"},{"1":"21","2":"W1502","3":"RRWB","4":"m"},{"1":"22","2":"W1504","3":"5931-5938","4":"m"},{"1":"23","2":"W1381","3":"dump","4":"m"},{"1":"24","2":"W1684","3":"wt025","4":"f"},{"1":"25","2":"W1287","3":"mpala","4":"f"},{"1":"26","2":"W1308","3":"wing_tags","4":"m"},{"1":"27","2":"W1350","3":"5509","4":"m"},{"1":"28","2":"D4714","3":"mpala","4":"m"},{"1":"29","2":"W1673","3":"wt025","4":"f"},{"1":"30","2":"W1319","3":"wt025","4":"m"},{"1":"31","2":"W1353","3":"5509","4":"m"},{"1":"32","2":"W1429","3":"ROOP","4":"m"},{"1":"33","2":"A1315","3":"wing_tags","4":"m"},{"1":"34","2":"W1689","3":"5931-5938","4":"f"},{"1":"35","2":"W1447","3":"5931-5938","4":"f"},{"1":"36","2":"W1393","3":"mpala","4":"m"},{"1":"37","2":"W1294","3":"mpala","4":"f"},{"1":"38","2":"A1305","3":"wing_tags","4":"m"},{"1":"39","2":"W1668","3":"ROOP","4":"f"},{"1":"40","2":"W1378","3":"dump","4":"m"},{"1":"41","2":"B1302","3":"wing_tags","4":"m"},{"1":"42","2":"W1293","3":"mpala","4":"m"},{"1":"43","2":"W1680","3":"wt025","4":"m"},{"1":"44","2":"W1323","3":"wt025","4":"m"},{"1":"45","2":"W1666","3":"5509","4":"m"},{"1":"46","2":"W1289","3":"mpala","4":"m"},{"1":"47","2":"A1310","3":"wing_tags","4":"m"},{"1":"48","2":"A1295","3":"wing_tags","4":"m"},{"1":"49","2":"W1415","3":"5509","4":"f"},{"1":"50","2":"W1446","3":"5931-5938","4":"m"},{"1":"51","2":"W1367","3":"dump","4":"m"},{"1":"52","2":"W1279","3":"mpala","4":"f"},{"1":"53","2":"WT00164","3":"mpala_chicks","4":"f"},{"1":"54","2":"W1544","3":"wing_tags","4":"f"},{"1":"55","2":"W1272","3":"mpala","4":"m"},{"1":"56","2":"W1374","3":"dump","4":"m"},{"1":"57","2":"W1692","3":"5931-5938","4":"f"},{"1":"58","2":"W1380","3":"dump","4":"f"},{"1":"59","2":"W1360","3":"dump","4":"m"},{"1":"60","2":"WT00603","3":"mpala_chicks","4":"f"},{"1":"61","2":"W1290","3":"mpala","4":"m"},{"1":"62","2":"W1361","3":"dump","4":"m"},{"1":"63","2":"D4728","3":"mpala","4":"f"},{"1":"64","2":"A1297","3":"wing_tags","4":"m"},{"1":"65","2":"A1298","3":"wing_tags","4":"m"},{"1":"66","2":"W1503","3":"5931-5938","4":"f"},{"1":"67","2":"W1291","3":"mpala","4":"m"},{"1":"68","2":"WT00202","3":"mpala_chicks","4":"m"},{"1":"69","2":"W1501","3":"5931-5938","4":"m"},{"1":"70","2":"W1443","3":"5509","4":"f"},{"1":"71","2":"W1304","3":"wing_tags","4":"m"},{"1":"72","2":"B1299","3":"wing_tags","4":"f"},{"1":"73","2":"W1394","3":"wing_tags","4":"f"},{"1":"74","2":"W1320","3":"wt025","4":"m"},{"1":"75","2":"W1404","3":"5509","4":"m"},{"1":"76","2":"W1328","3":"wt025","4":"m"},{"1":"77","2":"W1384","3":"dump","4":"f"},{"1":"78","2":"W1314","3":"wing_tags","4":"m"},{"1":"79","2":"W1318","3":"wt025","4":"m"},{"1":"80","2":"W1702","3":"5509","4":"f"},{"1":"81","2":"W1708","3":"wt025","4":"f"},{"1":"82","2":"W1678","3":"wt025","4":"m"},{"1":"83","2":"W1344","3":"5509","4":"m"},{"1":"84","2":"W1706","3":"wt025","4":"m"},{"1":"85","2":"B1311","3":"wing_tags","4":"m"},{"1":"86","2":"WT00402","3":"mpala_chicks","4":"f"},{"1":"87","2":"W1376","3":"dump","4":"f"},{"1":"88","2":"W1345","3":"5509","4":"f"},{"1":"89","2":"WT00163","3":"mpala_chicks","4":"f"},{"1":"90","2":"W1707","3":"wt025","4":"f"},{"1":"91","2":"W1309","3":"wing_tags","4":"f"},{"1":"92","2":"W1677","3":"wt025","4":"m"},{"1":"93","2":"W1417","3":"5509","4":"f"},{"1":"94","2":"W1543","3":"wing_tags","4":"f"},{"1":"95","2":"W1546","3":"wing_tags","4":"f"},{"1":"96","2":"W1327","3":"wt025","4":"m"}],"options":{"columns":{"min":{},"max":[10],"total":[4]},"rows":{"min":[10],"max":[10],"total":[96]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->




<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuI2NyZWF0ZSBlZGdlIGxpc3RcbmVkZ2VzIDwtIHJlbGF0ZWRuZXNzX3JhYiAlPiUgbGVmdF9qb2luKG5vZGVzLCBieSA9IGMoXFxJRF9hXFwgPSBcXGxhYmVsXFwpKSAlPiUgcmVuYW1lKGlkX2EgPSBpZClcblxuZWRnZXMgPC0gZWRnZXMgJT4lIGxlZnRfam9pbihub2RlcywgYnkgPSBjKFxcSURfYlxcID0gXFxsYWJlbFxcKSkgJT4lIHJlbmFtZShpZF9iID0gaWQpICU+JSByZW5hbWUgKHdlaWdodCA9IHJhYilcblxuZWRnZXMgPC0gc2VsZWN0KGVkZ2VzLCBpZF9hLCBpZF9iLCB3ZWlnaHQpXG5cbmVkZ2VzXG5gYGBcbmBgYCJ9 -->

```r
```r
#create edge list
edges <- relatedness_rab %>% left_join(nodes, by = c(\ID_a\ = \label\)) %>% rename(id_a = id)

edges <- edges %>% left_join(nodes, by = c(\ID_b\ = \label\)) %>% rename(id_b = id) %>% rename (weight = rab)

edges <- select(edges, id_a, id_b, weight)

edges
```
```

<!-- rnb-source-end -->

<!-- rnb-frame-begin eyJtZXRhZGF0YSI6eyJjbGFzc2VzIjoiZGF0YS5mcmFtZSIsIm5jb2wiOjMsIm5yb3ciOjQ1NjB9LCJyZGYiOiJINHNJQUFBQUFBQUFCdTJiZVRqVTdkdi9SZFpDWlNsUzJsQVVTcHRTNzRwS2FTSHRLaEZwc1ZSVWxMSWxwUlRLdmh2RFdNYnNtNlZFSXBVMkxTUkVwWVZLaTBMeFhPUFIvWHgvM3o5K3gvUEhjOS9mZjNJY3I4Tm5aajdMTmVkYzEzbSszK2RuWnAzRlpoT0Z6UW9TRWhKU0VsSXlCR215S1NGamJqMTl4cXdaRWhLREpjbWpRUktESmVURi83M0pYaXI5dTBwSUtKSi9iL3BmL01OL0Nzay8vRWVRK3NNL3p1QS8vS05JLytFZlErWVAvd2l5Zi9qYmtmdkQzNHI4SC80MkZQN3d0ekRrRC8vbkRQMWY4dHVuLy9ZdHY3WGQ3M3I0TzZjby9NdDV5VEVTU2dSbHdqRENjTUlJZ3RqN3F4TFVDT3FFa1lSUkJBMkNKbUUwUVlzd2hqQ1dvRTBZUnhoUG1FQ1lTSmhFMENIb0V2UUlrd2xUQ1BvRUE4SlV3alNDSWNHSVlFeVlUcGhCTUNITUpNd2l6Q2JNSWN3bG1CTG1FZVlUekFnTENBc0pJQ3dpTENZc0laZ1RMQWhMQ2NzSXl3bVdoQldFbFFRcndpckNhc0lhd2xxQ05jR0dzSTVnUzFoUDJFRFlTTmhFMkV6WVF0aEtzQ05zSTJ3bjdDRFlFM2IraWZ0L0xPNS9ZdjdQeC94UHZQL1plUCtKOVQ4WDZ6OXgvbWZpL0NmR2YzK00vOFQzNzQzdm45aitmYkg5RTllL0o2NS9ZdnAvSDlQL2JUeVZ4RDRkL0hmclBrWm9mVUgrNjhPcWZpb3l1TExoZmxsZVpBSnkzUlVuMW5Uc1FOYlhtUm90RW1ySWNhSHFWOWkyZ3JIMmgvT1RXNGFnSHNBME01OXBZTCtMSHVLUmNndGN6WThlRndlcmdtdXEraldvcWdmWi9oNjZrOC93SUxqVDIvTjFVRG40cVNhdEZ6Uk1VSEQ4bFczZVdqOFV4YVpQZURSeUxQaDV3eTZuaTJyQTlLcnNFN0tkd0x0SU9SSTVMUXA1SzM0ZFV5bmRBS2F2UUtHTTVvQjh1OHlQWlFmcklCZ1RLZWlWWTBBWTdlMzcxajRYdVkrMTdWN1Z2Z1FuNHZXeWpvMGFZS1ZLWDNmV0JvUnJyTXZmVHpjRGU2ZEgzczZsaFdENmJSenZkYjBhMmVhK0d5TTV0NUVsR3Fub2VIVUUrSDBudWlXYVQwS1lzRTdpUk0xaVpKN1NXeHkyVndFaWorRkdENmM2Z3FrWlduNE45OEZOTjBsVXV0SUVaa0JweThJK0RXUUV0OVFabld0RTF0SFBmaStMOHNGVVYzdmZmZkVrdUlZakhDVnRZOEJTZnZKeXM5UWQ1TmpXSGNvcVhvRmNiUjM3V1JyRllEanBWWlRyS29PL3dyMmhybTBsT2QvRG5Oa3BkOEV4b1ZGK3hFNERxOXhhNHFadElnUU5pcnMvM1gwQnZ1MXc3YUV6UzhGVk5YSm8zOXFNbkZwNmNDUHRFRVFINWZ5ZkR1SkNkRVorelhZN0hiRGZqQXFrWDY4Q2srTi95L1hZQ1JRSlhqYk1EOVZFM3B5ZFY3ZDdCNENYOVdDeC84TjdZSER0UnhhZmEwVkplZDAraThYZUtMRjZPWGhjWndlWUwzdGlDajNsUUgwbnRkRDd4U1hrVm9oM1BJOENGNldwSStpQktCeEZjenY0eFJHQ0p3YTM3RitaUTVDcFJtdGc5b0FXSmhlUjNMVUJ1ZWFlWDlSYkRvSjFLWEpVd3RPNUVJNTZIQjdmdmdsNWRmSzNweWR1UmM3OWxRcktxNDlEWkthejBzeHBKcmdIRFJjRkc2d0JteDdwMWF3L0ZZeHg0MlVGcDNhRDRSODM4bEs4TDFocHY5VDJmZzBINTlvNWEvMkNxK0I5WEx6L21hWWJlSDNmRTA4WlVjRmxET21nVnVtRE5iZXZwM3JKS0xDdmJsQ1RYbGtHaHA5ZXIxVlZIZmkvMXE5WE0xQUFxNVQ1YnRRY1EzQktMbWJSck5XUngxbkFDUHRPUlNIL2FDY3JuWXFpSFBOWmNwMHJJTXFlY2VtK1pCRkVFb1lUSjNkOUJkL3o0TENYdGcvQWJYcnZVbnE2Qzlkcng3N0xmT0FDWWZHUkQ1NnZBOEUwc3RIZHRYZ1VXRmthM1ByM2ZlQ2ZsU2dmL3p3VjdFblBqVFJUcm9ENVdlL2U1TFFtc0hadnVUK1YzZ0JtLzNKUkFXZTZ3ZWpaeFFZUXBjN1ZXRFZvSjFoRnY2dyt4ZGxCOUdwZVFMMGlHOExYak5zdnlnTWh5aXM2UC9UdEdMQXZSRDdhT2s4T1BBL2hOei9Qa3hDTi8rQmlzN3lEN0QrbDRLWHJMd2dsRGg4b2Qrb0M1MjN0YXNXN3R5RktIRG5CemlzQm92c1JtM0tGL2hBTis2WjVrOUVNOXVQczhwMFYxOEJSbUpxZE4zczlPQTlySml1OGtJWm85dU1OemFFWllPNW12U29SeFlIM2toS2s1N0lhek5ubVo5N2Zka1hCNmxKOXR0MTBDTzR1S0ZuL2NSbDRQMHJIamhudkEySEdmTzZRbWEwbytuVng2TkhuSVNoWVVYcU5wZndVd2krM0ZtNnl6UURmNjRUL0R2dnBLRkJaMWRMZ3NCS3NkRjY2WXIwalJHdVBSVVJIMWFLb1BtVDlsNlBia0ZkdlFUTEdLYkJuVmcyZFBOVURUT09ITXVtc0F4RFc4dDdhZWQrQjBFbFNidVRQSTJDZk50cHl0bkU0Mk9lYXY3TjhYMEhRd1k4WXI2T0t3dkZhVE5PUHlxanVENE1mUkEvUDBKaGhEOEEwVWZROExSOFB2dC9EYjd6dUNSQ1NON08rcUFPY0hqV2U1enNPUkpzMlBjcCtQdzdsT2pYVXhnbnpVUGpESlBDbGxRYzRWVm1iazMrRm9IRDI4b0pzYnZ4Zm55ZXI4V1pmNUdjK2hFK1NGRndjbFZGd2xoWmFQYWtJaFQxN1kxY3FMUWJ6M3RMZTRTT09RdGkvdkthZ29EM3UxZ2QvTW8vUGY0bDllK0FRbUdyeXZ2Nm50Q0ZhR2pYcmRGVW9DbVp2NDlndk9BRyswN2ZWWTZPdlEvVHp3UnAxeFROZ21YeWR1TzY5UGRnK2hmU1MyQ0ZnaTdQa0ZBSG9tOFFKZ2F4Zng2NHF1OXFsWUJuYXJKcndZUWtLbk9tMXBTZWp3TnptblZsWFZRVG1tSkpuZXBJVU1Na2syc0NjalFMcmpPMkx1NCtBcFhLSWNpNjBCVUxUNVN2MjBjZEFFTVd4RzNMVkJrays5ektQalB1SW5MUWZMWGxEZDRIL3MzakR6bE5VNU9pRkRTM2Ixb3d3VnViajJONjlTQzh1ZGFzMjVTTDFzbGFnK2cwMW5EdHhLbnlNaGhyWXcxWk10UGVQQXlPa09xcWJSa01jYjV6c2N3c1ZoSHQ4OUoyMDRBNHlqMnRKREx2eEErblhMZ2E4U1c4RDFZcCt3bmRxR2pJckRRY2xLSEJBVzhtWEVlVG80ckxkWjQ4eDVZcUlpL3FnNG42d0d1bVRlM1dIVEQwRmxrUGFzNUJqSERBWTQ5N1oyU29pYW1LbjMrcmlMakNWcmpSbTREV1lEUzFyYnd6cmdIQ212SmFjbHpreTYwSlNEOTFuSVB6dG85RnJXMU1RKzh3eVBQTHNNN0RqdW9kbkgyYUNsUnowVWlmL05YS2ZOa21jbmxNTU9zYzNMajl5TFdqS1IxMHQ5UVJJM3FVZEtpL1pBSFpwbytMaTZST1JmK0RreU8wcVR5QXluK3haRkE0eS8wNnViaEdtZzU1NC90SzQyc3ZJc0pTWm90UXVCZnF0dnVXZTIwWWgwdkNsaGthZUQvS1p0aHFCWjZSQlcvSzBOR005V2Y4elREWi9idG9PdG0rWXh1Ym9lTkJXanhnVWFsNklqRlhISlI4bGJRVGxVTUN2aERRMlVqSWJmaDR6RFVSRVhLKzV5L2JuWU9udGVCdnYyQTZhbVd2TTA3dnp3SXpmdUlsTU9hUnQyNVd2czdnV01TR1dPeGFrZHlHalJ0TEtwSzRMZEZLRlR2QmZnVnEvU0hiVDBJM0kyTkZwbEVpOUFsNG96Vm5wYUNUbzFTK09TZlpzSjlkTkRML2VVSXJNSmFZN1BSdkc0cHhyY2F6dnJzbUluRUo5TC9CTVFicjI1NWNYUWcrQlBUZXJkZDdzN2FCTERkc2dqRE1GUmJyNy9YVzVXbVJJelZaekxuMEEycG9NMnJYMVZVZ0tUOUZXalYyQU0yNkdUNElhdjRMeFlnWnZSMGN2c3M5OE5YcWpNd3A1eTgwZWVUcjVJa040dlA2VHNSL3kvdnVOZzdtOFRORjRud0hTVDF1MytvdzdBY1lvODdJTUkyM1FMUW8xdjZTdEJqV21KdWw0NWo1UXhjdnBlQ0VTNzlnT1B2dkFGd21lOThWblJtcnhiajNmcGJlUlhxVjZqb2ExRUcxMTNUN09sZVNqcmxpWno0NW5rU1BMV1VjekR5RHpLYzUzd1o1RktQRHpIOUg0T0FycER4M2ZTam1aSXRUNlV2VEtMU1hJbC9kZWMyTTJDL1RnWTcyVVJuY2tPNnBvWHZqdUI3WmorNndKNDRyQXM5c2puZjdFR0xIakdTZU02Y3RCNGRhY0NmejBBbHozazQ3MTd2cklUV05GSzZmdElIbk9hSi8xWXpabyt4dFhHZGdVSTF1dlpxdDlSU3VTWlY5bFhkUkpSK2IxbmUzK2FjZEJUNXE1K2M0NEptZ1crY0dpTjllUklaWTVPNS8vVlVkVGIwUjJ2cG15RWxuL0hWZ0lud2YrT3R3OEdBbUdpYmRPTFBZQzlXSDl1ZE9zbmNpK0lSZm1OdDhOZ3B3N1pHYnJnamVzdEx6NVRnbW9ranBlMCs0dUkrdFRMNHBJTlRBditPUzhydndPOXMxUkxUbzFtU2hRUEhQeTZvUVNVQ2h0a3ArN1FpQVlsSlhTRnZjWnZGeW1WdVJ6TWw4ZUpGWG9sRFdDRXZEazJkZVFYMGdmRzNCcldjRmRoTjlpUk51TkV5SnRvRDduNzNDNXZPc3VCNnllOG9aRVNYMXdyajRaUFhqUFVuQ1grM1hZdE5xU3ZQVGNtblpSQXRTUmdROVBIZm1DT0pLOUxITFdJODJ3UDhCSS81M25qaTZjMUZ1c2dLS3hQaTVWNzd6QXRMKzMwcWk2Qi9SSTIvWHozZ21STzZWcytadmJEZUJaeDFUS0xmNEFnZURwaWtIM0k4RFVEbjVpOGUwaGhINHEwdEdMTzhGVmw5YVIvRkFKdWpqTm52MkpuSy83VWtPcW5FQnhxNUx0ZEE5QnhsdjduTkJBS3ZKdWpZckpQR1lMN2l2S2RwZUNpY2dvS2E0aUVnWDArdjRCZ05Fcmw5K2pudy91YnIvdzJpZEhFV1BpZkVaVGJRT3lwckQ5TzZaT0JtWE8rOGxQZDVQUHUvZG1pbVp6SFJMdjlZWnl1eTJSYzBCLzV1bFBSTmRwQzZjYVBQa0dMbmtYM1JsSHdLaDlsaTJYdmhzOHVPckdWUlNETlNWbnpHRzdPMkFteDlZL20xTUZSdkp4Lyt5R2N3Z2hiMmFqYlJXeUthdFNTd01ya0hmWXZ0ZHQ4MDB3MUwvT3RVb2xlajB0Nk5EcnJMMFFlRXN0cTkvdUJLRkQxTExWcFFZUVBGNUVNcDQxQ293c1Mxc1BGQk85MmphWm5jbENEa04xdy9qNFU3Z1JxYnBQMDFvUnZKMXYxN1JFTm9QbDRUd2llKzBuWkRPU3J5U2VjUUE3d3Rhbk8rWUZtQU02aDNmREt0dnFpZ1VZYm5YVkg1UVhRRlM0NWZtMTFtZ1VUR1JNWjYzN0NsSENBdGxLcXgxZ1hveCtzZm53VUxEWFZNZFAzUjJPaXFzMzFnK3R1SWlDMHMyUFRobDRRbkJXY2F0ZDlCUUlacy8rd2xaNUNXRlRYV3JWYTNNVVJQczNPUnZMb0xES3lhemtHQU9WQS9tVzlhSDk3T0RPSnJCVFl5UHNuaCtCNk5zV3pqM2ZZT1RPcUQ3cjdQNEovR2NPaGRMZGJXQTlEU3FZYVY2RFF1L2VqenNxaCtMZWphRlhEU2JHZzF1aWUxdUxRa1dCUVpKWmtXVUhpc1ZsZDJ3RENxT3ZWZ1ZYTWNIeldydDlsdk1DVlBxa0I2M1c3VVpsVExMNjQzcE5NQTM0TGtZRmtoQjE1ZlZsdlhkRjRYREh5U29XL3NoNW1xYnVuS1NDM0w3Qm0wNUViVUsrV0JiRTNZTkFmdDFGRGNXUkVPN1h2UnF5dHcwY1V2UTJMTjhLZHM4RHowY0ZiQWhlemo3OC9BRUQ5TDd5NVVtcmd5Q01ZSlNzT2xlRm92MWJWTjFYS1lGaDdGQ1JNRE1EZ2t0OU9xOWNuNENuY09aanIvNEM1T1RlOGI0Kyt5Y0VqMGEwN2E4T0JxOWZsbnFpS0dieHZWTnZab0JIMDUyMDhmc09GQjdQdnlNYmJBUzJqVWExclAwQmNIL0oxUlE4ZVlyQ2RTSUY3eW15RU01dFRrbDhVNHZDdmFJbnZ3S1Bnalh3ZVpiSytIYVU2ZHFoNE1lNUdPOU5aTDJlWHo5YjJNVUNaOWRVN1NXRnV5RnlZNUpNY3dRRkEzRVJEdWlJWW9zYzI1OFNNYUEzMGc1U1dGWmdacDV1ZlQydEFya21kVDhhajYxQmV0RERIWUtsdnVEUGtIY0pxWTVHUlk3WTJCVkFLRGRkOTYzM0l6QlZSaGlRSVNQdmdrN2xNT28rVXJkUFVuK3Nva1BJSzV5NzlrRW11QmVYOUFiYW5BU24rZkhFTUVvcEdaKzBmYUhOTVFqNzVaOGM4dmpheldPaTM2RXlUQ3hvbWVBODFmTnNYdHNHWnV2c3djbTNaaUF2eW03WlVVNDBhTVFGM2J3NUZLeUFEaG1YTGhKbnF6ZXpHaHJIb29xNGoyUFAxWkZ6ejUvdmVmMHJCR1RTZU9iZWhEQzU3U3JMYmhQNFg2OEViVy8vRExxaGtySEYvbjNJci9aT1BycW1EVHhWbGt1YnR4T0tVdjEydjNIZGpjb0JYY0tldVQ3QnNlSXdoTjhNd3JNQ3d5SGdsaEduWWdDZWZFZkhpcUNuWUhlTStEWGpoaTV5RTd0Uzk3bWJnRzV5MFNkWVR3c2xyUnl4OGtCZVM4TFMvUlphNEVrRVN2ZU5DUVRGVkVOM01XY0tSTDdpZ2szaVVUUlhmMFRYSUJSWDJsNnpuTGtLdkpYaHl4WDh3M0JGdDB4RVNnb0tOenFGVTZ3Zm9sUTI0cnBJVWcxOGpSbVAyMTRRMy92eXRHNm5raktZVTE4NnhjbmNRWUg5dXNNZjRqSlJLQ3RydDFCMUxpb2lsNFNacjVRRWZYaGkwK0hPWDZCSjNWSFYzRHNYcFJWdXc0K3ZDd0dYVlBPYndaL0E3aTlyL21BOGFwZnAvVjRLNGFGK0l3S0cyQTRHNUVQa21SVnpkdXg0OE8rL2tDdjcwb1RyL1hKbkRQSGhaRGlxZEFnR2ZFNmUraHlmdC9mZTRaWklLZnYxQndHRWpSK3ZMdEt5QnI5VVRVU2xKUktmSjVaM09oQUttMDRYZnlYK1RYcFh1N0lqeWYrUCtQNWJwM21DMnpGNlozNDA4YSt2VWd5eTczZENTTDh6emFJK20vaDh5eWJ6ZEhWd3cvUzFMOHk3QnY2VXFFbFhIN3dGcXlyNTI4UnBVNUV6YVZMNkVVRTdoR2NVL1VlYnI0T2czT2Z6VEdmaVh4UEZCYU1UL0VFTnVoRk94TyszSlU5MFZYc0l1cEhaTkxwd0ZxZ0RkYU44NDgxNUI5WFVrVGxtdkhmbnVSWmtQQnk1TjN1NERIaE5COHRoK2dENUVlKzhHUXVYZ3hvZ1F4ekNhTkNDTm9RZUdUWVp2Q3VwQmRwVzJxQ3NiQXZiNW5VWTdOcHozeis1eUlEV0x6ZGxjUDdIcGU2dmVzRklsdnM4VW43NklDUVh5Ny9RdDJuQmpsRWZDNVYyN0FHejdLVEh3YXdXWkErMy9KWHkwQU1CL1cyTjRRaFlHTEJVNlZjVjBtdFdWMTB3bklya3kzc0dIZFN3UkZheDNnSzczQWxJT3UzY1pKanRnTFNyVzVhVnpmZ0UzektOY2twTENzS2NSdys5VmJJZFNVNDJJdU01ajVGSjFHRHhaU3RrYlF0TENiZE5SYlNUd3Y1THQrK0RtamFoKy9FdFcyUkV1R2E0eXhFZE1GcmNXS2tEVlVGU3VIaFNHRTYzdCtkZno1QkgyTlZxd1ptWWQyQ1NKS1Yya1V2cW1NcllFcDRMcUVxL2JsNnZDMGVlaW9sbzN5ZWlFNWZlYlg5N1FoYnBJWnJ6VmJNSGc3MVdkRnhnSEFUMmtlbThVNnhjVkUrSTZFRm1JM0xITnB0dmpINk43R1ZtUFNiRHFVanVmVXhXMWk1a2FMMHV1VlM3RzhGT3hnYUxPdmVCbnJ2TnRLakFHQ2x5dHpkdGs5MEQyakhaYVpydkY0STVvUC9Zek15Zm0zTXZJV3FXUk9UdHppdmdIQkkzZnBZaDNNYjg2cUdEYzJEUDZYYjdXSkZCNGlyOTRwcDFMS2dueFkyTmZESmVrclduVThFbEtuUHZPUjR1cE5BWjkxV0NFSFdac1ZieDFHcmtoUndKMkozWWpqUVBtbUhJZzByRWJnbW0yNGFXZ3BNeWNkbEduU3pRbXhSSEh6eDhBY2x6R2k0bDB4OGpTV25FbTNuRGtoQlJkY0xGNUgwSnpsQjR2bXVNNWlJL0tFMyszcTZ0WUx6Slhac1JKQW1XK29TQW1aWXl1TlFxKytMdy9RVklzT0kxZmYvNUU0V3UxZlplVWcyNHJPYXV1OGJTRVJIcERsZm5DR3ZBWGpyNmt0U0pYYUIrTFJWL05PQmJWbWdZVW8yUUVUUngxa1ZER2JCOEk2elVUMWFDTWMvSE82SlpEWlJ4MDZzWk9scklTN2JvbGxZMVE2NUtJL09SZGlBeTR1c3ZDajBza2RlUkZycy8wUmpodmhYM0MxZU1SRlphNnQxUkVqU2tYdUd4YTJwSUhVeFlYWDIxVFJXY1V5R2lwS1hqa0ZLMC9XM0poSGlzcUV1TW03dzFFdFIrMjIrRU1rdjJPQit0VmJoMDFDN0FXTjBTekxkYUYzTDdxcEVUMjA2VXNBM3l1NDc0U0kwZmcwc3RHa1Q1RU45VFlybDF5S3ZoU045NlZtUlRYZzdtaVIzM2lGVkVTc01QeStOeE5VamY1M3pYaFZXQ2lNOGJ2dGdrMUNEbGlQMVRlbTRLcUJmTUp5M3VwWkU4bit5NGNiWWJZc1hxYjFNZTBvemNBeS9IYjBSQ1FiMjhQM3NKY2cyM0VFV1RCTjZIK2xMRmpmcElqeG5acVBGNFA5S2Fkdll1ajlOQ3FvM3phZ2QyT2xpMTRrUjk2cTg4WERxM1g5Z2pWK3dHblBtZ25Rb0thZHoyR2F4RkttM0xsRWcrSDcvcjErT3Rxa2dYeitZRE5IQTF0bFZ1K2lJRGJyOXNWRWFPZTEwMmtiVElVdDQ2VEwzYWgrajhESG43U2Jid3J4RVhQZ1ppYTM1OTRTOU5CNlh3alhkM2NScnloVXAzTXhOZWdQR0JmUy9kWWhkb3U2NjBtZm9rSTFHM1hqd2lwTDZmbEVrNy9BZ2hXNzFLRXMyYUVhMmRNa2k0K3lYaVAzNjdjVTF6T0hMTlhzL2JwdVZBZEtxKzJUdFhUV1RlMkx3dytNZ2RwTmtnakh0V0hqZk1uR1p1NjIwRVUrcjVzeEh5SDVCVjJJWFBPelloMVVlY1NCK0FMVjUycjBMQkZMZGRkMFdCb3BYMTJITmhFY3JtclEzUnZiY0dsODROenQyNS96aWlSSTduaTBjc1JRWjlVNUhmVVFiWWZtV0dWN2E0SVhXR0tKenhlaWd5R3ZvYnV5Z2IzMmRvK1NZTGVjOGFMeTQzWG9UejNQMTUzeTBPSUhGZDY3UzBDVDFJZEV6alZkd2gxK09PckJvL3J2a3YzOHBQZTZQRjNVOEhmWldvclhPdUJKaW1kd0wwMkxkQkhkSXR2N1NMNUlmazg4dlQvQmFEZWZtUlVnSDlOWEx1Q2h5Zm1ya2hneWtXZWhuWUliUjVIenhXQ0VxNzhTZkhtaUhJMEc5WHVUejlPQ2dXYVovOGpjMGdHRmdQT1V2WkVjS0psY2pwYjM5WmcvWHBXOW9nMXplZ3NkL2VGdFNNUkY1akhzVWh6aHVaWVhXVy9IVnpRRy92YUFvOFB3YzVkMGF0MHRQdWc2aStmNkdCTW8zMTl2UFJBRklubTV1RkZkc2dIRndiZE5rckJyeStRSU1yVlhuSVhYcitnVUszRWVnbEpnNGJ0MDBqZFlhNC9FVWNDTU9hODJaTWlFVEJpcGRyVTIySXJ2YWVsVkNHWUlncSt4c0RFSXg1UkJ3ZHFiOC9ucWcveU5rR2RuRGJndHh0ODVBdGxqR0tTY2dkMGk4UVVOeGFHeHVtUHc1WGx5YkZTY2EvQXRlcWxHVFVZQ1NaaW8xZk5ZVFRHNDlvRmQwRis0dkNtamtKM3FpU2VaRVEvaTRadk9IcU5HSEhHaFNWemJlOXBETUUvTGVxQnNaR25yamlNNGt4cElQb2plSmZ1c1p0MHlHYUxtNUVLU0hQUTgwaFFqVWN3dG1uTTZyV1drRGdrQU1wS3lWUUw3M3FPZGh6QTdUblkyMXBZNjRoVzlselhpaENjVVUrcnA3bnJRVk9rWUxNMno1RnNFeXVWYnZLTHdTOXg5cnRjWkl4Qk5jMjk1Zy9UY0tOUVpGWmM0WXJFWjAwT1ltOEJyNzRyS05YZ1Y3d3plVHJSRnV3OTZRK1hIRWxITXhWYzE1LzF6d0p5dnphcXViaGtpZ1FxK3lwTDNHenY0eHZCVytnUDhCSXNhaFo2aklDdk84Mmd4L1pQQUg5dXJnaDZneTY1UzF4QlFiN3JuS1N3VGNic09lZTNyTHlhd2VFaTIvYjZxOGd1djY4MnFwWWUxbHdVOTFUUHQxaVFqREp5L2JDbDlWZ1NmcHNrdnBjZzR6Sk5UTlROWXNocUxmYzk2Q2VCZTcrWStuYnc0NkJGeXFhS2pQS0V2d25pNjZURkEwS3U3ZmNiVnNQcUc4NnEwbnBRdHIyQTJOU1ZzOEZiOFdiZ0IybUI1RmVOOEtJN3NvRFpmZWhudFN4SDhIZElwU2M1OXFDWERMNlZXMUxrRXBjNkxxOHc2QlVaMTRqa2daYytvZkNtV1BWRUJuZGFhTi91UTg1N0JkN3phU0trRDFhZk9OREhsa3ZoTzJqdjlQQjBVOXlQTjQ1R3N3RDYzVStTdzdEdVZ1VVFlUDNHQ04xWDcvaC9hdi93alRKT0RTUDBRY21WVm8yczlnRDEycVVtdHd1QllDbXZLRmg4MnNySkQ0eXRrelN1NDQwOFhRNHhFWGVRQjhwTTBYUFcxV3hCbWtmbFluelhJV01nVHBDRWQ4ZG1PYUJ0T3N6cWpabGhVQzRVbHRPU3FvRWxOZGFmZTlsVnlKemlsSzc1SjE1eU5vcXFEOTJ0UUM4L3ZRK2lmZ2prMVhiTXpPUXZKZStwT3ptUnpEdnVaeVhzRzBCVTFMY2NQSUNhOW9HU21wUUhMalhmbDZjTWVjY2NsZzFYZGQrYklmdzhuVnhod2lja0RreHl5VE53VDYxSmRyTHlnQXB4QzFPRUJRaWZheFlvSjFIQUdPZWF2WDFzY2plOE9qYnZtT1ZZRTZ5MzFxN2J4OVlZblU2UnhFY1BaVjlpNVFMd1JybzQ2WHBxUEN1N2xOQzlodXhVYzdDSlJuN3FJZzdXcUFNOU1kcE1xNzZ0NEtwWUlyVDQrVWVjRXd2eE1pT21nQ1dzMWw4NGFDYnlKUzRrREQzc1FLeUxtM2FhYXBUQ0hZbDEzVHpNRWV3MnV4TnJZNVBRVlovMjI0VytLNHNxU1U1S2JnUnYvcXJYOXdDNUUzMUs3aTE1Q3l5WjFqekpwa21JSFgrenNrN3lwNGhYcHgxQnZ1QTBUOWRyY0dkOFd3cytRaEFDVzBaYzFCZkdmUzVkekpiN1R0Qkg2S3NWMmhFL08rRGp1eWVWamNFUFZtOVphMHVBNVFaMHJOdXZ0NkRiUHVsVGR3WFk4RTZXNzN5K0pvTm9ONWNtUDZnRjhpcytwQTVmODk1Y0tSS1RqWXhHU1J2UEZ3d1plTjg1RERIWFUrZ3RoQi9xTEhlcVg0aU9BUHo5UGQrZWNhcnFsL2xYa05JZk1jWnR4OEdZSGpwN0sreVBZSzhnNDlscGgvYWl6eGJxeWZ1clF2QkZtdzBsK1FxSThxM1p2ZTNRU200c2k0aGY5bmRTdkJubnY2MElqc0dmTU92VGNOWEc0RWlic3ZIUFVlVzlMajd4bzJKaUdJRlcyWVgvUUpuNVZHdEdHVmZKSjdjajdmZEpCN3haYzRXdlhNUTZtZjJmWkJ0TWJKMk84NmtuVFJGenYzOU1iMFhXcEhRYjdOSElUaDgzdUZsRDdzUnRhSGM4RkRkQ0xBSDVkN1BDZFJHMEUrSjZGNXVKbzdWSGFrOWJ0d0Y1dFpYZlJSUlBpaEVWTWo0ZmtaK2FmV3lGZUZ1eUp0LzRPTkdwd2hrRE9RL2djbDdjUWNMWjJQOEM2aUI5UkNVbnY1QjE5bURDQXZKQzJ0RnZrZ1NUN3VDZG1TcTl6ZldzVmxjSFh6SWZKUEtQVzJnZHh1SmJxM2lPM3hJZlhpK3p2MXdIODd1ZWJMbHc1bEdwRmJtUHFwZkpJdXN4bFFsdmFaUE9ET2dROElIN3JQd3hlMlJsaFlJVGxVOU9sN3hIZnorMjBBYnNWNnNOdVFxY1VRYzNkMVVvbHR6OUJXaWdwRlJZRHhDUGJBTDhmZnZpVE1hT0Yvb3pUcmR1NUVXWkxOWnFOZU44TEc1UmF6YjBhQ1RLdGQ2dGhXaFpEQTdrKzZCcW5tVDhhTHVPTmc1ekNYclFsdHhScHhOclBTUXUrNDBMMkxaSzJSZE8zYldSRk1lTERYcGxhVUpIZkRkL2RDVDBTT05MTGxsWWdVQ1duKzdmeFNvRllObmZjeFVSNXBmeFU3ZnhmRTRKVjZ0WG10SnZya2hNYVZqUDg1UlcyeS9WOWNpY2NBM1o3MjZPVWExcFJpTW5qenU1QWdOK0w5TGRuOS9RQmV4WWp0MEtodkpWOFFCWFFML2dYNmJRTHhNRjJaQitGRnNkRzNBRWxlL3lRTHdBd1o5MFY3V2ppTHFYcFpYQUJ1Q3hwUCtjMU5PSVR6dGlzR0tMYTlCbXpDTDI4N3VoSWk0bTVTQ3BXQ3ZPVVptcGhRdTdCT3hGenhhZzBTcjhQRXJIKzRDKy9PaTdzUVJIZUJQNmhVN01IQXU2cVJiLzFnRXJoSHYzblRwYldEMTMrYTFSdW5tME1IM3gybUFMbFlsQjA0anpTdzNvR3Z2UzlCMmVpdlhxNnYvMncvV3BkMGQzSnc5QjI2OFN3MDhPWGl2azczRHYydzdEbXpMSEhYZTY3TEg2OTlPSVgvSTQ2amg3OU9JNytWTCtrdUkvOFRmcWY5L3I3WEwxY0h6OTdWK1A2bmc1T0RsWUxqN0VEbWVQT3I5dDBOa1BRNTQ3ZlZ3SndkSmlyOE5JUDdXbTRMRS8veTYrMTlQSkRseDRmL24xVUdIL3UwSjVjUHU0akU3VGR1MTU3RDcvbWx6L3VWWWlZSDNRYmFIMy91ZmJmRjMxTVdEayt3Yk9KWGN3S25rZG5tNHVqb2M4SFQrUGVoZEhtNXV6dTVldnlQb3ZHdVB4KzhJT3J1NzdIWC92YU8wcTRPanMrdkFBeVVTeHY0b0doNDR0UGV2Z3hYSXM1NkdYaDVlRHIvM1V5QlgrLzFNZjhBa2V2OExZeUhHb0tKQUFBQT0ifQ== -->

<div data-pagedtable="false">
  <script data-pagedtable-source type="application/json">
{"columns":[{"label":["id_a"],"name":[1],"type":["int"],"align":["right"]},{"label":["id_b"],"name":[2],"type":["int"],"align":["right"]},{"label":["weight"],"name":[3],"type":["dbl"],"align":["right"]}],"data":[{"1":"1","2":"2","3":"0.089513"},{"1":"1","2":"3","3":"0.060352"},{"1":"1","2":"4","3":"0.118497"},{"1":"1","2":"5","3":"0.053574"},{"1":"1","2":"6","3":"0.046785"},{"1":"1","2":"7","3":"0.051572"},{"1":"1","2":"8","3":"0.061157"},{"1":"1","2":"9","3":"0.041872"},{"1":"1","2":"10","3":"0.073892"},{"1":"1","2":"11","3":"0.078536"},{"1":"1","2":"12","3":"0.078996"},{"1":"1","2":"13","3":"0.049808"},{"1":"1","2":"14","3":"0.092987"},{"1":"1","2":"15","3":"0.088382"},{"1":"1","2":"16","3":"0.103453"},{"1":"1","2":"17","3":"0.111704"},{"1":"1","2":"18","3":"0.088563"},{"1":"1","2":"19","3":"0.064282"},{"1":"1","2":"20","3":"0.084223"},{"1":"1","2":"21","3":"0.055252"},{"1":"1","2":"22","3":"0.064403"},{"1":"1","2":"23","3":"0.059293"},{"1":"1","2":"24","3":"0.090295"},{"1":"1","2":"25","3":"0.096046"},{"1":"1","2":"26","3":"0.054368"},{"1":"1","2":"27","3":"0.076445"},{"1":"1","2":"28","3":"0.068848"},{"1":"1","2":"29","3":"0.094945"},{"1":"1","2":"30","3":"0.071784"},{"1":"1","2":"31","3":"0.064443"},{"1":"1","2":"32","3":"0.049343"},{"1":"1","2":"33","3":"0.046334"},{"1":"1","2":"34","3":"0.089836"},{"1":"1","2":"35","3":"0.096120"},{"1":"1","2":"36","3":"0.043977"},{"1":"1","2":"37","3":"0.099351"},{"1":"1","2":"38","3":"0.062905"},{"1":"1","2":"39","3":"0.080600"},{"1":"1","2":"40","3":"0.064480"},{"1":"1","2":"41","3":"0.040084"},{"1":"1","2":"42","3":"0.045837"},{"1":"1","2":"43","3":"0.062837"},{"1":"1","2":"44","3":"0.078828"},{"1":"1","2":"45","3":"0.066648"},{"1":"1","2":"46","3":"0.051421"},{"1":"1","2":"47","3":"0.052972"},{"1":"1","2":"48","3":"0.061311"},{"1":"1","2":"49","3":"0.087058"},{"1":"1","2":"50","3":"0.064481"},{"1":"1","2":"51","3":"0.075007"},{"1":"1","2":"52","3":"0.069417"},{"1":"1","2":"53","3":"0.093232"},{"1":"1","2":"54","3":"0.087205"},{"1":"1","2":"55","3":"0.078433"},{"1":"1","2":"56","3":"0.052442"},{"1":"1","2":"57","3":"0.099381"},{"1":"1","2":"58","3":"0.099732"},{"1":"1","2":"59","3":"0.073854"},{"1":"1","2":"60","3":"0.065239"},{"1":"1","2":"61","3":"0.112181"},{"1":"1","2":"62","3":"0.055110"},{"1":"1","2":"63","3":"0.084592"},{"1":"1","2":"64","3":"0.061923"},{"1":"1","2":"65","3":"0.131038"},{"1":"1","2":"66","3":"0.127316"},{"1":"1","2":"67","3":"0.065994"},{"1":"1","2":"68","3":"0.042801"},{"1":"1","2":"69","3":"0.054258"},{"1":"1","2":"70","3":"0.103135"},{"1":"1","2":"71","3":"0.105845"},{"1":"1","2":"72","3":"0.093127"},{"1":"1","2":"73","3":"0.092378"},{"1":"1","2":"74","3":"0.047951"},{"1":"1","2":"75","3":"0.053249"},{"1":"1","2":"76","3":"0.068658"},{"1":"1","2":"77","3":"0.094129"},{"1":"1","2":"78","3":"0.056351"},{"1":"1","2":"79","3":"0.052378"},{"1":"1","2":"80","3":"0.098574"},{"1":"1","2":"81","3":"0.079852"},{"1":"1","2":"82","3":"0.072961"},{"1":"1","2":"83","3":"0.060792"},{"1":"1","2":"84","3":"0.061528"},{"1":"1","2":"85","3":"0.068878"},{"1":"1","2":"86","3":"0.077172"},{"1":"1","2":"87","3":"0.085682"},{"1":"1","2":"88","3":"0.085937"},{"1":"1","2":"89","3":"0.080796"},{"1":"1","2":"90","3":"0.067276"},{"1":"1","2":"91","3":"0.073232"},{"1":"1","2":"92","3":"0.061517"},{"1":"1","2":"93","3":"0.089803"},{"1":"1","2":"94","3":"0.069377"},{"1":"1","2":"95","3":"0.077157"},{"1":"1","2":"96","3":"0.056055"},{"1":"2","2":"3","3":"0.108253"},{"1":"2","2":"4","3":"0.111973"},{"1":"2","2":"5","3":"0.100238"},{"1":"2","2":"6","3":"0.097659"},{"1":"2","2":"7","3":"0.087699"},{"1":"2","2":"8","3":"0.081557"},{"1":"2","2":"9","3":"0.162876"},{"1":"2","2":"10","3":"0.096641"},{"1":"2","2":"11","3":"0.063222"},{"1":"2","2":"12","3":"0.068956"},{"1":"2","2":"13","3":"0.088028"},{"1":"2","2":"14","3":"0.070875"},{"1":"2","2":"15","3":"0.066195"},{"1":"2","2":"16","3":"0.067968"},{"1":"2","2":"17","3":"0.063464"},{"1":"2","2":"18","3":"0.074969"},{"1":"2","2":"19","3":"0.100101"},{"1":"2","2":"20","3":"0.069290"},{"1":"2","2":"21","3":"0.101154"},{"1":"2","2":"22","3":"0.097270"},{"1":"2","2":"23","3":"0.100292"},{"1":"2","2":"24","3":"0.072488"},{"1":"2","2":"25","3":"0.083736"},{"1":"2","2":"26","3":"0.098174"},{"1":"2","2":"27","3":"0.101153"},{"1":"2","2":"28","3":"0.093757"},{"1":"2","2":"29","3":"0.077787"},{"1":"2","2":"30","3":"0.100038"},{"1":"2","2":"31","3":"0.100854"},{"1":"2","2":"32","3":"0.097915"},{"1":"2","2":"33","3":"0.073588"},{"1":"2","2":"34","3":"0.074374"},{"1":"2","2":"35","3":"0.077451"},{"1":"2","2":"36","3":"0.098493"},{"1":"2","2":"37","3":"0.064067"},{"1":"2","2":"38","3":"0.085520"},{"1":"2","2":"39","3":"0.063328"},{"1":"2","2":"40","3":"0.102749"},{"1":"2","2":"41","3":"0.093006"},{"1":"2","2":"42","3":"0.085827"},{"1":"2","2":"43","3":"0.096256"},{"1":"2","2":"44","3":"0.113244"},{"1":"2","2":"45","3":"0.102688"},{"1":"2","2":"46","3":"0.097470"},{"1":"2","2":"47","3":"0.087715"},{"1":"2","2":"48","3":"0.101857"},{"1":"2","2":"49","3":"0.068889"},{"1":"2","2":"50","3":"0.098869"},{"1":"2","2":"51","3":"0.112740"},{"1":"2","2":"52","3":"0.056368"},{"1":"2","2":"53","3":"0.071118"},{"1":"2","2":"54","3":"0.063245"},{"1":"2","2":"55","3":"0.097072"},{"1":"2","2":"56","3":"0.095276"},{"1":"2","2":"57","3":"0.072360"},{"1":"2","2":"58","3":"0.072447"},{"1":"2","2":"59","3":"0.093532"},{"1":"2","2":"60","3":"0.105974"},{"1":"2","2":"61","3":"0.237959"},{"1":"2","2":"62","3":"0.100884"},{"1":"2","2":"63","3":"0.063279"},{"1":"2","2":"64","3":"0.087888"},{"1":"2","2":"65","3":"0.097348"},{"1":"2","2":"66","3":"0.078050"},{"1":"2","2":"67","3":"0.098989"},{"1":"2","2":"68","3":"0.165217"},{"1":"2","2":"69","3":"0.109256"},{"1":"2","2":"70","3":"0.077311"},{"1":"2","2":"71","3":"0.106297"},{"1":"2","2":"72","3":"0.070875"},{"1":"2","2":"73","3":"0.069821"},{"1":"2","2":"74","3":"0.097040"},{"1":"2","2":"75","3":"0.103663"},{"1":"2","2":"76","3":"0.109305"},{"1":"2","2":"77","3":"0.065678"},{"1":"2","2":"78","3":"0.095201"},{"1":"2","2":"79","3":"0.105188"},{"1":"2","2":"80","3":"0.068557"},{"1":"2","2":"81","3":"0.062821"},{"1":"2","2":"82","3":"0.098718"},{"1":"2","2":"83","3":"0.102392"},{"1":"2","2":"84","3":"0.087478"},{"1":"2","2":"85","3":"0.101514"},{"1":"2","2":"86","3":"0.067199"},{"1":"2","2":"87","3":"0.072170"},{"1":"2","2":"88","3":"0.070844"},{"1":"2","2":"89","3":"0.057311"},{"1":"2","2":"90","3":"0.061302"},{"1":"2","2":"91","3":"0.067113"},{"1":"2","2":"92","3":"0.103114"},{"1":"2","2":"93","3":"0.063911"},{"1":"2","2":"94","3":"0.062954"},{"1":"2","2":"95","3":"0.065945"},{"1":"2","2":"96","3":"0.102793"},{"1":"3","2":"4","3":"0.066703"},{"1":"3","2":"5","3":"0.094624"},{"1":"3","2":"6","3":"0.092128"},{"1":"3","2":"7","3":"0.028785"},{"1":"3","2":"8","3":"0.052017"},{"1":"3","2":"9","3":"0.089794"},{"1":"3","2":"10","3":"0.051083"},{"1":"3","2":"11","3":"0.014499"},{"1":"3","2":"12","3":"0.036604"},{"1":"3","2":"13","3":"0.032380"},{"1":"3","2":"14","3":"0.013423"},{"1":"3","2":"15","3":"0.070561"},{"1":"3","2":"16","3":"0.061583"},{"1":"3","2":"17","3":"0.025105"},{"1":"3","2":"18","3":"0.016052"},{"1":"3","2":"19","3":"0.043908"},{"1":"3","2":"20","3":"0.036633"},{"1":"3","2":"21","3":"0.041593"},{"1":"3","2":"22","3":"0.044496"},{"1":"3","2":"23","3":"0.047445"},{"1":"3","2":"24","3":"0.019882"},{"1":"3","2":"25","3":"0.024986"},{"1":"3","2":"26","3":"0.035469"},{"1":"3","2":"27","3":"0.067896"},{"1":"3","2":"28","3":"0.061883"},{"1":"3","2":"29","3":"0.020645"},{"1":"3","2":"30","3":"0.062725"},{"1":"3","2":"31","3":"0.065901"},{"1":"3","2":"32","3":"0.094544"},{"1":"3","2":"33","3":"0.044636"},{"1":"3","2":"34","3":"0.016517"},{"1":"3","2":"35","3":"0.024274"},{"1":"3","2":"36","3":"0.072662"},{"1":"3","2":"37","3":"0.068825"},{"1":"3","2":"38","3":"0.054389"},{"1":"3","2":"39","3":"0.058010"},{"1":"3","2":"40","3":"0.046993"},{"1":"3","2":"41","3":"0.029675"},{"1":"3","2":"42","3":"0.073286"},{"1":"3","2":"43","3":"0.059452"},{"1":"3","2":"44","3":"0.098681"},{"1":"3","2":"45","3":"0.072441"},{"1":"3","2":"46","3":"0.057835"},{"1":"3","2":"47","3":"0.039612"},{"1":"3","2":"48","3":"0.058197"},{"1":"3","2":"49","3":"0.017757"},{"1":"3","2":"50","3":"0.059939"},{"1":"3","2":"51","3":"0.047385"},{"1":"3","2":"52","3":"0.063266"},{"1":"3","2":"53","3":"0.072213"},{"1":"3","2":"54","3":"0.047463"},{"1":"3","2":"55","3":"0.039646"},{"1":"3","2":"56","3":"0.037983"},{"1":"3","2":"57","3":"0.030910"},{"1":"3","2":"58","3":"0.017189"},{"1":"3","2":"59","3":"0.067007"},{"1":"3","2":"60","3":"0.047336"},{"1":"3","2":"61","3":"0.064855"},{"1":"3","2":"62","3":"0.033908"},{"1":"3","2":"63","3":"0.022977"},{"1":"3","2":"64","3":"0.040680"},{"1":"3","2":"65","3":"0.058441"},{"1":"3","2":"66","3":"0.042696"},{"1":"3","2":"67","3":"0.039787"},{"1":"3","2":"68","3":"0.084147"},{"1":"3","2":"69","3":"0.058219"},{"1":"3","2":"70","3":"0.039647"},{"1":"3","2":"71","3":"0.043474"},{"1":"3","2":"72","3":"0.013391"},{"1":"3","2":"73","3":"0.017737"},{"1":"3","2":"74","3":"0.035400"},{"1":"3","2":"75","3":"0.071177"},{"1":"3","2":"76","3":"0.056664"},{"1":"3","2":"77","3":"0.037155"},{"1":"3","2":"78","3":"0.039087"},{"1":"3","2":"79","3":"0.047475"},{"1":"3","2":"80","3":"0.028872"},{"1":"3","2":"81","3":"0.011927"},{"1":"3","2":"82","3":"0.062265"},{"1":"3","2":"83","3":"0.049873"},{"1":"3","2":"84","3":"0.055231"},{"1":"3","2":"85","3":"0.040470"},{"1":"3","2":"86","3":"0.055941"},{"1":"3","2":"87","3":"0.063595"},{"1":"3","2":"88","3":"0.036181"},{"1":"3","2":"89","3":"0.060732"},{"1":"3","2":"90","3":"0.057165"},{"1":"3","2":"91","3":"0.042174"},{"1":"3","2":"92","3":"0.042189"},{"1":"3","2":"93","3":"0.028127"},{"1":"3","2":"94","3":"0.026809"},{"1":"3","2":"95","3":"0.032695"},{"1":"3","2":"96","3":"0.036698"},{"1":"4","2":"5","3":"0.099036"},{"1":"4","2":"6","3":"0.105371"},{"1":"4","2":"7","3":"0.050840"},{"1":"4","2":"8","3":"0.035466"},{"1":"4","2":"9","3":"0.103508"},{"1":"4","2":"10","3":"0.036769"},{"1":"4","2":"11","3":"0.012849"},{"1":"4","2":"12","3":"0.058666"},{"1":"4","2":"13","3":"0.057659"},{"1":"4","2":"14","3":"0.029671"},{"1":"4","2":"15","3":"0.071822"},{"1":"4","2":"16","3":"0.083426"},{"1":"4","2":"17","3":"0.023566"},{"1":"4","2":"18","3":"0.038489"},{"1":"4","2":"19","3":"0.079811"},{"1":"4","2":"20","3":"0.053968"},{"1":"4","2":"21","3":"0.068881"},{"1":"4","2":"22","3":"0.047698"},{"1":"4","2":"23","3":"0.049132"},{"1":"4","2":"24","3":"0.029327"},{"1":"4","2":"25","3":"0.044467"},{"1":"4","2":"26","3":"0.057840"},{"1":"4","2":"27","3":"0.047399"},{"1":"4","2":"28","3":"0.040459"},{"1":"4","2":"29","3":"0.053249"},{"1":"4","2":"30","3":"0.032765"},{"1":"4","2":"31","3":"0.046124"},{"1":"4","2":"32","3":"0.097130"},{"1":"4","2":"33","3":"0.026545"},{"1":"4","2":"34","3":"0.042632"},{"1":"4","2":"35","3":"0.050339"},{"1":"4","2":"36","3":"0.092450"},{"1":"4","2":"37","3":"0.082287"},{"1":"4","2":"38","3":"0.041032"},{"1":"4","2":"39","3":"0.070559"},{"1":"4","2":"40","3":"0.064674"},{"1":"4","2":"41","3":"0.073381"},{"1":"4","2":"42","3":"0.101769"},{"1":"4","2":"43","3":"0.038360"},{"1":"4","2":"44","3":"0.089869"},{"1":"4","2":"45","3":"0.084651"},{"1":"4","2":"46","3":"0.085245"},{"1":"4","2":"47","3":"0.038100"},{"1":"4","2":"48","3":"0.035389"},{"1":"4","2":"49","3":"0.016402"},{"1":"4","2":"50","3":"0.034439"},{"1":"4","2":"51","3":"0.059314"},{"1":"4","2":"52","3":"0.070248"},{"1":"4","2":"53","3":"0.077146"},{"1":"4","2":"54","3":"0.079216"},{"1":"4","2":"55","3":"0.063917"},{"1":"4","2":"56","3":"0.041195"},{"1":"4","2":"57","3":"0.025186"},{"1":"4","2":"58","3":"0.033557"},{"1":"4","2":"59","3":"0.036085"},{"1":"4","2":"60","3":"0.072132"},{"1":"4","2":"61","3":"0.109840"},{"1":"4","2":"62","3":"0.063962"},{"1":"4","2":"63","3":"0.057757"},{"1":"4","2":"64","3":"0.053053"},{"1":"4","2":"65","3":"0.083261"},{"1":"4","2":"66","3":"0.092649"},{"1":"4","2":"67","3":"0.062981"},{"1":"4","2":"68","3":"0.095689"},{"1":"4","2":"69","3":"0.078461"},{"1":"4","2":"70","3":"0.057779"},{"1":"4","2":"71","3":"0.052646"},{"1":"4","2":"72","3":"0.037947"},{"1":"4","2":"73","3":"0.040843"},{"1":"4","2":"74","3":"0.056237"},{"1":"4","2":"75","3":"0.081629"},{"1":"4","2":"76","3":"0.040533"},{"1":"4","2":"77","3":"0.058320"},{"1":"4","2":"78","3":"0.062485"},{"1":"4","2":"79","3":"0.079689"},{"1":"4","2":"80","3":"0.022657"},{"1":"4","2":"81","3":"0.045240"},{"1":"4","2":"82","3":"0.037536"},{"1":"4","2":"83","3":"0.070294"},{"1":"4","2":"84","3":"0.028141"},{"1":"4","2":"85","3":"0.051637"},{"1":"4","2":"86","3":"0.062984"},{"1":"4","2":"87","3":"0.079257"},{"1":"4","2":"88","3":"0.062209"},{"1":"4","2":"89","3":"0.082999"},{"1":"4","2":"90","3":"0.067042"},{"1":"4","2":"91","3":"0.064920"},{"1":"4","2":"92","3":"0.061756"},{"1":"4","2":"93","3":"0.011362"},{"1":"4","2":"94","3":"0.050074"},{"1":"4","2":"95","3":"0.055583"},{"1":"4","2":"96","3":"0.060722"},{"1":"5","2":"6","3":"0.088402"},{"1":"5","2":"7","3":"0.091675"},{"1":"5","2":"8","3":"0.095239"},{"1":"5","2":"9","3":"0.093113"},{"1":"5","2":"10","3":"0.102284"},{"1":"5","2":"11","3":"0.080611"},{"1":"5","2":"12","3":"0.052117"},{"1":"5","2":"13","3":"0.176333"},{"1":"5","2":"14","3":"0.083510"},{"1":"5","2":"15","3":"0.068106"},{"1":"5","2":"16","3":"0.050168"},{"1":"5","2":"17","3":"0.072530"},{"1":"5","2":"18","3":"0.065813"},{"1":"5","2":"19","3":"0.085057"},{"1":"5","2":"20","3":"0.061385"},{"1":"5","2":"21","3":"0.100515"},{"1":"5","2":"22","3":"0.102107"},{"1":"5","2":"23","3":"0.100025"},{"1":"5","2":"24","3":"0.064691"},{"1":"5","2":"25","3":"0.071515"},{"1":"5","2":"26","3":"0.185540"},{"1":"5","2":"27","3":"0.104528"},{"1":"5","2":"28","3":"0.091935"},{"1":"5","2":"29","3":"0.090671"},{"1":"5","2":"30","3":"0.097181"},{"1":"5","2":"31","3":"0.103859"},{"1":"5","2":"32","3":"0.108557"},{"1":"5","2":"33","3":"0.193447"},{"1":"5","2":"34","3":"0.070052"},{"1":"5","2":"35","3":"0.072763"},{"1":"5","2":"36","3":"0.101400"},{"1":"5","2":"37","3":"0.053122"},{"1":"5","2":"38","3":"0.089285"},{"1":"5","2":"39","3":"0.069710"},{"1":"5","2":"40","3":"0.107315"},{"1":"5","2":"41","3":"0.262088"},{"1":"5","2":"42","3":"0.081057"},{"1":"5","2":"43","3":"0.102228"},{"1":"5","2":"44","3":"0.113426"},{"1":"5","2":"45","3":"0.107769"},{"1":"5","2":"46","3":"0.083806"},{"1":"5","2":"47","3":"0.191212"},{"1":"5","2":"48","3":"0.192127"},{"1":"5","2":"49","3":"0.063167"},{"1":"5","2":"50","3":"0.101466"},{"1":"5","2":"51","3":"0.105734"},{"1":"5","2":"52","3":"0.052434"},{"1":"5","2":"53","3":"0.054680"},{"1":"5","2":"54","3":"0.059141"},{"1":"5","2":"55","3":"0.089986"},{"1":"5","2":"56","3":"0.095385"},{"1":"5","2":"57","3":"0.077595"},{"1":"5","2":"58","3":"0.074155"},{"1":"5","2":"59","3":"0.093326"},{"1":"5","2":"60","3":"0.058592"},{"1":"5","2":"61","3":"0.095973"},{"1":"5","2":"62","3":"0.111013"},{"1":"5","2":"63","3":"0.060916"},{"1":"5","2":"64","3":"0.092102"},{"1":"5","2":"65","3":"0.082192"},{"1":"5","2":"66","3":"0.052092"},{"1":"5","2":"67","3":"0.093095"},{"1":"5","2":"68","3":"0.082803"},{"1":"5","2":"69","3":"0.111683"},{"1":"5","2":"70","3":"0.084597"},{"1":"5","2":"71","3":"0.107356"},{"1":"5","2":"72","3":"0.071550"},{"1":"5","2":"73","3":"0.081986"},{"1":"5","2":"74","3":"0.106731"},{"1":"5","2":"75","3":"0.094618"},{"1":"5","2":"76","3":"0.107082"},{"1":"5","2":"77","3":"0.069432"},{"1":"5","2":"78","3":"0.140823"},{"1":"5","2":"79","3":"0.105355"},{"1":"5","2":"80","3":"0.076360"},{"1":"5","2":"81","3":"0.075732"},{"1":"5","2":"82","3":"0.099330"},{"1":"5","2":"83","3":"0.103876"},{"1":"5","2":"84","3":"0.097195"},{"1":"5","2":"85","3":"0.114329"},{"1":"5","2":"86","3":"0.058347"},{"1":"5","2":"87","3":"0.065041"},{"1":"5","2":"88","3":"0.053130"},{"1":"5","2":"89","3":"0.036162"},{"1":"5","2":"90","3":"0.086701"},{"1":"5","2":"91","3":"0.184896"},{"1":"5","2":"92","3":"0.093875"},{"1":"5","2":"93","3":"0.062791"},{"1":"5","2":"94","3":"0.055772"},{"1":"5","2":"95","3":"0.065895"},{"1":"5","2":"96","3":"0.096523"},{"1":"6","2":"7","3":"0.080311"},{"1":"6","2":"8","3":"0.077680"},{"1":"6","2":"9","3":"0.105347"},{"1":"6","2":"10","3":"0.093781"},{"1":"6","2":"11","3":"0.056077"},{"1":"6","2":"12","3":"0.191805"},{"1":"6","2":"13","3":"0.077517"},{"1":"6","2":"14","3":"0.066028"},{"1":"6","2":"15","3":"0.055827"},{"1":"6","2":"16","3":"0.047872"},{"1":"6","2":"17","3":"0.068389"},{"1":"6","2":"18","3":"0.061126"},{"1":"6","2":"19","3":"0.203432"},{"1":"6","2":"20","3":"0.052372"},{"1":"6","2":"21","3":"0.091290"},{"1":"6","2":"22","3":"0.096175"},{"1":"6","2":"23","3":"0.089672"},{"1":"6","2":"24","3":"0.056992"},{"1":"6","2":"25","3":"0.060169"},{"1":"6","2":"26","3":"0.082347"},{"1":"6","2":"27","3":"0.111824"},{"1":"6","2":"28","3":"0.188751"},{"1":"6","2":"29","3":"0.071111"},{"1":"6","2":"30","3":"0.097491"},{"1":"6","2":"31","3":"0.092602"},{"1":"6","2":"32","3":"0.082183"},{"1":"6","2":"33","3":"0.073991"},{"1":"6","2":"34","3":"0.053932"},{"1":"6","2":"35","3":"0.057034"},{"1":"6","2":"36","3":"0.132071"},{"1":"6","2":"37","3":"0.056424"},{"1":"6","2":"38","3":"0.082039"},{"1":"6","2":"39","3":"0.037545"},{"1":"6","2":"40","3":"0.099554"},{"1":"6","2":"41","3":"0.080997"},{"1":"6","2":"42","3":"0.116338"},{"1":"6","2":"43","3":"0.083169"},{"1":"6","2":"44","3":"0.117779"},{"1":"6","2":"45","3":"0.106787"},{"1":"6","2":"46","3":"0.140856"},{"1":"6","2":"47","3":"0.086322"},{"1":"6","2":"48","3":"0.097237"},{"1":"6","2":"49","3":"0.063185"},{"1":"6","2":"50","3":"0.103017"},{"1":"6","2":"51","3":"0.105576"},{"1":"6","2":"52","3":"0.184151"},{"1":"6","2":"53","3":"0.056775"},{"1":"6","2":"54","3":"0.046904"},{"1":"6","2":"55","3":"0.146711"},{"1":"6","2":"56","3":"0.080700"},{"1":"6","2":"57","3":"0.072241"},{"1":"6","2":"58","3":"0.062179"},{"1":"6","2":"59","3":"0.095498"},{"1":"6","2":"60","3":"0.060655"},{"1":"6","2":"61","3":"0.099421"},{"1":"6","2":"62","3":"0.089140"},{"1":"6","2":"63","3":"0.158786"},{"1":"6","2":"64","3":"0.076443"},{"1":"6","2":"65","3":"0.090594"},{"1":"6","2":"66","3":"0.054857"},{"1":"6","2":"67","3":"0.216585"},{"1":"6","2":"68","3":"0.097167"},{"1":"6","2":"69","3":"0.088899"},{"1":"6","2":"70","3":"0.068876"},{"1":"6","2":"71","3":"0.096571"},{"1":"6","2":"72","3":"0.060588"},{"1":"6","2":"73","3":"0.065761"},{"1":"6","2":"74","3":"0.081804"},{"1":"6","2":"75","3":"0.085535"},{"1":"6","2":"76","3":"0.096402"},{"1":"6","2":"77","3":"0.068852"},{"1":"6","2":"78","3":"0.080279"},{"1":"6","2":"79","3":"0.086572"},{"1":"6","2":"80","3":"0.069498"},{"1":"6","2":"81","3":"0.051057"},{"1":"6","2":"82","3":"0.095826"},{"1":"6","2":"83","3":"0.092857"},{"1":"6","2":"84","3":"0.092226"},{"1":"6","2":"85","3":"0.085966"},{"1":"6","2":"86","3":"0.044774"},{"1":"6","2":"87","3":"0.057001"},{"1":"6","2":"88","3":"0.042154"},{"1":"6","2":"89","3":"0.166711"},{"1":"6","2":"90","3":"0.043191"},{"1":"6","2":"91","3":"0.040673"},{"1":"6","2":"92","3":"0.085456"},{"1":"6","2":"93","3":"0.059707"},{"1":"6","2":"94","3":"0.042000"},{"1":"6","2":"95","3":"0.047877"},{"1":"6","2":"96","3":"0.084940"},{"1":"7","2":"8","3":"0.037681"},{"1":"7","2":"9","3":"0.073632"},{"1":"7","2":"10","3":"0.048584"},{"1":"7","2":"11","3":"0.014146"},{"1":"7","2":"12","3":"0.029331"},{"1":"7","2":"13","3":"0.030018"},{"1":"7","2":"14","3":"0.001837"},{"1":"7","2":"15","3":"0.065483"},{"1":"7","2":"16","3":"0.048960"},{"1":"7","2":"17","3":"0.008740"},{"1":"7","2":"18","3":"0.008420"},{"1":"7","2":"19","3":"0.036776"},{"1":"7","2":"20","3":"0.029863"},{"1":"7","2":"21","3":"0.046365"},{"1":"7","2":"22","3":"0.028833"},{"1":"7","2":"23","3":"0.034663"},{"1":"7","2":"24","3":"0.007022"},{"1":"7","2":"25","3":"0.014353"},{"1":"7","2":"26","3":"0.028703"},{"1":"7","2":"27","3":"0.043332"},{"1":"7","2":"28","3":"0.045628"},{"1":"7","2":"29","3":"0.021866"},{"1":"7","2":"30","3":"0.042245"},{"1":"7","2":"31","3":"0.040172"},{"1":"7","2":"32","3":"0.082456"},{"1":"7","2":"33","3":"0.041092"},{"1":"7","2":"34","3":"0.011196"},{"1":"7","2":"35","3":"0.014526"},{"1":"7","2":"36","3":"0.065494"},{"1":"7","2":"37","3":"0.067033"},{"1":"7","2":"38","3":"0.041130"},{"1":"7","2":"39","3":"0.054834"},{"1":"7","2":"40","3":"0.037642"},{"1":"7","2":"41","3":"0.036187"},{"1":"7","2":"42","3":"0.071529"},{"1":"7","2":"43","3":"0.072116"},{"1":"7","2":"44","3":"0.235430"},{"1":"7","2":"45","3":"0.052970"},{"1":"7","2":"46","3":"0.049364"},{"1":"7","2":"47","3":"0.030269"},{"1":"7","2":"48","3":"0.039283"},{"1":"7","2":"49","3":"0.010445"},{"1":"7","2":"50","3":"0.057948"},{"1":"7","2":"51","3":"0.030307"},{"1":"7","2":"52","3":"0.047806"},{"1":"7","2":"53","3":"0.065390"},{"1":"7","2":"54","3":"0.073008"},{"1":"7","2":"55","3":"0.020710"},{"1":"7","2":"56","3":"0.075964"},{"1":"7","2":"57","3":"0.015935"},{"1":"7","2":"58","3":"0.001935"},{"1":"7","2":"59","3":"0.048958"},{"1":"7","2":"60","3":"0.041980"},{"1":"7","2":"61","3":"0.054835"},{"1":"7","2":"62","3":"0.080528"},{"1":"7","2":"63","3":"0.014953"},{"1":"7","2":"64","3":"0.021075"},{"1":"7","2":"65","3":"0.055721"},{"1":"7","2":"66","3":"0.034055"},{"1":"7","2":"67","3":"0.023779"},{"1":"7","2":"68","3":"0.076647"},{"1":"7","2":"69","3":"0.058350"},{"1":"7","2":"70","3":"0.029510"},{"1":"7","2":"71","3":"0.028374"},{"1":"7","2":"72","3":"0.017374"},{"1":"7","2":"73","3":"0.012031"},{"1":"7","2":"74","3":"0.059598"},{"1":"7","2":"75","3":"0.062322"},{"1":"7","2":"76","3":"0.066744"},{"1":"7","2":"77","3":"0.019436"},{"1":"7","2":"78","3":"0.026656"},{"1":"7","2":"79","3":"0.107129"},{"1":"7","2":"80","3":"0.019613"},{"1":"7","2":"81","3":"0.017221"},{"1":"7","2":"82","3":"0.071367"},{"1":"7","2":"83","3":"0.042883"},{"1":"7","2":"84","3":"0.087048"},{"1":"7","2":"85","3":"0.040063"},{"1":"7","2":"86","3":"0.068307"},{"1":"7","2":"87","3":"0.060993"},{"1":"7","2":"88","3":"0.037355"},{"1":"7","2":"89","3":"0.055895"},{"1":"7","2":"90","3":"0.052886"},{"1":"7","2":"91","3":"0.040244"},{"1":"7","2":"92","3":"0.056531"},{"1":"7","2":"93","3":"0.016101"},{"1":"7","2":"94","3":"0.046155"},{"1":"7","2":"95","3":"0.032705"},{"1":"7","2":"96","3":"0.100026"},{"1":"8","2":"9","3":"0.076241"},{"1":"8","2":"10","3":"0.030992"},{"1":"8","2":"11","3":"0.000789"},{"1":"8","2":"12","3":"0.042107"},{"1":"8","2":"13","3":"0.150656"},{"1":"8","2":"14","3":"0.019010"},{"1":"8","2":"15","3":"0.066057"},{"1":"8","2":"16","3":"0.051948"},{"1":"8","2":"17","3":"0.060497"},{"1":"8","2":"18","3":"0.019421"},{"1":"8","2":"19","3":"0.048342"},{"1":"8","2":"20","3":"0.035847"},{"1":"8","2":"21","3":"0.064413"},{"1":"8","2":"22","3":"0.031124"},{"1":"8","2":"23","3":"0.035968"},{"1":"8","2":"24","3":"0.017526"},{"1":"8","2":"25","3":"0.030725"},{"1":"8","2":"26","3":"0.042101"},{"1":"8","2":"27","3":"0.055829"},{"1":"8","2":"28","3":"0.023716"},{"1":"8","2":"29","3":"0.033565"},{"1":"8","2":"30","3":"0.027080"},{"1":"8","2":"31","3":"0.053088"},{"1":"8","2":"32","3":"0.085676"},{"1":"8","2":"33","3":"0.036309"},{"1":"8","2":"34","3":"0.034915"},{"1":"8","2":"35","3":"0.031871"},{"1":"8","2":"36","3":"0.069718"},{"1":"8","2":"37","3":"0.056424"},{"1":"8","2":"38","3":"0.142338"},{"1":"8","2":"39","3":"0.053881"},{"1":"8","2":"40","3":"0.047886"},{"1":"8","2":"41","3":"0.067384"},{"1":"8","2":"42","3":"0.070822"},{"1":"8","2":"43","3":"0.035607"},{"1":"8","2":"44","3":"0.078512"},{"1":"8","2":"45","3":"0.081021"},{"1":"8","2":"46","3":"0.051627"},{"1":"8","2":"47","3":"0.045039"},{"1":"8","2":"48","3":"0.044469"},{"1":"8","2":"49","3":"0.008217"},{"1":"8","2":"50","3":"0.024250"},{"1":"8","2":"51","3":"0.038543"},{"1":"8","2":"52","3":"0.059998"},{"1":"8","2":"53","3":"0.062368"},{"1":"8","2":"54","3":"0.047636"},{"1":"8","2":"55","3":"0.027492"},{"1":"8","2":"56","3":"0.033044"},{"1":"8","2":"57","3":"0.011403"},{"1":"8","2":"58","3":"0.021605"},{"1":"8","2":"59","3":"0.026306"},{"1":"8","2":"60","3":"0.053199"},{"1":"8","2":"61","3":"0.062486"},{"1":"8","2":"62","3":"0.044482"},{"1":"8","2":"63","3":"0.033823"},{"1":"8","2":"64","3":"0.173718"},{"1":"8","2":"65","3":"0.062559"},{"1":"8","2":"66","3":"0.046356"},{"1":"8","2":"67","3":"0.032180"},{"1":"8","2":"68","3":"0.073765"},{"1":"8","2":"69","3":"0.065567"},{"1":"8","2":"70","3":"0.037328"},{"1":"8","2":"71","3":"0.150217"},{"1":"8","2":"72","3":"0.019085"},{"1":"8","2":"73","3":"0.021215"},{"1":"8","2":"74","3":"0.040385"},{"1":"8","2":"75","3":"0.072262"},{"1":"8","2":"76","3":"0.031637"},{"1":"8","2":"77","3":"0.040761"},{"1":"8","2":"78","3":"0.149475"},{"1":"8","2":"79","3":"0.056365"},{"1":"8","2":"80","3":"0.014016"},{"1":"8","2":"81","3":"0.027660"},{"1":"8","2":"82","3":"0.027720"},{"1":"8","2":"83","3":"0.065248"},{"1":"8","2":"84","3":"0.022977"},{"1":"8","2":"85","3":"0.088408"},{"1":"8","2":"86","3":"0.057226"},{"1":"8","2":"87","3":"0.063382"},{"1":"8","2":"88","3":"0.041107"},{"1":"8","2":"89","3":"0.053944"},{"1":"8","2":"90","3":"0.064771"},{"1":"8","2":"91","3":"0.052366"},{"1":"8","2":"92","3":"0.040411"},{"1":"8","2":"93","3":"0.001875"},{"1":"8","2":"94","3":"0.038919"},{"1":"8","2":"95","3":"0.039390"},{"1":"8","2":"96","3":"0.037633"},{"1":"9","2":"10","3":"0.090736"},{"1":"9","2":"11","3":"0.051313"},{"1":"9","2":"12","3":"0.051122"},{"1":"9","2":"13","3":"0.070083"},{"1":"9","2":"14","3":"0.048240"},{"1":"9","2":"15","3":"0.056394"},{"1":"9","2":"16","3":"0.044051"},{"1":"9","2":"17","3":"0.058456"},{"1":"9","2":"18","3":"0.052346"},{"1":"9","2":"19","3":"0.101021"},{"1":"9","2":"20","3":"0.037458"},{"1":"9","2":"21","3":"0.080702"},{"1":"9","2":"22","3":"0.093824"},{"1":"9","2":"23","3":"0.085930"},{"1":"9","2":"24","3":"0.053265"},{"1":"9","2":"25","3":"0.058107"},{"1":"9","2":"26","3":"0.085961"},{"1":"9","2":"27","3":"0.095915"},{"1":"9","2":"28","3":"0.102690"},{"1":"9","2":"29","3":"0.061464"},{"1":"9","2":"30","3":"0.100711"},{"1":"9","2":"31","3":"0.090299"},{"1":"9","2":"32","3":"0.081922"},{"1":"9","2":"33","3":"0.072356"},{"1":"9","2":"34","3":"0.050667"},{"1":"9","2":"35","3":"0.052820"},{"1":"9","2":"36","3":"0.116819"},{"1":"9","2":"37","3":"0.122156"},{"1":"9","2":"38","3":"0.079281"},{"1":"9","2":"39","3":"0.028538"},{"1":"9","2":"40","3":"0.094511"},{"1":"9","2":"41","3":"0.074021"},{"1":"9","2":"42","3":"0.203335"},{"1":"9","2":"43","3":"0.082292"},{"1":"9","2":"44","3":"0.112354"},{"1":"9","2":"45","3":"0.089494"},{"1":"9","2":"46","3":"0.119036"},{"1":"9","2":"47","3":"0.081024"},{"1":"9","2":"48","3":"0.098419"},{"1":"9","2":"49","3":"0.055535"},{"1":"9","2":"50","3":"0.094582"},{"1":"9","2":"51","3":"0.091334"},{"1":"9","2":"52","3":"0.042144"},{"1":"9","2":"53","3":"0.048562"},{"1":"9","2":"54","3":"0.048946"},{"1":"9","2":"55","3":"0.117334"},{"1":"9","2":"56","3":"0.077088"},{"1":"9","2":"57","3":"0.067196"},{"1":"9","2":"58","3":"0.058558"},{"1":"9","2":"59","3":"0.092794"},{"1":"9","2":"60","3":"0.171923"},{"1":"9","2":"61","3":"0.082171"},{"1":"9","2":"62","3":"0.086899"},{"1":"9","2":"63","3":"0.058067"},{"1":"9","2":"64","3":"0.071909"},{"1":"9","2":"65","3":"0.063663"},{"1":"9","2":"66","3":"0.037566"},{"1":"9","2":"67","3":"0.104485"},{"1":"9","2":"68","3":"0.199034"},{"1":"9","2":"69","3":"0.083080"},{"1":"9","2":"70","3":"0.061762"},{"1":"9","2":"71","3":"0.085805"},{"1":"9","2":"72","3":"0.058136"},{"1":"9","2":"73","3":"0.057196"},{"1":"9","2":"74","3":"0.073472"},{"1":"9","2":"75","3":"0.071175"},{"1":"9","2":"76","3":"0.094754"},{"1":"9","2":"77","3":"0.051850"},{"1":"9","2":"78","3":"0.080573"},{"1":"9","2":"79","3":"0.090400"},{"1":"9","2":"80","3":"0.066444"},{"1":"9","2":"81","3":"0.039374"},{"1":"9","2":"82","3":"0.093205"},{"1":"9","2":"83","3":"0.079765"},{"1":"9","2":"84","3":"0.084148"},{"1":"9","2":"85","3":"0.089222"},{"1":"9","2":"86","3":"0.038475"},{"1":"9","2":"87","3":"0.042793"},{"1":"9","2":"88","3":"0.033916"},{"1":"9","2":"89","3":"0.083159"},{"1":"9","2":"90","3":"0.036820"},{"1":"9","2":"91","3":"0.037891"},{"1":"9","2":"92","3":"0.079494"},{"1":"9","2":"93","3":"0.052940"},{"1":"9","2":"94","3":"0.032407"},{"1":"9","2":"95","3":"0.038686"},{"1":"9","2":"96","3":"0.080779"},{"1":"10","2":"11","3":"0.018154"},{"1":"10","2":"12","3":"0.052146"},{"1":"10","2":"13","3":"0.049035"},{"1":"10","2":"14","3":"0.046644"},{"1":"10","2":"15","3":"0.074869"},{"1":"10","2":"16","3":"0.064214"},{"1":"10","2":"17","3":"0.013572"},{"1":"10","2":"18","3":"0.032066"},{"1":"10","2":"19","3":"0.062265"},{"1":"10","2":"20","3":"0.063288"},{"1":"10","2":"21","3":"0.065018"},{"1":"10","2":"22","3":"0.139284"},{"1":"10","2":"23","3":"0.046992"},{"1":"10","2":"24","3":"0.028157"},{"1":"10","2":"25","3":"0.033357"},{"1":"10","2":"26","3":"0.056305"},{"1":"10","2":"27","3":"0.044183"},{"1":"10","2":"28","3":"0.035027"},{"1":"10","2":"29","3":"0.040270"},{"1":"10","2":"30","3":"0.037586"},{"1":"10","2":"31","3":"0.034700"},{"1":"10","2":"32","3":"0.094881"},{"1":"10","2":"33","3":"0.038865"},{"1":"10","2":"34","3":"0.043282"},{"1":"10","2":"35","3":"0.045614"},{"1":"10","2":"36","3":"0.083478"},{"1":"10","2":"37","3":"0.077594"},{"1":"10","2":"38","3":"0.029700"},{"1":"10","2":"39","3":"0.065680"},{"1":"10","2":"40","3":"0.062533"},{"1":"10","2":"41","3":"0.067098"},{"1":"10","2":"42","3":"0.081085"},{"1":"10","2":"43","3":"0.052138"},{"1":"10","2":"44","3":"0.096020"},{"1":"10","2":"45","3":"0.076282"},{"1":"10","2":"46","3":"0.072332"},{"1":"10","2":"47","3":"0.030324"},{"1":"10","2":"48","3":"0.035386"},{"1":"10","2":"49","3":"0.008635"},{"1":"10","2":"50","3":"0.049483"},{"1":"10","2":"51","3":"0.063055"},{"1":"10","2":"52","3":"0.066540"},{"1":"10","2":"53","3":"0.074815"},{"1":"10","2":"54","3":"0.067431"},{"1":"10","2":"55","3":"0.033486"},{"1":"10","2":"56","3":"0.050603"},{"1":"10","2":"57","3":"0.018579"},{"1":"10","2":"58","3":"0.037187"},{"1":"10","2":"59","3":"0.046924"},{"1":"10","2":"60","3":"0.066402"},{"1":"10","2":"61","3":"0.075097"},{"1":"10","2":"62","3":"0.067951"},{"1":"10","2":"63","3":"0.042973"},{"1":"10","2":"64","3":"0.046046"},{"1":"10","2":"65","3":"0.073375"},{"1":"10","2":"66","3":"0.070013"},{"1":"10","2":"67","3":"0.045646"},{"1":"10","2":"68","3":"0.087596"},{"1":"10","2":"69","3":"0.176584"},{"1":"10","2":"70","3":"0.055027"},{"1":"10","2":"71","3":"0.049212"},{"1":"10","2":"72","3":"0.031703"},{"1":"10","2":"73","3":"0.025668"},{"1":"10","2":"74","3":"0.060666"},{"1":"10","2":"75","3":"0.078901"},{"1":"10","2":"76","3":"0.038169"},{"1":"10","2":"77","3":"0.057074"},{"1":"10","2":"78","3":"0.056725"},{"1":"10","2":"79","3":"0.069625"},{"1":"10","2":"80","3":"0.009688"},{"1":"10","2":"81","3":"0.037491"},{"1":"10","2":"82","3":"0.049555"},{"1":"10","2":"83","3":"0.068509"},{"1":"10","2":"84","3":"0.042551"},{"1":"10","2":"85","3":"0.044517"},{"1":"10","2":"86","3":"0.074276"},{"1":"10","2":"87","3":"0.079282"},{"1":"10","2":"88","3":"0.052125"},{"1":"10","2":"89","3":"0.069429"},{"1":"10","2":"90","3":"0.075782"},{"1":"10","2":"91","3":"0.074276"},{"1":"10","2":"92","3":"0.055056"},{"1":"10","2":"93","3":"0.011526"},{"1":"10","2":"94","3":"0.061433"},{"1":"10","2":"95","3":"0.055556"},{"1":"10","2":"96","3":"0.055323"},{"1":"11","2":"12","3":"0.073110"},{"1":"11","2":"13","3":"0.020984"},{"1":"11","2":"14","3":"0.118448"},{"1":"11","2":"15","3":"0.086739"},{"1":"11","2":"16","3":"0.086654"},{"1":"11","2":"17","3":"0.037212"},{"1":"11","2":"18","3":"0.044961"},{"1":"11","2":"19","3":"0.021185"},{"1":"11","2":"20","3":"0.075355"},{"1":"11","2":"21","3":"0.027826"},{"1":"11","2":"22","3":"0.025981"},{"1":"11","2":"23","3":"0.012938"},{"1":"11","2":"24","3":"0.045703"},{"1":"11","2":"25","3":"0.052379"},{"1":"11","2":"26","3":"0.027170"},{"1":"11","2":"27","3":"0.010529"},{"1":"11","2":"28","3":"0.020835"},{"1":"11","2":"29","3":"0.070338"},{"1":"11","2":"30","3":"0.009758"},{"1":"11","2":"31","3":"0.006556"},{"1":"11","2":"32","3":"0.063887"},{"1":"11","2":"33","3":"0.037732"},{"1":"11","2":"34","3":"0.060080"},{"1":"11","2":"35","3":"0.055141"},{"1":"11","2":"36","3":"0.040512"},{"1":"11","2":"37","3":"0.090636"},{"1":"11","2":"38","3":"0.012496"},{"1":"11","2":"39","3":"0.092812"},{"1":"11","2":"40","3":"0.016861"},{"1":"11","2":"41","3":"0.028569"},{"1":"11","2":"42","3":"0.043139"},{"1":"11","2":"43","3":"0.001483"},{"1":"11","2":"44","3":"0.062556"},{"1":"11","2":"45","3":"0.027763"},{"1":"11","2":"46","3":"0.032864"},{"1":"11","2":"47","3":"0.012407"},{"1":"11","2":"48","3":"0.032781"},{"1":"11","2":"49","3":"0.046628"},{"1":"11","2":"50","3":"0.011874"},{"1":"11","2":"51","3":"0.015832"},{"1":"11","2":"52","3":"0.086776"},{"1":"11","2":"53","3":"0.091870"},{"1":"11","2":"54","3":"0.088620"},{"1":"11","2":"55","3":"0.001261"},{"1":"11","2":"56","3":"0.005435"},{"1":"11","2":"57","3":"0.041982"},{"1":"11","2":"58","3":"0.040483"},{"1":"11","2":"59","3":"0.026191"},{"1":"11","2":"60","3":"0.077937"},{"1":"11","2":"61","3":"0.034205"},{"1":"11","2":"62","3":"0.015742"},{"1":"11","2":"63","3":"0.057869"},{"1":"11","2":"64","3":"0.012906"},{"1":"11","2":"65","3":"0.041220"},{"1":"11","2":"66","3":"0.072917"},{"1":"11","2":"67","3":"0.012171"},{"1":"11","2":"68","3":"0.053364"},{"1":"11","2":"69","3":"0.046398"},{"1":"11","2":"70","3":"0.066727"},{"1":"11","2":"71","3":"0.006934"},{"1":"11","2":"72","3":"0.044985"},{"1":"11","2":"73","3":"0.047433"},{"1":"11","2":"74","3":"0.042534"},{"1":"11","2":"75","3":"0.034178"},{"1":"11","2":"76","3":"0.010242"},{"1":"11","2":"77","3":"0.063290"},{"1":"11","2":"78","3":"0.013500"},{"1":"11","2":"79","3":"0.027956"},{"1":"11","2":"80","3":"0.046675"},{"1":"11","2":"81","3":"0.062467"},{"1":"11","2":"82","3":"0.008260"},{"1":"11","2":"83","3":"0.024002"},{"1":"11","2":"84","3":"0.030022"},{"1":"11","2":"85","3":"0.008008"},{"1":"11","2":"86","3":"0.090461"},{"1":"11","2":"87","3":"0.097402"},{"1":"11","2":"88","3":"0.066790"},{"1":"11","2":"89","3":"0.087906"},{"1":"11","2":"90","3":"0.111899"},{"1":"11","2":"91","3":"0.093254"},{"1":"11","2":"92","3":"0.016242"},{"1":"11","2":"93","3":"0.047136"},{"1":"11","2":"94","3":"0.100091"},{"1":"11","2":"95","3":"0.071510"},{"1":"11","2":"96","3":"0.014852"},{"1":"12","2":"13","3":"0.027632"},{"1":"12","2":"14","3":"0.074009"},{"1":"12","2":"15","3":"0.086502"},{"1":"12","2":"16","3":"0.076403"},{"1":"12","2":"17","3":"0.078853"},{"1":"12","2":"18","3":"0.069380"},{"1":"12","2":"19","3":"0.143327"},{"1":"12","2":"20","3":"0.057626"},{"1":"12","2":"21","3":"0.033666"},{"1":"12","2":"22","3":"0.047611"}],"options":{"columns":{"min":{},"max":[10],"total":[3]},"rows":{"min":[10],"max":[10],"total":[4560]},"pages":{}}}
  </script>
</div>

<!-- rnb-frame-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



using igraph

tidygraph and ggraph



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuI3JhYl90aWR5IDwtIHRibF9ncmFwaChub2RlcyA9IG5vZGVzLCBlZGdlcyA9IGVkZ2VzLCBkaXJlY3RlZCA9IEZBTFNFKVxuXG4jdGhlbWVfc2V0KGRhcmtfdGhlbWVfY2xhc3NpYygpKVxuXG5yYWJfaWdyYXBoIDwtIGdyYXBoX2Zyb21fZGF0YV9mcmFtZShkID0gZWRnZXMsIHZlcnRpY2VzID0gbm9kZXMsIGRpcmVjdGVkID0gRkFMU0UpXG5cbiNjcmVhdGUgYSBjdXRvZmYgdW5kZXIgd2hpY2ggZWRnZXMgYXJlIG5vdCBkaXNwbGF5ZWQgb3IgbWFudWFsbHkgc2V0IGN1dG9mZiB0byAwLjFcbmN1dC5vZmYgPC0gbWVhbihlZGdlcyR3ZWlnaHQpIFxubmV0LnNwIDwtIGRlbGV0ZV9lZGdlcyhyYWJfaWdyYXBoLCBFKHJhYl9pZ3JhcGgpW3dlaWdodDwwLjFdKVxuXG4jZ2VuZXJhdGUgY29sb3VycyBiYXNlZCBvbiBzZXhcblYobmV0LnNwKSRzaGFwZSA8LSBjYXNlX3doZW4oVihuZXQuc3ApJHNleCA9PSBcXGZcXCB+IFxcY2lyY2xlXFwsXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFYobmV0LnNwKSRzZXggPT0gXFxtXFwgfiBcXHRyaWFuZ2xlXFwpXG5cblRlbl9jb2xvcnMgPC0gIHNjYWxlczo6dmlyaWRpc19wYWwoKSgxMClcblxuI2dlbmVyYXRlIHNoYXBlIGJhc2VkIG9uIGdyb3VwXG5WKG5ldC5zcCkkY29sb3IgPC0gY2FzZV93aGVuKFYobmV0LnNwKSRHcm91cF9JRCA9PSBcXG1wYWxhXFwgfiBUZW5fY29sb3JzWzFdLFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWKG5ldC5zcCkkR3JvdXBfSUQgPT0gXFxtcGFsYV9jaGlja3NcXCB+IFRlbl9jb2xvcnNbMl0sXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFYobmV0LnNwKSRHcm91cF9JRCA9PSBcXHdpbmdfdGFnc1xcIH4gVGVuX2NvbG9yc1szXSxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVihuZXQuc3ApJEdyb3VwX0lEID09IFxcNTUwOVxcIH4gVGVuX2NvbG9yc1s0XSxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVihuZXQuc3ApJEdyb3VwX0lEID09IFxcNTkzMS01OTM4XFwgfiBUZW5fY29sb3JzWzVdLFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWKG5ldC5zcCkkR3JvdXBfSUQgPT0gXFxkdW1wXFwgfiBUZW5fY29sb3JzWzZdLFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWKG5ldC5zcCkkR3JvdXBfSUQgPT0gXFx3dDAyNVxcIH4gVGVuX2NvbG9yc1s3XSxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFYobmV0LnNwKSRHcm91cF9JRCA9PSBcXDU1MTJcXCB+IFRlbl9jb2xvcnNbOF0sXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWKG5ldC5zcCkkR3JvdXBfSUQgPT0gXFxSUldCXFwgfiBUZW5fY29sb3JzWzldLFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVihuZXQuc3ApJEdyb3VwX0lEID09IFxcUk9PUFxcIH4gVGVuX2NvbG9yc1sxMF1cbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKVxuXG5nZ3JhcGgobmV0LnNwLCBsYXlvdXQgPSBcXHN0cmVzc1xcLGJib3ggPSA1MCkgKyBcbiAjIGdlb21fbm9kZV9wb2ludCgpICtcbiAgZ2VvbV9lZGdlX2xpbmsyKGFlcyh3aWR0aCA9IHdlaWdodCksIGFscGhhID0gMC4yKSArIFxuICBzY2FsZV9lZGdlX3dpZHRoKHJhbmdlID0gYygwLCAzKSkgK1xuICBnZW9tX25vZGVfcG9pbnQoY29sb3I9VihuZXQuc3ApJGNvbG9yLCBzaGFwZSA9IFYobmV0LnNwKSRzaGFwZSwgc2l6ZT0gMikgICtcbiAgbGFicyhlZGdlX3dpZHRoID0gXFxyYWJcXCwgY29sb3IgPSBcXEdyb3VwX0lEXFwsIHNoYXBlID0gXFxzZXhcXCkgK1xuICB0aGVtZV9ncmFwaCgpK1xuICB0aGVtZShsZWdlbmQucG9zaXRpb24gPSBcXGJvdHRvbVxcKSBcbmBgYFxuYGBgIn0= -->

```r
```r
#rab_tidy <- tbl_graph(nodes = nodes, edges = edges, directed = FALSE)

#theme_set(dark_theme_classic())

rab_igraph <- graph_from_data_frame(d = edges, vertices = nodes, directed = FALSE)

#create a cutoff under which edges are not displayed or manually set cutoff to 0.1
cut.off <- mean(edges$weight) 
net.sp <- delete_edges(rab_igraph, E(rab_igraph)[weight<0.1])

#generate colours based on sex
V(net.sp)$shape <- case_when(V(net.sp)$sex == \f\ ~ \circle\,
                                V(net.sp)$sex == \m\ ~ \triangle\)

Ten_colors <-  scales::viridis_pal()(10)

#generate shape based on group
V(net.sp)$color <- case_when(V(net.sp)$Group_ID == \mpala\ ~ Ten_colors[1],
                                V(net.sp)$Group_ID == \mpala_chicks\ ~ Ten_colors[2],
                                V(net.sp)$Group_ID == \wing_tags\ ~ Ten_colors[3],
                                V(net.sp)$Group_ID == \5509\ ~ Ten_colors[4],
                                V(net.sp)$Group_ID == \5931-5938\ ~ Ten_colors[5],
                                V(net.sp)$Group_ID == \dump\ ~ Ten_colors[6],
                                V(net.sp)$Group_ID == \wt025\ ~ Ten_colors[7],
                                 V(net.sp)$Group_ID == \5512\ ~ Ten_colors[8],
                                 V(net.sp)$Group_ID == \RRWB\ ~ Ten_colors[9],
                                 V(net.sp)$Group_ID == \ROOP\ ~ Ten_colors[10]
                             )

ggraph(net.sp, layout = \stress\,bbox = 50) + 
 # geom_node_point() +
  geom_edge_link2(aes(width = weight), alpha = 0.2) + 
  scale_edge_width(range = c(0, 3)) +
  geom_node_point(color=V(net.sp)$color, shape = V(net.sp)$shape, size= 2)  +
  labs(edge_width = \rab\, color = \Group_ID\, shape = \sex\) +
  theme_graph()+
  theme(legend.position = \bottom\) 
```
```

<!-- rnb-source-end -->

<!-- rnb-plot-begin -->

<img src="data:image/png;base64,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" />

<!-- rnb-plot-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuTkFcbk5BXG5OQVxuTkFcbmBgYFxuYGBgIn0= -->

```r
```r
NA
NA
NA
NA
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuZ3JvdXAgPC0gYyhcXG1wYWxhXFwgLCBcXG1wYWxhX2NoaWNrc1xcLFxcd2luZ190YWdzXFwsXFw1NTA5XFwgLCBcXDU5MzEtNTkzOFxcLCBcXGR1bXBcXCAsXFx3dDAyNVxcLFxcNTUxMlxcICxcXFJSV0JcXCxcXFJPT1BcXClcbklEIDwtICgxOjEwKVxuc2V4IDwtIGMoXFxtYWxlXFwgLCBcXGZlbWFsZVxcLFxcbWFsZVxcLCBcXGZlbWFsZVxcLFxcbWFsZVxcLCBcXGZlbWFsZVxcLFxcbWFsZVxcLCBcXGZlbWFsZVxcLFxcbWFsZVxcLCBcXGZlbWFsZVxcIClcblxudGVzdCA8LSBhcy5kYXRhLmZyYW1lKGNiaW5kKGdyb3VwLCBJRCwgc2V4KSlcblxudGVuX2NvbG9yc19zb3J0ZWQgPC0gYyhUZW5fY29sb3JzWzRdLFRlbl9jb2xvcnNbOF0sVGVuX2NvbG9yc1s1XSxUZW5fY29sb3JzWzZdLFRlbl9jb2xvcnNbMV0sVGVuX2NvbG9yc1syXSxUZW5fY29sb3JzWzEwXSxUZW5fY29sb3JzWzldLCBUZW5fY29sb3JzWzNdLCBUZW5fY29sb3JzWzddKVxuXG50aGVtZV9zZXQodGhlbWVfY2xhc3NpYygpKVxuXG5nZ3Bsb3QodGVzdCwgYWVzKHg9Z3JvdXAsIHk9c2V4KSkgK1xuICBcbiAgZ2VvbV9wb2ludChhZXMoY29sb3I9Z3JvdXAsIHNoYXBlID0gc2V4KSkgK1xuICBcbiAgc2NhbGVfY29sb3JfbWFudWFsKHZhbHVlcyA9IHRlbl9jb2xvcnNfc29ydGVkKVxuYGBgXG5gYGAifQ== -->

```r
```r
group <- c(\mpala\ , \mpala_chicks\,\wing_tags\,\5509\ , \5931-5938\, \dump\ ,\wt025\,\5512\ ,\RRWB\,\ROOP\)
ID <- (1:10)
sex <- c(\male\ , \female\,\male\, \female\,\male\, \female\,\male\, \female\,\male\, \female\ )

test <- as.data.frame(cbind(group, ID, sex))

ten_colors_sorted <- c(Ten_colors[4],Ten_colors[8],Ten_colors[5],Ten_colors[6],Ten_colors[1],Ten_colors[2],Ten_colors[10],Ten_colors[9], Ten_colors[3], Ten_colors[7])

theme_set(theme_classic())

ggplot(test, aes(x=group, y=sex)) +
  
  geom_point(aes(color=group, shape = sex)) +
  
  scale_color_manual(values = ten_colors_sorted)
```
```

<!-- rnb-source-end -->

<!-- rnb-plot-begin -->

<img src="data:image/png;base64,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" />

<!-- rnb-plot-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuTkFcbk5BXG5OQVxuYGBgXG5gYGAifQ== -->

```r
```r
NA
NA
NA
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->







<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuIyBDb21tdW5pdHkgZGV0ZWN0aW9uIChieSBvcHRpbWl6aW5nIG1vZHVsYXJpdHkgb3ZlciBwYXJ0aXRpb25zKTpcbmNscCA8LSBjbHVzdGVyX29wdGltYWwobmV0LnNwKVxuY2xhc3MoY2xwKVxuYGBgXG5gYGAifQ== -->

```r
```r
# Community detection (by optimizing modularity over partitions):
clp <- cluster_optimal(net.sp)
class(clp)
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiWzFdIFxcY29tbXVuaXRpZXNcXFxuIn0= -->

```
[1] \communities\
```



<!-- rnb-output-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuVihuZXQuc3ApJGNvbW11bml0eSA8LSBjbHAkbWVtYmVyc2hpcFxuXG5WKG5ldC5zcCkkY29tbXVuaXR5MiA8LSBjYXNlX3doZW4oVihuZXQuc3ApJGNvbW11bml0eSA9PSBcXDNcXCB+IFRlbl9jb2xvcnNbMV0sXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFYobmV0LnNwKSRjb21tdW5pdHkgPT0gXFw0XFwgfiBUZW5fY29sb3JzWzNdLFxuICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBWKG5ldC5zcCkkY29tbXVuaXR5ID09IFxcMlxcIH4gVGVuX2NvbG9yc1s3XSxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVihuZXQuc3ApJGNvbW11bml0eSA9PSBcXDFcXCB+IFRlbl9jb2xvcnNbMl0sXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFYobmV0LnNwKSRjb21tdW5pdHkgPT0gXFw1XFwgfiBUZW5fY29sb3JzWzEwXSxcbiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgVihuZXQuc3ApJGNvbW11bml0eSA9PSBcXDZcXCB+IFRlbl9jb2xvcnNbOV0sXG4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFYobmV0LnNwKSRjb21tdW5pdHkgPT0gXFw3XFwgfiBcXGJyb3duXFwpXG5cblxuZ2dyYXBoKG5ldC5zcCwgbGF5b3V0ID0gXFxzdHJlc3NcXCxiYm94ID0gNTApICsgXG4gIFxuICBnZW9tX2VkZ2VfbGluayhhZXMod2lkdGggPSB3ZWlnaHQpLCBhbHBoYSA9IDAuMikgKyBcbiAgc2NhbGVfZWRnZV93aWR0aChyYW5nZSA9IGMoMCwgMykpICtcbiAgZ2VvbV9ub2RlX3BvaW50KGNvbG9yPVYobmV0LnNwKSRjb21tdW5pdHkyLCBzaGFwZSA9IFYobmV0LnNwKSRzaGFwZSwgc2l6ZT0gNSkgK1xuICBnZW9tX25vZGVfcG9pbnQoY29sb3I9VihuZXQuc3ApJGNvbG9yLCBzaGFwZSA9IFYobmV0LnNwKSRzaGFwZSwgc2l6ZT0gMykgK1xuICBnZW9tX25vZGVfdGV4dChhZXMoZmlsdGVyID0gKGxhYmVsID09IFxcICBcXCksIGxhYmVsID0gbGFiZWwsIHNpemUgPSBkZWdyZWUobmV0LnNwKSkpICtcbiAgbGFicyhlZGdlX3dpZHRoID0gXFxyYWJcXCwgY29sb3IgPSBcXEdyb3VwX0lEXFwsIHNoYXBlID0gXFxzZXhcXCkgK1xuICB0aGVtZV9ncmFwaCgpK1xuICB0aGVtZShsZWdlbmQucG9zaXRpb24gPSBcXGJvdHRvbVxcKSBcblxuYGBgXG5gYGAifQ== -->

```r
```r
V(net.sp)$community <- clp$membership

V(net.sp)$community2 <- case_when(V(net.sp)$community == \3\ ~ Ten_colors[1],
                                V(net.sp)$community == \4\ ~ Ten_colors[3],
                                V(net.sp)$community == \2\ ~ Ten_colors[7],
                                V(net.sp)$community == \1\ ~ Ten_colors[2],
                                V(net.sp)$community == \5\ ~ Ten_colors[10],
                                V(net.sp)$community == \6\ ~ Ten_colors[9],
                                V(net.sp)$community == \7\ ~ \brown\)


ggraph(net.sp, layout = \stress\,bbox = 50) + 
  
  geom_edge_link(aes(width = weight), alpha = 0.2) + 
  scale_edge_width(range = c(0, 3)) +
  geom_node_point(color=V(net.sp)$community2, shape = V(net.sp)$shape, size= 5) +
  geom_node_point(color=V(net.sp)$color, shape = V(net.sp)$shape, size= 3) +
  geom_node_text(aes(filter = (label == \  \), label = label, size = degree(net.sp))) +
  labs(edge_width = \rab\, color = \Group_ID\, shape = \sex\) +
  theme_graph()+
  theme(legend.position = \bottom\) 

```
```

<!-- rnb-source-end -->

<!-- rnb-plot-begin -->

<img src="data:image/png;base64,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" />

<!-- rnb-plot-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



try better visualization with "backbone" following the tutorial http://mr.schochastics.net/netVizR.html


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuYmIgPC0gbGF5b3V0X2FzX2JhY2tib25lKHJhYl9pZ3JhcGgsa2VlcCA9IDAuMSlcbkUocmFiX2lncmFwaCkkY29sIDwtIEZBTFNFXG5FKHJhYl9pZ3JhcGgpJGNvbFtiYiRiYWNrYm9uZV0gPC0gVFJVRVxuXG5nZ3JhcGgocmFiX2lncmFwaCxsYXlvdXQgPSBcXG1hbnVhbFxcLHggPSBiYiR4eVssMV0seSA9IGJiJHh5WywyXSkrXG4gIFxuXG4gIGdlb21fZWRnZV9saW5rKGFlcyh3aWR0aCA9IHdlaWdodCksIGFscGhhID0gMC4yKSArIFxuICBzY2FsZV9lZGdlX3dpZHRoKHJhbmdlID0gYygwLCAzKSkgK1xuICBcbiAgZ2VvbV9ub2RlX3BvaW50KGFlcyhmaWxsID0gR3JvdXBfSUQpLHNoYXBlID0gMjEpK1xuICBzY2FsZV9maWxsX2JyZXdlcihwYWxldHRlID0gXFxTZXQxXFwpK1xuICB0aGVtZV9ncmFwaCgpK1xuICB0aGVtZShsZWdlbmQucG9zaXRpb24gPSBcXG5vbmVcXClcbmBgYFxuYGBgIn0= -->

```r
```r
bb <- layout_as_backbone(rab_igraph,keep = 0.1)
E(rab_igraph)$col <- FALSE
E(rab_igraph)$col[bb$backbone] <- TRUE

ggraph(rab_igraph,layout = \manual\,x = bb$xy[,1],y = bb$xy[,2])+
  

  geom_edge_link(aes(width = weight), alpha = 0.2) + 
  scale_edge_width(range = c(0, 3)) +
  
  geom_node_point(aes(fill = Group_ID),shape = 21)+
  scale_fill_brewer(palette = \Set1\)+
  theme_graph()+
  theme(legend.position = \none\)
```
```

<!-- rnb-source-end -->

<!-- rnb-plot-begin -->

<img src="data:image/png;base64,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y+8WEp/9DfyUcwbvcRLEe3Df3klE3+GE9z1BPHu2ZusBIBfisBaHsY651i0NJBkKE9b3DNqoWGnzFpjL02bXtqcw+Y8wr2MKfcDCch7hl0NdwhZ6qPsK+chx3rZfPHA5Z/Aex+B9/naP/AOM8Kh7H45ktRpKINiY7t6iyAnWxPdsP9A/5cpFyK5s3iDDL9KGlkUs47r9EMC/DeT8S53A2d+NfZTll6hu+r7cf/nA5ZzB+35+B8t+/J9jayeWJqVKSYAQf9zLCddxZfsegPdDseeeWw74nePSd1dEeZPRtvyepPMOF/99HN8N4mUemrdvf/3rX79tZ+B6zuD9x+e3wWtVSqGLAXuKoLekYEVAth8i8HtsHeM4KcBjV7CRV7//dxn3/z4rHxn/h7MWg/cM3Dxn8P5r53tEGUORd2GNXxApRZIpUeHv5IW/E4nL0hl7XSTqv5tq/2E8Px5+gs/+ZnyVc34j/q3zfouvc/ftf/7nf769tcOcVMYfkuEPefr7ycyZt37G7N8Mzn96Xpp09l8+53fiPzqPx2bwzsvf67f+9se93/r/6vm5r+rVzhm8/+kxeP/9j/r27YzO/9Y5g/c/PucF/tnn/P6f52XPGbznedlzBu95XvacwXuelz1n8J7nZc8ZvOd52XMG73le9pzBe56XPWfwnudlzxm853nZcwbveV72nMF7npc9Z/Ce52XPGbznedlzBu95XvacwXuelz1n8J7nZc8ZvOd52XMG73le9pzBe56XPWfwnudlzxm853nZcwbveV72nMF7npc9Z/Ce52XPGbznedlzBu95XvacwXuelz1n8J7nZc8ZvOd52XMG73le9pzBe56XPWfwnudlzxm853nZcwbveV72nMF7npc9Z/Ce52XPGbznedlzBu95XvacwXuelz1n8J7nZc8ZvOd52XMG73le9pzBe56XPWfwnudlzxm853nZcwbveV72nMF7npc9Z/Ce52XPGbznedlzBu95XvacwXuelz1n8J7nZc8ZvOd52XMG73le9pzBe56XPWfwnudlz/8DUehmOf8UIUsAAAAASUVORK5CYII=" />

<!-- rnb-plot-end -->

<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuTkFcbk5BXG5OQVxuYGBgXG5gYGAifQ== -->

```r
```r
NA
NA
NA
```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



#association network

extract the networks for the six different seasons


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxuI2dldCBsb25nIGZvcm1hdCBvZiBhc3NvY2lhdGlvbnMgZnJvbSBuZXR3b3JrIGRhdGFcblxuZm9yKGkgaW4gMTo2KSB7XG4gIFxuIGFzc29jX25ldHdvcmsgPC0gbmV0d29ya1tbaV1dICU+JSBhcy5kYXRhLmZyYW1lICU+JSB0aWJibGU6OnJvd25hbWVzX3RvX2NvbHVtbigpICU+JSB0aWR5cjo6cGl2b3RfbG9uZ2VyKC1yb3duYW1lKSAlPiUgZmlsdGVyKHJvd25hbWUgIT0gbmFtZSlcblxubmFtZXMoYXNzb2NfbmV0d29yaykgPC0gYyhcXGlkX2FcXCxcXGlkX2JcXCxwYXN0ZShcXGFzc29jXFwsIGksIHNlcCA9IFxcX1xcKSkgXG5cbmFzc2lnbihwYXN0ZShcXGFzc29jX253XFwsIGksIHNlcCA9IFxcX1xcKSwgYXNzb2NfbmV0d29yaylcbn1cblxuI2Fzc29jX253XzEgPC0gbmV0d29ya1tbMV1dICU+JSBhcy5kYXRhLmZyYW1lICU+JSB0aWJibGU6OnJvd25hbWVzX3RvX2NvbHVtbigpICU+JSB0aWR5cjo6cGl2b3RfbG9uZ2VyKC1yb3duYW1lKSAlPiUgZmlsdGVyKHJvd25hbWUgIT0gbmFtZSlcblxuI25hbWVzKGFzc29jX253XzEpIDwtIGMoXFxpZF9hXFwsXFxpZF9iXFwsXFxhc3NvY18xXFwpIFxuXG5cbiNjb21iaW5lIGFzc29jaWF0aW9uIGRhdGEgaW4gb25lIHRhYmxlXG5cbmFzc29jX253IDwtIGZ1bGxfam9pbihhc3NvY19ud18xLCBhc3NvY19ud18yLCBieSA9IGMoXFxpZF9hXFwsIFxcaWRfYlxcKSlcblxuYXNzb2NfbncgPC0gZnVsbF9qb2luKGFzc29jX253LCBhc3NvY19ud18zLCBieSA9IGMoXFxpZF9hXFwsIFxcaWRfYlxcKSlcblxuYXNzb2NfbncgPC0gZnVsbF9qb2luKGFzc29jX253LCBhc3NvY19ud180LCBieSA9IGMoXFxpZF9hXFwsIFxcaWRfYlxcKSlcblxuYXNzb2NfbncgPC0gZnVsbF9qb2luKGFzc29jX253LCBhc3NvY19ud181LCBieSA9IGMoXFxpZF9hXFwsIFxcaWRfYlxcKSlcblxuYXNzb2NfbncgPC0gZnVsbF9qb2luKGFzc29jX253LCBhc3NvY19ud182LCBieSA9IGMoXFxpZF9hXFwsIFxcaWRfYlxcKSlcblxuYGBgXG5gYGAifQ== -->

```r
```r
#get long format of associations from network data

for(i in 1:6) {
  
 assoc_network <- network[[i]] %>% as.data.frame %>% tibble::rownames_to_column() %>% tidyr::pivot_longer(-rowname) %>% filter(rowname != name)

names(assoc_network) <- c(\id_a\,\id_b\,paste(\assoc\, i, sep = \_\)) 

assign(paste(\assoc_nw\, i, sep = \_\), assoc_network)
}

#assoc_nw_1 <- network[[1]] %>% as.data.frame %>% tibble::rownames_to_column() %>% tidyr::pivot_longer(-rowname) %>% filter(rowname != name)

#names(assoc_nw_1) <- c(\id_a\,\id_b\,\assoc_1\) 


#combine association data in one table

assoc_nw <- full_join(assoc_nw_1, assoc_nw_2, by = c(\id_a\, \id_b\))

assoc_nw <- full_join(assoc_nw, assoc_nw_3, by = c(\id_a\, \id_b\))

assoc_nw <- full_join(assoc_nw, assoc_nw_4, by = c(\id_a\, \id_b\))

assoc_nw <- full_join(assoc_nw, assoc_nw_5, by = c(\id_a\, \id_b\))

assoc_nw <- full_join(assoc_nw, assoc_nw_6, by = c(\id_a\, \id_b\))

```
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


#statistical analysis: GLMM
Run general and generalized linear mixed models with the package `lme4`.

Model formular to test influence on relatedness: is relatedness influenced by group membership and is this different for males and females?

response: dyadic relatedness
main predictors: association and sex
fixed control. group membership
random intercept: identity
coverage?
need to run for every relatedness estimator
for association: test 


## Check the data


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuc3RyKHJlbGF0ZV9yZXN1bHRzKVxuYGBgIn0= -->

```r
str(relate_results)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


inspect the data:
inspect the distribution of the predictor 

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaGlzdCgpXG5gYGAifQ== -->

```r
hist()
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


and the responses

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaGlzdCgpXG5gYGAifQ== -->

```r
hist()
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuaGlzdCgpXG5gYGAifQ== -->

```r
hist()
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


is there a need to transform any of the variables?

Z-transform all covariates to a mean of 0 and a sd of 1 prior to fitting the model to allow easier interpretation of the estimates. But still need to inform about original means and sd.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuXG5yZWxhdGVfcmVzdWx0cyRyYWJfeiA8LSBzY2FsZShyZWxhdGVfcmVzdWx0cyRyYWIpXG5yZWxhdGVfcmVzdWx0cyRwaV9IQVRfeiA8LSBzY2FsZShyZWxhdGVfcmVzdWx0cyRwaV9IQVQpIFxucmVsYXRlX3Jlc3VsdHMkTm9ybWFsaXplZDJBbGxlbGVEaWZmZXJlbmNlX3ogPC0gc2NhbGUocmVsYXRlX3Jlc3VsdHMkTm9ybWFsaXplZDJBbGxlbGVEaWZmZXJlbmNlKVxucmVsYXRlX3Jlc3VsdHMkY292ZXJhZ2VfeiA8LSBzY2FsZShyZWxhdGVfcmVzdWx0cyRjb3ZlcmFnZSlcbnJlbGF0ZV9yZXN1bHRzJG5iU05QX3ogPC0gc2NhbGUocmVsYXRlX3Jlc3VsdHMkbmJTTlApXG5yZWxhdGVfcmVzdWx0cyRuU2l0ZXNfeiA8LSBzY2FsZShyZWxhdGVfcmVzdWx0cyRuU2l0ZXMpXG5cbmBgYCJ9 -->

```r

relate_results$rab_z <- scale(relate_results$rab)
relate_results$pi_HAT_z <- scale(relate_results$pi_HAT) 
relate_results$Normalized2AlleleDifference_z <- scale(relate_results$Normalized2AlleleDifference)
relate_results$coverage_z <- scale(relate_results$coverage)
relate_results$nbSNP_z <- scale(relate_results$nbSNP)
relate_results$nSites_z <- scale(relate_results$nSites)

```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


check correlations among the predictors


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucHJlZC52YXJzIDwtIGMoKVxuXG52YXJzLmNvciA8LSBjb3IoZGF0YVsscHJlZC52YXJzXSlcblxubWF4KGFicyh2YXJzLmNvclt1cHBlci50cmkodmFycy5jb3IpXSkpXG5gYGAifQ== -->

```r
pred.vars <- c()

vars.cor <- cor(data[,pred.vars])

max(abs(vars.cor[upper.tri(vars.cor)]))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



## fit the model

full model

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmVzIDwtIGxtKHJlc3BvbnNlIH4gcHJlZGljdG9yMSArIHByZWRpY3RvcjIsIGRhdGEpXG5gYGAifQ== -->

```r
res <- lm(response ~ predictor1 + predictor2, data)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


for hypothesis testing, we also need a null model

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->



<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


## model diagnostics

### check of assumptions

normality of residuals


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxucmVzaWR1YWxzKHJlcylcblxuaGlzdChyZXNpZHVhbHMocmVzKSwgcHJvYmFiaWxpdHkgPSBUKVxuXG54IDwtIHNlcShmcm9tID0gbWluKHJlc2lkdWFscyhyZXMpKSwgdG8gPSBtYXgocmVzaWR1YWxzKHJlcykpLCBsZW5ndGgub3V0ID0gMTAwKVxuXG5saW5lcyh4ID0geCwgeSA9IGRub3JtKHgsIG1lYW4gPSAwLCBzZCA9IHNkKHJlc2lkdWFscyhyZXMpKSkpXG5gYGAifQ== -->

```r
residuals(res)

hist(residuals(res), probability = T)

x <- seq(from = min(residuals(res)), to = max(residuals(res)), length.out = 100)

lines(x = x, y = dnorm(x, mean = 0, sd = sd(residuals(res))))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


qqplot

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuI2luIGFuIGluZGVhbCBjYXNlLCBhbGwgcG9pbnRzIHdvdWxkIGZhbGwgb24gYSBzdHJhaWdodCBsaW5lXG5xcW5vcm0ocmVzaWR1YWxzKHJlcykpXG5xcWxpbmUocmVzaWR1YWxzKHJlcykpXG5gYGAifQ== -->

```r
#in an indeal case, all points would fall on a straight line
qqnorm(residuals(res))
qqline(residuals(res))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


homogeneity of residuals


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuI25vIG9idmlvdXMgcGF0dGVybiBzaG91bGQgYmUgdmlzaWJsZVxuZml0dGVkKHJlcylcblxucGxvdCA8LSAoeCA9IGZpdHRlZChyZXMpLCB5ID0gcmVzaWR1YWxzKHJlcyksIHBjaCA9IDE5KVxuYGBgIn0= -->

```r
#no obvious pattern should be visible
fitted(res)

plot <- (x = fitted(res), y = residuals(res), pch = 19)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


### model stability


fitted values (DFFit)


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGZmaXRzKHJlcykgI3N0YW5kYXJkaXplZCBERkZpdC12YWx1ZXNcblxubWF4KGFicyhkZmZpdHMocmVzKSkpICNhYnNvbHV0ZSB2YWx1ZSA+fjIgaXMgYSByZWFzb24gdG8gd29ycnlcblxuaGlzdChkZmZpdHMocmVzKSlcbmBgYCJ9 -->

```r
dffits(res) #standardized DFFit-values

max(abs(dffits(res))) #absolute value >~2 is a reason to worry

hist(dffits(res))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


model estimates (DFBeta)


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuZGZiZXRhKHJlcykgI3Vuc3RhbmRhcmRpemVkIERGQmV0YVxuXG54eCA8LSBjYmluZChjb2VmZmljaWVudHMocmVzKSwgY29lZmZpY2llbnRzKHJlcykgK1xuICAgICAgICAgICAgICB0KGFwcGx5KFggPSBkZmJldGEocmVzKSwgTUFSR0lOID0gMiwgRlVOID0gcmFuZ2UpKSlcblxuY29sbmFtZXMoeHgpIDwtIGMoXCJvcmlnXCIsIFwibWluXCIsIFwibWF4XCIpXG5yb3VuZCh4eCwgNSlcbmBgYCJ9 -->

```r
dfbeta(res) #unstandardized DFBeta

xx <- cbind(coefficients(res), coefficients(res) +
              t(apply(X = dfbeta(res), MARGIN = 2, FUN = range)))

colnames(xx) <- c("orig", "min", "max")
round(xx, 5)
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuI3N0YW5kYXJkaXplZCBERkJldGFcbmRmYmV0YXMocmVzKSAjYWJzb2x1dGUgdmFsdWVzIGxhcmdlciB0aGFuIDEgb3IgMiBhcmUgYSByZWFzb24gdG8gd29ycnlcbmBgYCJ9 -->

```r
#standardized DFBeta
dfbetas(res) #absolute values larger than 1 or 2 are a reason to worry
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


Cook's distance

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubWF4KGNvb2tzLmRpc3RhbmNlKHJlcykpICNjaGVjayByZWNvbW1lbmRlZCB0aHJlc2hvbGRzIGluIE11bmRyeSBoYW5kb3V0IDAyYlxuYGBgIn0= -->

```r
max(cooks.distance(res)) #check recommended thresholds in Mundry handout 02b
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


leverage

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxubWF4KGFzLnZlY3RvcihpbmZsdWVuY2UocmVzKSRoYXQpKVxuYGBgIn0= -->

```r
max(as.vector(influence(res)$hat))
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->


Variance Inflation Factors (VIF) requires `car` package.


<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxudmlmKHJlcykgI2NoZWNrIHJlY29tbWVuZGVkIHRocmVzaG9sZHMgaW4gTXVuZHJ5IGhhbmRvdXQgMDNiXG5gYGAifQ== -->

```r
vif(res) #check recommended thresholds in Mundry handout 03b
```

<!-- rnb-source-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->



plot various diagnostics
SEE FUNCTION IN MUNDRY SCRIPT 02b



## Inference

Protection agains multiple testing with full-null model comparison


Tests of the individual predictors


Measuring effect isze of individual predictors






vgl. Dal Pesco et al. 2021

Check for need of random slopes




Model formular to test influence on relatedness

response: dyadic relatedness
main predictor: association and sex
fixed control. group membership
random intercept: identity
coverage?
need to run for every relatedness estimator
for association: test 

lmer(relatedness ~ association + group + sex + (1|ID_a) + (1|ID_b), data = relate_results, REML = F)

testing this

<!-- rnb-text-end -->


<!-- rnb-chunk-begin -->


<!-- rnb-source-begin eyJkYXRhIjoiYGBgclxuYGBgclxubW9kZWxfc2ltcGxldGVzdCA8LSBsbWVyKHJhYl96IH4gZHlhZF9ncm91cCArIGR5YWRfc2V4ICsgKDF8SURfYSkgKyAoMXxJRF9iKSwgZGF0YSA9IHJlbGF0ZV9yZXN1bHRzLCBSRU1MID0gRilcbm1vZGVsX3NpbXBsZXRlc3RcbmBgYFxuYGBgIn0= -->

```r
```r
model_simpletest <- lmer(rab_z ~ dyad_group + dyad_sex + (1|ID_a) + (1|ID_b), data = relate_results, REML = F)
model_simpletest
```
```

<!-- rnb-source-end -->

<!-- rnb-output-begin eyJkYXRhIjoiTGluZWFyIG1peGVkIG1vZGVsIGZpdCBieSBtYXhpbXVtIGxpa2VsaWhvb2QgIFsnbG1lck1vZCddXG5Gb3JtdWxhOiByYWJfeiB+IGR5YWRfZ3JvdXAgKyBkeWFkX3NleCArICgxIHwgSURfYSkgKyAoMSB8IElEX2IpXG4gICBEYXRhOiByZWxhdGVfcmVzdWx0c1xuICAgICAgQUlDICAgICAgIEJJQyAgICBsb2dMaWsgIGRldmlhbmNlICBkZi5yZXNpZCBcbiA5NzEyLjkxNyAgOTc1Ny44OTIgLTQ4NDkuNDU4ICA5Njk4LjkxNyAgICAgIDQ1NTMgXG5SYW5kb20gZWZmZWN0czpcbiBHcm91cHMgICBOYW1lICAgICAgICBTdGQuRGV2LlxuIElEX2EgICAgIChJbnRlcmNlcHQpIDAuMzk2MyAgXG4gSURfYiAgICAgKEludGVyY2VwdCkgMC4zMzQ4ICBcbiBSZXNpZHVhbCAgICAgICAgICAgICAwLjY2NTIgIFxuTnVtYmVyIG9mIG9iczogNDU2MCwgZ3JvdXBzOiAgSURfYSwgOTU7IElEX2IsIDk1XG5GaXhlZCBFZmZlY3RzOlxuICAgICAgICAgKEludGVyY2VwdCkgIGR5YWRfZ3JvdXBpbnRyYWdyb3VwICAgICAgICAgIGR5YWRfc2V4bWFsZSAgIGR5YWRfc2V4bWFsZS1mZW1hbGUgIFxuICAgICAgICAgICAgICAwLjYwNzMgICAgICAgICAgICAgICAgMC41Mzk5ICAgICAgICAgICAgICAgLTAuMzg5MCAgICAgICAgICAgICAgIC0xLjE4MDIgIFxuIn0= -->

```
Linear mixed model fit by maximum likelihood  ['lmerMod']
Formula: rab_z ~ dyad_group + dyad_sex + (1 | ID_a) + (1 | ID_b)
   Data: relate_results
      AIC       BIC    logLik  deviance  df.resid 
 9712.917  9757.892 -4849.458  9698.917      4553 
Random effects:
 Groups   Name        Std.Dev.
 ID_a     (Intercept) 0.3963  
 ID_b     (Intercept) 0.3348  
 Residual             0.6652  
Number of obs: 4560, groups:  ID_a, 95; ID_b, 95
Fixed Effects:
         (Intercept)  dyad_groupintragroup          dyad_sexmale   dyad_sexmale-female  
              0.6073                0.5399               -0.3890               -1.1802  
```



<!-- rnb-output-end -->

<!-- rnb-chunk-end -->


<!-- rnb-text-begin -->






















<!-- rnb-text-end -->

