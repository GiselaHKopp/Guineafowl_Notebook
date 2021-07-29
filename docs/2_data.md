---
title: "Data"
output: html_notebook
editor_options:
  chunk_output_type: inline
---

# Data



Data compiled and used in this project

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
library(ggallin)
```


## Data collection

Group information is stored in *sequenced_samples_groups.csv*.


```r
sampleID_group <- read.csv("vignettes/data/sequenced_samples_groups.csv", header = TRUE, sep = ";", as.is = TRUE)


str(sampleID_group)
#> 'data.frame':	95 obs. of  4 variables:
#>  $ Group_ID       : chr  "wing_tags" "wing_tags" "wing_tags" "wing_tags" ...
#>  $ Sample.ind.code: chr  "A1295" "A1296" "A1297" "A1298" ...
#>  $ Real.ind.code  : chr  "W1295" "W1296" "W1297" "W1298" ...
#>  $ Colour_.bands  : chr  "WT002" "WT003" "WT004" "WT021" ...

#rename Real.ind.code to ID
sampleID_group <- rename(sampleID_group, "ID" = "Sample.ind.code")

#only keep group and ID
sampleID_group <- select(sampleID_group, Group_ID, ID)
str(sampleID_group)
#> 'data.frame':	95 obs. of  2 variables:
#>  $ Group_ID: chr  "wing_tags" "wing_tags" "wing_tags" "wing_tags" ...
#>  $ ID      : chr  "A1295" "A1296" "A1297" "A1298" ...
```

Sex information is stored in *samples_sex.csv*. Sex was determined in the field and confirmed at least once with a molecular sexing method in the lab. For cases with mismatch between field and molecular sex we set the sex to undetermined. 


```r
sampleID_sex <- read.csv("vignettes/data/samples_sex.csv", header = TRUE, sep = ";", as.is = TRUE)
str(sampleID_sex)
#> 'data.frame':	133 obs. of  2 variables:
#>  $ ID : chr  "A1295" "A1296" "A1297" "A1298" ...
#>  $ sex: chr  "m" "f" "m" "m" ...
```

merge group and sex information


```r

sample_info <- full_join(sampleID_group, sampleID_sex, by = "ID")
str(sample_info)
#> 'data.frame':	133 obs. of  3 variables:
#>  $ Group_ID: chr  "wing_tags" "wing_tags" "wing_tags" "wing_tags" ...
#>  $ ID      : chr  "A1295" "A1296" "A1297" "A1298" ...
#>  $ sex     : chr  "m" "f" "m" "m" ...
```



## Data processing

### Sequencing data

First, we load an overview of the analysed sequencing libraries. They are stored in the folder `pipeline` as *file_list.tsv*. 


```r
seqlib_overview <- read.delim("vignettes/data/pipeline/file_list.tsv", header = TRUE,  as.is = TRUE)
str(seqlib_overview)
#> 'data.frame':	238 obs. of  6 variables:
#>  $ file_name: chr  "mpg_L16936-1_W1350_S1_R1_001.fastq.gz" "mpg_L16936-1_W1350_S1_R2_001.fastq.gz" "mpg_L16926-1_W1398_S2_R1_001.fastq.gz" "mpg_L16926-1_W1398_S2_R2_001.fastq.gz" ...
#>  $ RGID     : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ RGLB     : chr  "lib1" "lib1" "lib1" "lib1" ...
#>  $ RGPL     : chr  "ILLUMINA" "ILLUMINA" "ILLUMINA" "ILLUMINA" ...
#>  $ RGPU     : chr  "unit1" "unit1" "unit1" "unit1" ...
#>  $ RGSM     : chr  "RGID1_S1" "RGID1_S1" "RGID1_S2" "RGID1_S2" ...
```

The information about the sampled individual, which we will later need to assign the relatedness estimation to specific individuals, is available in the *file_name* column. We will extract this information and put it in an extra *ID* column.


```r
#first need to create a new column that includes the sample ID
seqlib_overview$ID <- gsub("([[:alnum:]]{3}_[[:alnum:]]{6}-[[:digit:]])_([[:alnum:]]{5,7})_([[:alnum:]]{2,3}_[[:alnum:]]{2}_[[:graph:]]{12})", "\\2", seqlib_overview$file_name)

str(seqlib_overview)
#> 'data.frame':	238 obs. of  7 variables:
#>  $ file_name: chr  "mpg_L16936-1_W1350_S1_R1_001.fastq.gz" "mpg_L16936-1_W1350_S1_R2_001.fastq.gz" "mpg_L16926-1_W1398_S2_R1_001.fastq.gz" "mpg_L16926-1_W1398_S2_R2_001.fastq.gz" ...
#>  $ RGID     : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ RGLB     : chr  "lib1" "lib1" "lib1" "lib1" ...
#>  $ RGPL     : chr  "ILLUMINA" "ILLUMINA" "ILLUMINA" "ILLUMINA" ...
#>  $ RGPU     : chr  "unit1" "unit1" "unit1" "unit1" ...
#>  $ RGSM     : chr  "RGID1_S1" "RGID1_S1" "RGID1_S2" "RGID1_S2" ...
#>  $ ID       : chr  "W1350" "W1350" "W1398" "W1398" ...
```


Next, we evaluate the quality of the data and the different sequencing approaches.
An overview of the data as output from the Nextflow pipeline as of 29th July 2021 is stored in *preprocessing_overview.tsv*


```r
data_overview <- read.delim("vignettes/data/pipeline/preprocessing_overview.tsv", as.is = TRUE)
str(data_overview)
#> 'data.frame':	119 obs. of  31 variables:
#>  $ RGSM                                     : chr  "RGID1_S1" "RGID1_S2" "RGID1_S3" "RGID1_S4" ...
#>  $ RGID                                     : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ RGLB                                     : chr  "lib1" "lib1" "lib1" "lib1" ...
#>  $ RGPL                                     : chr  "ILLUMINA" "ILLUMINA" "ILLUMINA" "ILLUMINA" ...
#>  $ RGPU                                     : chr  "unit1" "unit1" "unit1" "unit1" ...
#>  $ filename_one                             : chr  "mpg_L16936-1_W1350_S1_R1_001.fastq.gz" "mpg_L16926-1_W1398_S2_R1_001.fastq.gz" "mpg_L16927-1_W1429_S3_R1_001.fastq.gz" "mpg_L16928-1_W1502_S4_R1_001.fastq.gz" ...
#>  $ filename_two                             : chr  "mpg_L16936-1_W1350_S1_R2_001.fastq.gz" "mpg_L16926-1_W1398_S2_R2_001.fastq.gz" "mpg_L16927-1_W1429_S3_R2_001.fastq.gz" "mpg_L16928-1_W1502_S4_R2_001.fastq.gz" ...
#>  $ reads_pre_trim_one                       : int  3844063 3360132 3034920 6695288 6040662 2842383 3879834 6087445 5686616 4107154 ...
#>  $ reads_pre_trim_two                       : int  3844063 3360132 3034920 6695288 6040662 2842383 3879834 6087445 5686616 4107154 ...
#>  $ reads_pre_trim_total                     : int  7688126 6720264 6069840 13390576 12081324 5684766 7759668 12174890 11373232 8214308 ...
#>  $ reads_post_trim_one                      : int  3334957 3057420 2775271 6144973 5496263 2618095 3544978 5592586 5206646 3740830 ...
#>  $ reads_post_trim_two                      : int  3317567 2622060 2444309 5472149 4763684 2298940 2933104 4916336 4551423 3252219 ...
#>  $ reads_post_trim_total                    : int  6652524 5679480 5219580 11617122 10259947 4917035 6478082 10508922 9758069 6993049 ...
#>  $ reads_trimmed_lost_one                   : int  509106 302712 259649 550315 544399 224288 334856 494859 479970 366324 ...
#>  $ reads_trimmed_lost_two                   : int  526496 738072 590611 1223139 1276978 543443 946730 1171109 1135193 854935 ...
#>  $ reads_trimmed_lost_total                 : int  1035602 1040784 850260 1773454 1821377 767731 1281586 1665968 1615163 1221259 ...
#>  $ reads_trimmed_lost_total_percent         : num  0.135 0.155 0.14 0.132 0.151 ...
#>  $ reads_mapped                             : int  6448222 5897151 5344556 11948516 10542799 5052562 6862719 10880329 10069374 7213292 ...
#>  $ reads_mapped_and_paired                  : int  6124942 4910684 4546908 10259622 8836944 4295176 5524338 9244878 8510126 6063336 ...
#>  $ reads_unmapped                           : int  158628 176787 170192 251546 386867 143020 186719 234815 276382 223486 ...
#>  $ reads_mapped_percent                     : num  0.975 0.97 0.968 0.979 0.963 ...
#>  $ average_coverage                         : num  1.6 1.63 1.58 2.16 2.07 ...
#>  $ average_coverarge_stdev                  : num  2.67 2.8 2.62 2.98 3.64 ...
#>  $ unpaired_reads_examined_for_deduplication: int  323280 986467 797648 1688894 1705855 757386 1338381 1635451 1559248 1149956 ...
#>  $ paired_reads_examined_for_deduplication  : int  3094003 2475793 2291351 5174753 4449902 2167892 2782428 4657453 4288831 3054109 ...
#>  $ unpaired_read_duplicated                 : int  66109 106320 78976 195164 185282 87774 136509 172933 169988 118239 ...
#>  $ paired_read_duplicates                   : int  221442 119369 103005 260460 197926 115543 120104 206962 194659 133521 ...
#>  $ percent_duplication                      : num  0.0782 0.0581 0.053 0.0595 0.0548 ...
#>  $ sequenced_library_complexity             : int  6090385 5720981 5222642 11474365 10330774 4870312 6664743 10519461 9774928 7042018 ...
#>  $ estimated_library_complexity             : int  23660823 29649178 29602264 59328308 57146455 23492191 37280729 60581428 54839066 40354282 ...
#>  $ percent_library_sequenced                : num  0.257 0.193 0.176 0.193 0.181 ...
```


```r
#create new column that specifies if sequencing results are from original run or from resequencing
data_overview <- data_overview %>%
  mutate(original_reseq = case_when(RGID == "1" ~ "original",
                                RGID == "2" ~ "reseq"))
```




```r
#first need to create a new column that includes the sample ID
data_overview$ID <- gsub("([[:alnum:]]{3}_[[:alnum:]]{6}-[[:digit:]])_([[:alnum:]]{5,7})_([[:alnum:]]{2,3}_[[:alnum:]]{2}_[[:graph:]]{12})", "\\2", data_overview$filename_one)

str(data_overview)
#> 'data.frame':	119 obs. of  33 variables:
#>  $ RGSM                                     : chr  "RGID1_S1" "RGID1_S2" "RGID1_S3" "RGID1_S4" ...
#>  $ RGID                                     : int  1 1 1 1 1 1 1 1 1 1 ...
#>  $ RGLB                                     : chr  "lib1" "lib1" "lib1" "lib1" ...
#>  $ RGPL                                     : chr  "ILLUMINA" "ILLUMINA" "ILLUMINA" "ILLUMINA" ...
#>  $ RGPU                                     : chr  "unit1" "unit1" "unit1" "unit1" ...
#>  $ filename_one                             : chr  "mpg_L16936-1_W1350_S1_R1_001.fastq.gz" "mpg_L16926-1_W1398_S2_R1_001.fastq.gz" "mpg_L16927-1_W1429_S3_R1_001.fastq.gz" "mpg_L16928-1_W1502_S4_R1_001.fastq.gz" ...
#>  $ filename_two                             : chr  "mpg_L16936-1_W1350_S1_R2_001.fastq.gz" "mpg_L16926-1_W1398_S2_R2_001.fastq.gz" "mpg_L16927-1_W1429_S3_R2_001.fastq.gz" "mpg_L16928-1_W1502_S4_R2_001.fastq.gz" ...
#>  $ reads_pre_trim_one                       : int  3844063 3360132 3034920 6695288 6040662 2842383 3879834 6087445 5686616 4107154 ...
#>  $ reads_pre_trim_two                       : int  3844063 3360132 3034920 6695288 6040662 2842383 3879834 6087445 5686616 4107154 ...
#>  $ reads_pre_trim_total                     : int  7688126 6720264 6069840 13390576 12081324 5684766 7759668 12174890 11373232 8214308 ...
#>  $ reads_post_trim_one                      : int  3334957 3057420 2775271 6144973 5496263 2618095 3544978 5592586 5206646 3740830 ...
#>  $ reads_post_trim_two                      : int  3317567 2622060 2444309 5472149 4763684 2298940 2933104 4916336 4551423 3252219 ...
#>  $ reads_post_trim_total                    : int  6652524 5679480 5219580 11617122 10259947 4917035 6478082 10508922 9758069 6993049 ...
#>  $ reads_trimmed_lost_one                   : int  509106 302712 259649 550315 544399 224288 334856 494859 479970 366324 ...
#>  $ reads_trimmed_lost_two                   : int  526496 738072 590611 1223139 1276978 543443 946730 1171109 1135193 854935 ...
#>  $ reads_trimmed_lost_total                 : int  1035602 1040784 850260 1773454 1821377 767731 1281586 1665968 1615163 1221259 ...
#>  $ reads_trimmed_lost_total_percent         : num  0.135 0.155 0.14 0.132 0.151 ...
#>  $ reads_mapped                             : int  6448222 5897151 5344556 11948516 10542799 5052562 6862719 10880329 10069374 7213292 ...
#>  $ reads_mapped_and_paired                  : int  6124942 4910684 4546908 10259622 8836944 4295176 5524338 9244878 8510126 6063336 ...
#>  $ reads_unmapped                           : int  158628 176787 170192 251546 386867 143020 186719 234815 276382 223486 ...
#>  $ reads_mapped_percent                     : num  0.975 0.97 0.968 0.979 0.963 ...
#>  $ average_coverage                         : num  1.6 1.63 1.58 2.16 2.07 ...
#>  $ average_coverarge_stdev                  : num  2.67 2.8 2.62 2.98 3.64 ...
#>  $ unpaired_reads_examined_for_deduplication: int  323280 986467 797648 1688894 1705855 757386 1338381 1635451 1559248 1149956 ...
#>  $ paired_reads_examined_for_deduplication  : int  3094003 2475793 2291351 5174753 4449902 2167892 2782428 4657453 4288831 3054109 ...
#>  $ unpaired_read_duplicated                 : int  66109 106320 78976 195164 185282 87774 136509 172933 169988 118239 ...
#>  $ paired_read_duplicates                   : int  221442 119369 103005 260460 197926 115543 120104 206962 194659 133521 ...
#>  $ percent_duplication                      : num  0.0782 0.0581 0.053 0.0595 0.0548 ...
#>  $ sequenced_library_complexity             : int  6090385 5720981 5222642 11474365 10330774 4870312 6664743 10519461 9774928 7042018 ...
#>  $ estimated_library_complexity             : int  23660823 29649178 29602264 59328308 57146455 23492191 37280729 60581428 54839066 40354282 ...
#>  $ percent_library_sequenced                : num  0.257 0.193 0.176 0.193 0.181 ...
#>  $ original_reseq                           : chr  "original" "original" "original" "original" ...
#>  $ ID                                       : chr  "W1350" "W1398" "W1429" "W1502" ...
```

save data overview

```r
save(data_overview, file = "data_overview.RData")
```

Calculate total and mean number of raw reads
!!paired-end sequencing, so need to account for that

```r

total_raw_reads <- sum(data_overview$reads_pre_trim_total)
total_raw_reads
#> [1] 1393934732

mean_raw_reads <- mean(data_overview$reads_pre_trim_total)
mean_raw_reads
#> [1] 11713737

sd_raw_reads <- sd(data_overview$reads_pre_trim_total)
sd_raw_reads
#> [1] 5979400
```

Calculate total and mean number of quality filtered reads


```r

total_filtered_reads <- sum(data_overview$reads_post_trim_total)
total_filtered_reads
#> [1] 1218247416

percent_filtered_reads <- total_filtered_reads/total_raw_reads  
percent_filtered_reads
#> [1] 0.873963

mean_filtered_reads <- mean(data_overview$reads_post_trim_total)
mean_filtered_reads
#> [1] 10237373

percent_mean_filtered_reads <- mean_filtered_reads/mean_raw_reads
percent_mean_filtered_reads
#> [1] 0.873963

sd_filtered_reads <- sd(data_overview$reads_post_trim_total)
sd_filtered_reads
#> [1] 5426886


median_Trimmomatic_dropped <- median(data_overview$reads_trimmed_lost_total, na.rm = TRUE)
median_Trimmomatic_dropped
#> [1] 1310301

IQR_Trimmomatic_dropped <- IQR(data_overview$reads_trimmed_lost_total, na.rm = TRUE)
IQR_Trimmomatic_dropped
#> [1] 749127

range_Trimmomatic_dropped <- range(data_overview$reads_trimmed_lost_total, na.rm = TRUE)
range_Trimmomatic_dropped
#> [1]  323232 4158669
```

Calculate mapped reads

```r
median_mapped_reads <- median(data_overview$reads_mapped)
median_mapped_reads
#> [1] 9498515

IQR_mapped_reads <- IQR(data_overview$reads_mapped)
IQR_mapped_reads
#> [1] 6902176

range_mapped_reads <- range(data_overview$reads_mapped)
range_mapped_reads
#> [1]  1843218 32346499
```

Calculate duplicates

```r
median_duplicates <- median(data_overview$percent_duplication)
median_duplicates
#> [1] 0.056526

range_duplicates <- range(data_overview$percent_duplication)
range_duplicates
#> [1] 0.039762 0.100763
```


Calculate final coverage

```r
median_final_coverage <- median(data_overview$average_coverage)
median_final_coverage
#> [1] 1.91596

IQR_final_coverage <- IQR(data_overview$average_coverage)
IQR_final_coverage
#> [1] 0.601805

range_final_coverage <- range(data_overview$average_coverage)
range_final_coverage
#> [1] 1.33748 4.31431
```


For the sequencing success, we compare the reads that passed Quality control (FastCQ and Trimmotaic) depending on original run (RGID = 1) and resequencing (RGID = 2).

```r
theme_set(theme_bw()) #set theme to black and white

#compare reads (y-axis) between original vs. resequenced (x-axis, sorted to have original first) and color according to library prep (shotgun vs. capture)
ggplot(data_overview, aes(x = factor(RGID, level = c("1", "2")), y = reads_post_trim_total, color = original_reseq, shape = original_reseq)) + 
  
   scale_color_viridis_d(end = 0.5) +

  geom_point(size = 2, alpha = 0.6, aes(group = ID), position = position_dodge(0.5)) + #make points, transparent, and group samples
  
  geom_boxplot(alpha = 0.4, outlier.shape = NA) + #add boxplots but do not show them in legend
  
  #geom_violin(alpha = 0.5) + #or add violin plots
  
  
  geom_line(aes(group = ID), color = "grey", position = position_dodge(0.5), show.legend = FALSE) + #add line to connect samples present in both sequencing runs
  
  #stat_summary(fun = median, geom = "point", size = 5, alpha = 0.3, position = position_dodge(0.5)) +
  
  labs(x = "sequencing run", y = "reads after quality filtering") + #adjust axis labels
  
 
  theme(legend.title = element_blank()) + #remove legend title
  
  theme(panel.grid.major.x = element_blank())  #remove x-axis grid lines
```

<img src="2_data_files/figure-html/figure compare amount of reads per sequencing strategy-1.png" width="672" />



Maybe more informative about the success of the approaches is to compare % reads that mapped.


```r
theme_set(theme_bw()) #set theme to black and white

#compare mapped reads (y-axis) between sequencing (x-axis, sorted to have original first) and color according to sequencing run
ggplot(data_overview, aes(x = factor(RGID, level = c("1", "2")), y = reads_mapped_and_paired, color = original_reseq, shape = original_reseq)) + 
  
  scale_color_viridis_d(end = 0.5) +

  geom_point(size = 2, alpha = 0.6, aes(group = ID), position = position_dodge(0.5)) + #make points, transparent, and group samples
  
  geom_boxplot(alpha = 0.4, outlier.shape = NA) + #add boxplots but do not show them in legend
  
  #geom_violin(alpha = 0.5) + #or add violin plots
  
  
  geom_line(aes(group = ID), color = "grey", position = position_dodge(0.5), show.legend = FALSE) + #add line to connect samples present in both sequencing approaches
  
  #stat_summary(fun = median, geom = "point", size = 5, alpha = 0.3, position = position_dodge(0.5)) +
  
  labs(x = "sequencing run", y = "mapped reads") + #adjust axis labels
  
 
  theme(legend.title = element_blank()) + #remove legend title
  
  theme(panel.grid.major.x = element_blank())  #remove x-axis grid lines
```

<img src="2_data_files/figure-html/figure mapped reads per sequencing strategy-1.png" width="672" />



Finally, let's have a look at the coverage


```r

theme_set(theme_bw()) #set theme to black and white

#relate number of reads (y-axis) to final coverage (x-axis), color according to sequencing run (original vs. resequenced) and sample type, shape according to original run or resequencing
ggplot(data_overview, aes(x = average_coverage, y = reads_post_trim_total, color = original_reseq, shape = original_reseq)) +
  
  scale_color_viridis_d(end = 0.5) +
  
  geom_line(aes(group = ID), color = "lightgrey", show.legend = FALSE) + #connect same samples
  
  geom_point(alpha = 0.5, aes(size = reads_mapped_and_paired, group = ID)) + #add points with slight transparency
  
  geom_vline(xintercept = 1, linetype = "dashed") + #include vertical line to show coverage cutoff
  
    #scale_y_log10(breaks = scales::trans_breaks("log10", function(x) 10^x), labels = scales::trans_format("log10", scales::math_format(10^.x))) + #make y-axis logarithmic
  
  #scale_x_log10() + #make x-axis logarithmic
  
  #annotation_logticks() +
  
  labs(x = "coverage", y = "reads (after quality filtering)", 
       size = "% reads mapped", color ="", shape = "") 
```

<img src="2_data_files/figure-html/figure number of reads and final coverage-1.png" width="672" />


C-Curve


```r
theme_set(theme_bw()) #set theme to black and white

#relate number of distinct reads (y-axis) to total reads (x-axis), color and shape according to original run or resequencing
ggplot(data_overview, aes(x = unpaired_reads_examined_for_deduplication, y = sequenced_library_complexity, color = original_reseq, shape = original_reseq)) +
  
  geom_line(aes(group = ID), color = "lightgrey", show.legend = FALSE) + #connect same samples
  
  geom_point(alpha = 0.5, aes(size = average_coverage, group = ID)) + #add points with slight transparency
  
  theme(panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) + #remove x/y-axis grid lines
  
  labs(x = "total unpaired reads", y = "sequenced library complexity", 
       size = "coverage", color ="", shape = "") + #adjust axis and legend labels
  
   scale_color_viridis_d(end = 0.5)
```

<img src="2_data_files/figure-html/figure c-curve-1.png" width="672" />

comparison to total surviving reads from Trimmomatic to distinct mapped reads


```r
theme_set(theme_bw()) #set theme to black and white

#relate number of distinct reads (y-axis) to total surviving reads (x-axis), color  and sample type, shape according to original run or resequencing
ggplot(data_overview, aes(x =  reads_post_trim_total, y = sequenced_library_complexity, color = original_reseq, shape = original_reseq)) +
  
  scale_color_viridis_d(end = 0.5) +
  
  geom_point(alpha = 0.5, aes(size = average_coverage, group = ID)) + #add points with slight transparency
  
  theme(panel.grid.minor.x = element_blank(), panel.grid.minor.y = element_blank()) + #remove x/y-axis grid lines
  
  labs(x = "total surviving reads (Trimmomatic)", y = "sequenced library complexity", 
       size = "coverage", color ="", shape = "")  #adjust axis and legend labels
```

<img src="2_data_files/figure-html/figure total surving reads to distinct mapped reads-1.png" width="672" />


plot  coverage and st.dv.


```r
theme_set(theme_bw()) #set theme to black and white

#plot coverage (y-axis) including st.dev for every sample (x-axis), color according to original run or resequencing
ggplot(filter(data_overview, original_reseq == "original"), aes(x = reorder(ID, average_coverage), y = average_coverage, color = original_reseq, shape = original_reseq)) +
  
  scale_color_viridis_d(end = 0.5) +
  
  geom_point(aes(y=average_coverage), alpha = 0.8) +
  
  geom_point(data = filter(data_overview, original_reseq == "reseq"), aes(y=average_coverage), alpha = 0.8) +
  
  geom_errorbar(data = filter(data_overview, original_reseq == "reseq"), aes(ymin = average_coverage - average_coverarge_stdev, ymax = average_coverage + average_coverarge_stdev), alpha = 0.8) +
  
  geom_errorbar(aes(ymin = average_coverage - average_coverarge_stdev, ymax = average_coverage + average_coverarge_stdev), alpha = 0.8) +
  
  geom_hline(yintercept = 1, linetype = "dashed") + #include horizontal line to show coverage cutoff at 1X
  
  geom_hline(yintercept = median_final_coverage, linetype = "dotted") +
  
  coord_cartesian(ylim = c(0, 10)) + #adjust y axis
  
  scale_y_continuous(breaks = c(0, 2, 4, 6, 8, 10)) + 
  
  labs(x = "sample", y = "coverage (mean+-sd)", 
       color ="", shape = "") + #adjust axis and legend labels
  
  theme(axis.text.x = element_text(angle = 50, vjust = 1, hjust = 1, size = 8)) +
  
  scale_x_discrete(guide = guide_axis(n.dodge=2))  #avoid overlap of x-axis labels
```

<img src="2_data_files/figure-html/mt coverage-1.png" width="672" />

### Relatedness data


#### ngsRelate
This is an assessment of the ngsRelate results produced by the Nextflow pipleine created by Ben Hume/SeqAna. The data is saved in the folder `pipeline` in `ngsrelate` as *relatedness.isec.0002.exMito.thinned.ngsrelate.w.sample.names.results*.


```r
ngsRelate_results <- read.delim("vignettes/data/pipeline/ngsrelate/relatedness.isec.0002.exMito.thinned.ngsrelate.w.sample.names.results", header = TRUE,  as.is = TRUE)
str(ngsRelate_results)
#> 'data.frame':	7021 obs. of  35 variables:
#>  $ a                     : int  0 0 0 0 0 0 0 0 0 0 ...
#>  $ b                     : int  1 2 3 4 5 6 7 8 9 10 ...
#>  $ ida                   : chr  "RGID1_S35" "RGID1_S35" "RGID1_S35" "RGID1_S35" ...
#>  $ idb                   : chr  "RGID1_S83" "RGID1_S82" "RGID1_S29" "RGID1_S67" ...
#>  $ nSites                : int  233689 234757 221081 143705 199687 175701 234355 233089 217726 201737 ...
#>  $ J9                    : num  0.659 0.753 0.718 0.479 0.793 ...
#>  $ J8                    : num  2.5e-05 0.0 0.0 0.0 0.0 0.0 1.0e-06 0.0 2.0e-06 0.0 ...
#>  $ J7                    : num  0.0895 0.0167 0.0695 0.1231 0.0374 ...
#>  $ J6                    : num  0 0 0 0.301 0 ...
#>  $ J5                    : num  0e+00 0e+00 0e+00 0e+00 0e+00 5e-06 0e+00 0e+00 2e-06 0e+00 ...
#>  $ J4                    : num  0.2516 0.2305 0.1958 0 0.0152 ...
#>  $ J3                    : num  3e-05 0e+00 0e+00 0e+00 0e+00 0e+00 1e-06 0e+00 0e+00 0e+00 ...
#>  $ J2                    : num  0 0 0.0163 0.0972 0.1542 ...
#>  $ J1                    : num  0 0 0 0 0 0 0 0 0 0 ...
#>  $ rab                   : num  0.0896 0.0167 0.0695 0.1231 0.0374 ...
#>  $ Fa                    : num  0.2516 0.2305 0.212 0.0972 0.1694 ...
#>  $ Fb                    : num  0 0 0.0163 0.3984 0.1542 ...
#>  $ theta                 : num  0.04479 0.00836 0.03476 0.06153 0.01871 ...
#>  $ inbred_relatedness_1_2: num  1.5e-05 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 0.0 ...
#>  $ inbred_relatedness_2_1: num  0e+00 0e+00 0e+00 0e+00 0e+00 3e-06 0e+00 0e+00 1e-06 0e+00 ...
#>  $ fraternity            : num  0.0895 0.0167 0.0858 0.2202 0.1917 ...
#>  $ identity              : num  0 0 0 0 0 0 0 0 0 0 ...
#>  $ zygosity              : num  0.0895 0.0167 0.0858 0.2203 0.1917 ...
#>  $ X2of3_IDB             : num  0.215 0.132 0.184 0.371 0.199 ...
#>  $ F_diff_a_b            : num  0.1258 0.1152 0.0979 -0.1506 0.0076 ...
#>  $ loglh                 : num  -365521 -363424 -356154 -230552 -323300 ...
#>  $ nIter                 : int  98 70 50 49 106 126 58 106 46 74 ...
#>  $ bestoptimll           : int  -1 -1 -1 -1 -1 -1 -1 -1 -1 -1 ...
#>  $ coverage              : num  0.769 0.773 0.728 0.473 0.657 ...
#>  $ X2dsfs                : chr  "3.039179e-01,2.036214e-01,2.094838e-02,6.661272e-02,1.854916e-01,1.848313e-02,3.551968e-02,1.058010e-01,5.960424e-02" "2.875679e-01,2.230266e-01,1.833730e-02,7.125856e-02,1.806006e-01,1.774522e-02,3.736186e-02,1.129873e-01,5.111459e-02" "3.254700e-01,1.557393e-01,4.307152e-02,8.846841e-02,1.586388e-01,3.064090e-02,5.576987e-02,7.216507e-02,7.003613e-02" "3.661364e-01,5.993366e-02,6.546616e-02,1.391685e-01,1.241034e-01,7.057984e-02,5.589929e-02,2.297616e-02,9.573670e-02" ...
#>  $ R0                    : num  0.304 0.308 0.623 0.978 0.806 ...
#>  $ R1                    : num  0.411 0.376 0.356 0.3 0.336 ...
#>  $ KING                  : num  0.0948 0.088 -0.0588 -0.2193 -0.147 ...
#>  $ X2dsfs_loglike        : num  -436960 -438618 -430614 -275453 -390905 ...
#>  $ X2dsfsf_niter         : int  10 10 10 10 10 10 10 10 10 10 ...
```

Relatedness was estimated on an average of 2.4247297\times 10^{5} sites and a mean coverage of 0.7979156. On average, relatedness is 0.0815924 with a range of 2\times 10^{-6}, 0.294369.

We join together the relatedness estimates with the sample information, to know the identity of the dyads


```r
#rename "ida" and "idb" to "RGSM_a" and "RGSM-b"
ngsRelate_results <- rename(ngsRelate_results, "RGSM_a" = "ida")
ngsRelate_results <- rename(ngsRelate_results, "RGSM_b" = "idb")

#create a new column that includes RGSM_dyad
ngsRelate_results$RGSM_dyad <- if_else(ngsRelate_results$RGSM_a < ngsRelate_results$RGSM_b, paste(ngsRelate_results$RGSM_a, ngsRelate_results$RGSM_b, sep = "-"), paste(ngsRelate_results$RGSM_b, ngsRelate_results$RGSM_a, sep = "-"))

#first include ID of individual a
ngsRelate_results_ID <- left_join(ngsRelate_results, seqlib_overview[6:7], by = c("RGSM_a" = "RGSM"))

#rename "ID" to "ID_a"
ngsRelate_results_ID <- rename(ngsRelate_results_ID, "ID_a" = "ID")

#now include ID of individual b
ngsRelate_results_ID <- left_join(ngsRelate_results_ID, seqlib_overview[6:7], by = c("RGSM_b" = "RGSM"))

#rename "ID" to "ID_b"
ngsRelate_results_ID <- rename(ngsRelate_results_ID, "ID_b" = "ID")

#create a new column that includes the dyad
ngsRelate_results_ID$dyad <- if_else(ngsRelate_results_ID$ID_a < ngsRelate_results_ID$ID_b, paste(ngsRelate_results_ID$ID_a, ngsRelate_results_ID$ID_b, sep = "-"), paste(ngsRelate_results_ID$ID_b, ngsRelate_results_ID$ID_a, sep = "-"))

#remove duplicates ##maybe not necessary anymore

ngsRelate_results_ID <- distinct(ngsRelate_results_ID)
```

We also include the group information


```r
#first include group of individual a
ngsRelate_results_sample_info <- left_join(ngsRelate_results_ID, sample_info, by = c("ID_a" = "ID"))

#rename "Group_ID" to "a_Group" and "sex" to "a_sex"
ngsRelate_results_sample_info <- rename(ngsRelate_results_sample_info, "a_Group" = "Group_ID")
ngsRelate_results_sample_info <- rename(ngsRelate_results_sample_info, "a_sex" = "sex")

#then include group of individual b
ngsRelate_results_sample_info <- left_join(ngsRelate_results_sample_info, sample_info, by = c("ID_b" = "ID"))

#rename "Group_ID" to "b_Group" and "sex" to "b_sex"
ngsRelate_results_sample_info <- rename(ngsRelate_results_sample_info, "b_Group" = "Group_ID")
ngsRelate_results_sample_info <- rename(ngsRelate_results_sample_info, "b_sex" = "sex")
```


```r
#which group IDs are there?
sort(unique(ngsRelate_results_sample_info$a_Group))
#>  [1] "5509"         "5512"         "5931-5938"    "dump"         "mpala"       
#>  [6] "mpala_chicks" "ROOP"         "RRWB"         "wing_tags"    "wt025"
```



```r
sort(unique(ngsRelate_results_sample_info$b_Group))
#>  [1] "5509"         "5512"         "5931-5938"    "dump"         "mpala"       
#>  [6] "mpala_chicks" "ROOP"         "RRWB"         "wing_tags"    "wt025"
```


```r
#create new column that specifies if individuals are from same or different groups
ngsRelate_results_sample_info <- ngsRelate_results_sample_info %>%
  mutate(dyad_group = case_when(ID_a == ID_b ~ "identical",
                                a_Group == b_Group ~ "intragroup",
                                a_Group != b_Group ~ "intergroup"))

unique(ngsRelate_results_sample_info$dyad_group)
#> [1] "intergroup" "intragroup" "identical"  NA
```


```r
#create new column that specifies if individuals have same or different sex
ngsRelate_results_sample_info <- ngsRelate_results_sample_info %>%
  mutate(dyad_sex = case_when(ID_a == ID_b ~ "identical",
                                a_sex == b_sex ~ "same sex",
                                a_sex != b_sex ~ "male-female")) 

#recode dyads for individuals with undetermined sex to NA
ngsRelate_results_sample_info$dyad_sex[ngsRelate_results_sample_info$a_sex == "u"] <- NA
ngsRelate_results_sample_info$dyad_sex[ngsRelate_results_sample_info$b_sex == "u"] <- NA

#recode same sex dyads to male or female
ngsRelate_results_sample_info$dyad_sex[ngsRelate_results_sample_info$dyad_sex == "same sex" & 
                                         ngsRelate_results_sample_info$a_sex == "f"] <- "female"
ngsRelate_results_sample_info$dyad_sex[ngsRelate_results_sample_info$dyad_sex == "same sex" & 
                                         ngsRelate_results_sample_info$a_sex == "m"] <- "male"


unique(ngsRelate_results_sample_info$dyad_sex)
#> [1] "female"      "male-female" NA            "identical"   "male"
```


Let's have a closer look at the samples that were sequenced twice


```r
#find samples that were sequenced twice
duplicates <- filter(ngsRelate_results_sample_info, ID_a == ID_b)

#average relatedness of these duplicted inidividuals
mean(duplicates$rab)
#> [1] 0.1362405

#range
range(duplicates$rab)
#> [1] 0.109323 0.156439
```


Create subset with at least 250k SNPs


```r
ngsRelate_results_sample_info_250k <- filter(ngsRelate_results_sample_info, nSites >= 250000)

unique(ngsRelate_results_sample_info_250k$dyad_group)
#> [1] "intragroup" "intergroup" NA
```



To get an overview of the distribution of relatedness coefficients, we plot pairwise relatedness for all dyads


```r

theme_set(theme_classic())

#plot relatedness rab (y-axis) for every dyad (x-axis), ordered from low to high relatedness and colored according to inter- or intragroup dyad

ggplot(ngsRelate_results_sample_info_250k, aes(x = reorder(dyad, rab), y = rab, color = dyad_sex, shape = dyad_group)) +
  
  geom_point(alpha = 0.2, aes(y = rab)) + #plot relatedness estimates as points 
  
  geom_hline(yintercept = c(0.125, 0.25, 0.5), linetype = "dashed") + #include horizontal line to show traditional kinship categories
  
  labs( x = "Dyad", y = "Relatedness (ngsRelate)") +
  
  ggtitle("distribution of relatedness (ngsrelate) 250k")
#> Warning: Removed 214 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/figure dyadic relatedness (ngsrelate) distribution-1.png" width="672" />

check correlation between number of SNPs and sex


```r
theme_set(theme_classic())

#plot nSites (y-axis) and for the different categories of sex of dyad (x-axis) colored according to coverage

ggplot(ngsRelate_results_sample_info, aes(x = dyad_sex, y = nSites, color = coverage, shape = dyad_group)) +
  
  geom_point(alpha = 0.2) +
  
  geom_boxplot()
#> Warning: Removed 351 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/figure (ngsrelate) dyad_sex and nSites-1.png" width="672" />

```r

 ggtitle("nsites vs sex")
#> $title
#> [1] "nsites vs sex"
#> 
#> attr(,"class")
#> [1] "labels"
```

Compare relatedness estimates according to group and sex


```r
theme_set(theme_classic())

#plot relatedness rab (y-axis) for the different categories of sex of dyad (x-axis) colored according to group membership

ggplot(ngsRelate_results_sample_info_250k, aes(x = dyad_sex, y = rab, color = dyad_group, shape = dyad_group)) +
  
  geom_point(alpha = 0.2) +
  
  geom_boxplot()
#> Warning: Removed 214 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/figure (ngsrelate) relatedness for group and sex-1.png" width="672" />

```r

 ggtitle("relatedness (ngsrelate) 250k")
#> $title
#> [1] "relatedness (ngsrelate) 250k"
#> 
#> attr(,"class")
#> [1] "labels"
```


#### lcmlkin


```r
lcmlkin_results <- read.delim("vignettes/data/pipeline/lcmlkin/relatedness.isec.0002.exMito.thinned.lcmlkin.results", header = TRUE,  as.is = TRUE)
str(lcmlkin_results)
#> 'data.frame':	7021 obs. of  7 variables:
#>  $ Ind1  : chr  "RGID1_S35" "RGID1_S35" "RGID1_S35" "RGID1_S35" ...
#>  $ Ind2  : chr  "RGID1_S81" "RGID1_S18" "RGID1_S55" "RGID1_S4" ...
#>  $ k0_hat: num  0.775 0.776 0.88 0.856 0.866 0.856 0.863 0.865 0.749 0.859 ...
#>  $ k1_hat: num  0.002 0.003 0.003 0.003 0.003 0.002 0.003 0.003 0.003 0.002 ...
#>  $ k2_hat: num  0.223 0.221 0.118 0.141 0.132 0.142 0.134 0.132 0.248 0.139 ...
#>  $ pi_HAT: num  0.224 0.222 0.119 0.143 0.133 0.143 0.136 0.134 0.25 0.14 ...
#>  $ nbSNP : int  271505 241476 239421 263248 257387 276355 241041 257640 274309 270529 ...
```

We join together the relatedness estimates with the sample information, to know the identity of the dyads


```r
#rename "ida" and "idb" to "RGSM_a" and "RGSM-b"
lcmlkin_results <- rename(lcmlkin_results, "RGSM_a" = "Ind1")
lcmlkin_results <- rename(lcmlkin_results, "RGSM_b" = "Ind2")

#create a new column that includes RGSM_dyad
lcmlkin_results$RGSM_dyad <- if_else(lcmlkin_results$RGSM_a < lcmlkin_results$RGSM_b, paste(lcmlkin_results$RGSM_a, lcmlkin_results$RGSM_b, sep = "-"), paste(lcmlkin_results$RGSM_b, lcmlkin_results$RGSM_a, sep = "-"))

#first include ID of individual a
lcmlkin_results_ID <- left_join(lcmlkin_results, seqlib_overview[6:7], by = c("RGSM_a" = "RGSM"))

#rename "ID" to "ID_a"
lcmlkin_results_ID <- rename(lcmlkin_results_ID, "ID_a" = "ID")

#now include ID of individual b
lcmlkin_results_ID <- left_join(lcmlkin_results_ID, seqlib_overview[6:7], by = c("RGSM_b" = "RGSM"))

#rename "ID" to "ID_b"
lcmlkin_results_ID <- rename(lcmlkin_results_ID, "ID_b" = "ID")

#create a new column that includes the dyad
lcmlkin_results_ID$dyad <- if_else(lcmlkin_results_ID$ID_a < lcmlkin_results_ID$ID_b, paste(lcmlkin_results_ID$ID_a, lcmlkin_results_ID$ID_b, sep = "-"), paste(lcmlkin_results_ID$ID_b, lcmlkin_results_ID$ID_a, sep = "-"))

#remove duplicates ##maybe not necessary anymore

lcmlkin_results_ID <- distinct(lcmlkin_results_ID)
```

We also include the group information


```r
#first include group of individual a
lcmlkin_results_sample_info <- left_join(lcmlkin_results_ID, sample_info, by = c("ID_a" = "ID"))

#rename "Group_ID" to "a_Group"
lcmlkin_results_sample_info <- rename(lcmlkin_results_sample_info, "a_Group" = "Group_ID")
lcmlkin_results_sample_info <- rename(lcmlkin_results_sample_info, "a_sex" = "sex")

#then include group of individual b
lcmlkin_results_sample_info <- left_join(lcmlkin_results_sample_info, sample_info, by = c("ID_b" = "ID"))
lcmlkin_results_sample_info <- rename(lcmlkin_results_sample_info, "b_sex" = "sex")

#rename "Group_ID" to "b_Group"
lcmlkin_results_sample_info <- rename(lcmlkin_results_sample_info, "b_Group" = "Group_ID")
```


```r
#create new column that specifies if individuals are from same or different groups
lcmlkin_results_sample_info <- lcmlkin_results_sample_info %>%
  mutate(dyad_group = if_else(a_Group == b_Group, "intra", "inter"))
str(lcmlkin_results_sample_info)
#> 'data.frame':	7021 obs. of  16 variables:
#>  $ RGSM_a    : chr  "RGID1_S35" "RGID1_S35" "RGID1_S35" "RGID1_S35" ...
#>  $ RGSM_b    : chr  "RGID1_S81" "RGID1_S18" "RGID1_S55" "RGID1_S4" ...
#>  $ k0_hat    : num  0.775 0.776 0.88 0.856 0.866 0.856 0.863 0.865 0.749 0.859 ...
#>  $ k1_hat    : num  0.002 0.003 0.003 0.003 0.003 0.002 0.003 0.003 0.003 0.002 ...
#>  $ k2_hat    : num  0.223 0.221 0.118 0.141 0.132 0.142 0.134 0.132 0.248 0.139 ...
#>  $ pi_HAT    : num  0.224 0.222 0.119 0.143 0.133 0.143 0.136 0.134 0.25 0.14 ...
#>  $ nbSNP     : int  271505 241476 239421 263248 257387 276355 241041 257640 274309 270529 ...
#>  $ RGSM_dyad : chr  "RGID1_S35-RGID1_S81" "RGID1_S18-RGID1_S35" "RGID1_S35-RGID1_S55" "RGID1_S35-RGID1_S4" ...
#>  $ ID_a      : chr  "W1673" "W1673" "W1673" "W1673" ...
#>  $ ID_b      : chr  "WT00203" "W1376" "A1316" "W1502" ...
#>  $ dyad      : chr  "W1673-WT00203" "W1376-W1673" "A1316-W1673" "W1502-W1673" ...
#>  $ a_Group   : chr  "wt025" "wt025" "wt025" "wt025" ...
#>  $ a_sex     : chr  "f" "f" "f" "f" ...
#>  $ b_Group   : chr  "mpala_chicks" "dump" "wing_tags" "RRWB" ...
#>  $ b_sex     : chr  "f" "f" "m" "m" ...
#>  $ dyad_group: chr  "inter" "inter" "inter" "inter" ...
```


```r
#create new column that specifies if individuals have same or different sex
lcmlkin_results_sample_info <- lcmlkin_results_sample_info %>%
  mutate(dyad_sex = case_when(ID_a == ID_b ~ "identical",
                                a_sex == b_sex ~ "same sex",
                                a_sex != b_sex ~ "male-female")) 

#recode dyads for individuals with undetermined sex to NA
lcmlkin_results_sample_info$dyad_sex[lcmlkin_results_sample_info$a_sex == "u"] <- NA
lcmlkin_results_sample_info$dyad_sex[lcmlkin_results_sample_info$b_sex == "u"] <- NA

#recode same sex dyads to male or female
lcmlkin_results_sample_info$dyad_sex[lcmlkin_results_sample_info$dyad_sex == "same sex" & 
                                         lcmlkin_results_sample_info$a_sex == "f"] <- "female"
lcmlkin_results_sample_info$dyad_sex[lcmlkin_results_sample_info$dyad_sex == "same sex" & 
                                         lcmlkin_results_sample_info$a_sex == "m"] <- "male"


unique(lcmlkin_results_sample_info$dyad_sex)
#> [1] "female"      "male-female" NA            "identical"   "male"
```


Let's have a closer look at the samples that were sequenced twice


```r
#find samples that were sequenced twice
duplicates_lcmlkin <- filter(lcmlkin_results_sample_info, ID_a == ID_b)

#average relatedness of these duplicted inidividuals
mean(duplicates_lcmlkin$pi_HAT)
#> [1] 0.296087

#range
range(duplicates_lcmlkin$pi_HAT)
#> [1] 0.230 0.328
```


Create subset with at least 300k SNPs


```r
lcmlkin_results_sample_info_300k <- filter(lcmlkin_results_sample_info, nbSNP >= 300000)
```


```r

theme_set(theme_classic())

#plot relatedness pi_HAT (y-axis) for every dyad (x-axis), ordered from low to high relatedness and colored according to inter- or intragroup dyad

ggplot(lcmlkin_results_sample_info_300k, aes(x = reorder(dyad, pi_HAT), y = pi_HAT, color = dyad_sex, shape = dyad_group)) +
  
  geom_point(alpha = 0.1, aes(y = pi_HAT)) + #plot relatedness estimates as points 
  
  geom_hline(yintercept = c(0.125, 0.25, 0.5), linetype = "dashed") + #include horizontal line to show traditional kinship categories
  
  labs( x = "Dyad", y = "Relatedness (lcmlkin)") +

 ggtitle("distribution of relatedness (lcmlkin) 300k SNPs")
#> Warning: Removed 177 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/figure dyadic relatedness (lcmlkin) distribution-1.png" width="672" />


```r

theme_set(theme_classic())

#plot relatedness pi_HAT (y-axis) and corresponding k0 (x-axis) colored according to nbSNP

ggplot(lcmlkin_results_sample_info, aes(x = k0_hat, y = pi_HAT, color = nbSNP, shape = dyad_group)) +
  
  geom_point(alpha = 0.2) +

 ggtitle("lcmlkin k0 vs phi")
#> Warning: Removed 351 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/figure dyadic relatedness (lcmlkin) distribution and k0-1.png" width="672" />

check correlation between number of SNPs and sex


```r
theme_set(theme_classic())

#plot nbSNPs (y-axis) and for the different categories of sex of dyad (x-axis) colored according to dyad_group

ggplot(lcmlkin_results_sample_info, aes(x = dyad_sex, y = nbSNP, color = dyad_group, shape = dyad_group)) +
  
  geom_point(alpha = 0.2) +
  
  geom_boxplot()
#> Warning: Removed 351 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/figure (lcmlkin) dyad_sex and nbSNP-1.png" width="672" />

```r

 ggtitle("nbSNP vs sex of dyad")
#> $title
#> [1] "nbSNP vs sex of dyad"
#> 
#> attr(,"class")
#> [1] "labels"
```


```r
theme_set(theme_classic())

#plot relatedness pi_HAT (y-axis) for the different categories of sex of dyad (x-axis) colored according to group membership

ggplot(lcmlkin_results_sample_info_300k, aes(x = dyad_group, y = pi_HAT, color = dyad_sex)) +
  
  geom_point(alpha = 0.2) +
  
  geom_boxplot()
```

<img src="2_data_files/figure-html/figure (lcmlkin relatedness for group and sex-1.png" width="672" />

```r

 ggtitle("relatedness (lcmlkin) 300k")
#> $title
#> [1] "relatedness (lcmlkin) 300k"
#> 
#> attr(,"class")
#> [1] "labels"
```

#### READ

This is an assessment of the READ results produced by the Nextflow pipleine created by Ben Hume/SeqAna. The data is saved in the folder `pipeline` in `read` as *meansP0_AncientDNA_normalized*. The preprocessed data (categorizes unrelated, first- and second-order related) is sotred as *READ_results*.



```r
READ_rawresults <- read.delim("vignettes/data/pipeline/read/meansP0_AncientDNA_normalized", header = TRUE, sep = " ", as.is = TRUE)
str(READ_rawresults)
#> 'data.frame':	7021 obs. of  5 variables:
#>  $ PairIndividuals            : chr  "RGID1_S10RGID1_S11" "RGID1_S10RGID1_S19" "RGID1_S10RGID1_S23" "RGID1_S10RGID1_S26" ...
#>  $ Normalized2AlleleDifference: num  0.975 0.922 0.962 0.994 0.931 ...
#>  $ StandardError              : num  0.00922 0.01094 0.012 0.01045 0.00995 ...
#>  $ NonNormalizedP0            : num  0.338 0.32 0.334 0.345 0.323 ...
#>  $ NonNormalizedStandardError : num  0.0032 0.00379 0.00416 0.00363 0.00345 ...
```


```r
READ_kinresults <- read.delim("vignettes/data/pipeline/read/READ_results", header = TRUE, sep = "\t", as.is = TRUE)
str(READ_kinresults)
#> 'data.frame':	7021 obs. of  4 variables:
#>  $ PairIndividuals: chr  "RGID1_S10RGID1_S11" "RGID1_S10RGID1_S19" "RGID1_S10RGID1_S23" "RGID1_S10RGID1_S26" ...
#>  $ Relationship   : chr  "Unrelated" "Unrelated" "Unrelated" "Unrelated" ...
#>  $ Z_upper        : num  NA NA NA NA NA NA NA NA NA NA ...
#>  $ Z_lower        : num  -7.47 -1.43 -4.65 -8.37 -2.51 ...
```

Merge these two result files


```r
READ_results <- left_join(READ_rawresults, READ_kinresults, by = "PairIndividuals")
str(READ_results)
#> 'data.frame':	7021 obs. of  8 variables:
#>  $ PairIndividuals            : chr  "RGID1_S10RGID1_S11" "RGID1_S10RGID1_S19" "RGID1_S10RGID1_S23" "RGID1_S10RGID1_S26" ...
#>  $ Normalized2AlleleDifference: num  0.975 0.922 0.962 0.994 0.931 ...
#>  $ StandardError              : num  0.00922 0.01094 0.012 0.01045 0.00995 ...
#>  $ NonNormalizedP0            : num  0.338 0.32 0.334 0.345 0.323 ...
#>  $ NonNormalizedStandardError : num  0.0032 0.00379 0.00416 0.00363 0.00345 ...
#>  $ Relationship               : chr  "Unrelated" "Unrelated" "Unrelated" "Unrelated" ...
#>  $ Z_upper                    : num  NA NA NA NA NA NA NA NA NA NA ...
#>  $ Z_lower                    : num  -7.47 -1.43 -4.65 -8.37 -2.51 ...
```

Now we need to split the *PairIndividuals* into individual 1 and 2, identify these individuals and then create the dyads corresponding to the previous results.


```r
#Need to split PairIndividuals into 2 new columns
READ_results$RGSM_a <- gsub("(RGID[[:alnum:]]{1}_S[[:alnum:]]{1,2})(RGID[[:alnum:]]{1}_S[[:alnum:]]{1,2})", "\\1", READ_results$PairIndividuals)

READ_results$RGSM_b <- gsub("(RGID[[:alnum:]]{1}_S[[:alnum:]]{1,2})(RGID[[:alnum:]]{1}_S[[:alnum:]]{1,2})", "\\2", READ_results$PairIndividuals)

#create a new column that includes RGSM_dyad
READ_results$RGSM_dyad <- if_else(READ_results$RGSM_a < READ_results$RGSM_b, paste(READ_results$RGSM_a, READ_results$RGSM_b, sep = "-"), paste(READ_results$RGSM_b, READ_results$RGSM_a, sep = "-"))

str(READ_results)
#> 'data.frame':	7021 obs. of  11 variables:
#>  $ PairIndividuals            : chr  "RGID1_S10RGID1_S11" "RGID1_S10RGID1_S19" "RGID1_S10RGID1_S23" "RGID1_S10RGID1_S26" ...
#>  $ Normalized2AlleleDifference: num  0.975 0.922 0.962 0.994 0.931 ...
#>  $ StandardError              : num  0.00922 0.01094 0.012 0.01045 0.00995 ...
#>  $ NonNormalizedP0            : num  0.338 0.32 0.334 0.345 0.323 ...
#>  $ NonNormalizedStandardError : num  0.0032 0.00379 0.00416 0.00363 0.00345 ...
#>  $ Relationship               : chr  "Unrelated" "Unrelated" "Unrelated" "Unrelated" ...
#>  $ Z_upper                    : num  NA NA NA NA NA NA NA NA NA NA ...
#>  $ Z_lower                    : num  -7.47 -1.43 -4.65 -8.37 -2.51 ...
#>  $ RGSM_a                     : chr  "RGID1_S10" "RGID1_S10" "RGID1_S10" "RGID1_S10" ...
#>  $ RGSM_b                     : chr  "RGID1_S11" "RGID1_S19" "RGID1_S23" "RGID1_S26" ...
#>  $ RGSM_dyad                  : chr  "RGID1_S10-RGID1_S11" "RGID1_S10-RGID1_S19" "RGID1_S10-RGID1_S23" "RGID1_S10-RGID1_S26" ...
```

We join together the relatedness estimates with the sample information, to know the identity of the dyads


```r

#first include ID of individual a
READ_results_ID <- left_join(READ_results, seqlib_overview[6:7], by = c("RGSM_a" = "RGSM"))

#rename "ID" to "ID_a"
READ_results_ID <- rename(READ_results_ID, "ID_a" = "ID")

#now include ID of individual b
READ_results_ID <- left_join(READ_results_ID, seqlib_overview[6:7], by = c("RGSM_b" = "RGSM"))

#rename "ID" to "ID_b"
READ_results_ID <- rename(READ_results_ID, "ID_b" = "ID")

#create a new column that includes the dyad
READ_results_ID$dyad <- if_else(READ_results_ID$ID_a < READ_results_ID$ID_b, paste(READ_results_ID$ID_a, READ_results_ID$ID_b, sep = "-"), paste(READ_results_ID$ID_b, READ_results_ID$ID_a, sep = "-"))

#remove duplicates ##maybe not necessary anymore

READ_results_ID <- distinct(READ_results_ID)
```

Let's have a closer look at the samples that were sequenced twice


```r
#find samples that were sequenced twice
duplicates <- filter(READ_results_ID, ID_a == ID_b)

#average relatedness of these duplicted inidividuals
mean(duplicates$NonNormalizedP0)
#> [1] 0.315183

#range
range(duplicates$NonNormalizedP0)
#> [1] 0.2880766 0.3502312
```


We also include the group information


```r
#first include group of individual a
READ_results_sample_info <- left_join(READ_results_ID, sample_info, by = c("ID_a" = "ID"))

#rename "Group_ID" to "a_Group"
READ_results_sample_info <- rename(READ_results_sample_info, "a_Group" = "Group_ID")
READ_results_sample_info <- rename(READ_results_sample_info, "a_sex" = "sex")

#then include group of individual b
READ_results_sample_info <- left_join(READ_results_sample_info, sample_info, by = c("ID_b" = "ID"))
READ_results_sample_info <- rename(READ_results_sample_info, "b_sex" = "sex")

#rename "Group_ID" to "b_Group"
READ_results_sample_info <- rename(READ_results_sample_info, "b_Group" = "Group_ID")
```


```r
#create new column that specifies if individuals are from same or different groups
READ_results_sample_info <- READ_results_sample_info %>%
  mutate(dyad_group = case_when(ID_a == ID_b ~ "identical",
                                a_Group == b_Group ~ "intragroup",
                                a_Group != b_Group ~ "intergroup"))

unique(READ_results_sample_info$dyad_group)
#> [1] "intergroup" "intragroup" NA           "identical"
```


```r
#create new column that specifies if individuals have same or different sex
READ_results_sample_info <- READ_results_sample_info %>%
  mutate(dyad_sex = case_when(ID_a == ID_b ~ "identical",
                                a_sex == b_sex ~ "same sex",
                                a_sex != b_sex ~ "male-female")) 

#recode dyads for individuals with undetermined sex to NA
READ_results_sample_info$dyad_sex[READ_results_sample_info$a_sex == "u"] <- NA
READ_results_sample_info$dyad_sex[READ_results_sample_info$b_sex == "u"] <- NA

#recode same sex dyads to male or female
READ_results_sample_info$dyad_sex[READ_results_sample_info$dyad_sex == "same sex" & 
                                         READ_results_sample_info$a_sex == "f"] <- "female"
READ_results_sample_info$dyad_sex[READ_results_sample_info$dyad_sex == "same sex" & 
                                         READ_results_sample_info$a_sex == "m"] <- "male"


unique(READ_results_sample_info$dyad_sex)
#> [1] NA            "male-female" "male"        "identical"   "female"
```


```r

theme_set(theme_classic())

#plot relatedness P0 (y-axis) for every dyad (x-axis), ordered from low to high relatedness and colored according to inter- or intragroup dyad

ggplot(READ_results_sample_info, aes(x = reorder(PairIndividuals, NonNormalizedP0), y = NonNormalizedP0, color = dyad_sex)) +
  
  geom_point(alpha = 0.1, aes(y = NonNormalizedP0)) + #plot relatedness estimates as points 
  
  labs( x = "Dyad", y = "Relatedness (READ)") 
```

<img src="2_data_files/figure-html/figure dyadic relatedness (READ) distribution-1.png" width="672" />


```r
theme_set(theme_classic())

#plot relatedness pi_HAT (y-axis) for the different categories of sex of dyad (x-axis) colored according to group membership

ggplot(READ_results_sample_info, aes(x = dyad_sex, y = NonNormalizedP0, color = dyad_group)) +
  
  geom_point(alpha = 0.2) +
  
  geom_boxplot()
```

<img src="2_data_files/figure-html/figure (READ) relatedness for group and sex-1.png" width="672" />

```r

 ggtitle("relatedness (READ)")
#> $title
#> [1] "relatedness (READ)"
#> 
#> attr(,"class")
#> [1] "labels"
```


#### Combined relatedness results



merge ngsrelate and lcmlkin


```r
relate_results <- full_join(ngsRelate_results_sample_info, lcmlkin_results_sample_info, by = "RGSM_dyad")
relate_results <- full_join(relate_results, READ_results_sample_info, by = "RGSM_dyad")
```

plot




```r

theme_set(theme_classic())

#plot relatedness pi_HAT and rab (y-axis) for every dyad (x-axis), ordered from low to high relatedness and colored according to inter- or intragroup dyad

ggplot(filter(relate_results, coverage > 0.95), aes(x = reorder(dyad, pi_HAT), color = dyad_sex)) +
  
  
  geom_point(alpha = 0.5, aes(y = pi_HAT), shape = 15) + #plot lcmlkin relatedness estimates as points 
  
  geom_point(alpha = 0.5, aes(y = NonNormalizedP0), shape = 16) + #plot READ estimate
  
  geom_point(alpha = 0.5, aes(y = rab), shape = 17) + # plot ngsRelate estimates
  
  scale_y_continuous(
    
    name = "relatedness (lcmlkin)", #features of first axis
    
    sec.axis = sec_axis(~., name = "P0") #features of second axis
  ) +
  
  ggtitle("Comparison of relatedness estimators (>0.95X)")
```

<img src="2_data_files/figure-html/figure dyadic relatedness distribution-1.png" width="672" />

Compare correlation among the three estimators



```r
ggplot(relate_results, aes(x = rab, y = pi_HAT, color = dyad_sex, size = nSites, shape = dyad_group.x)) +
  
  scale_colour_viridis_d() +
  
   geom_point(alpha = 0.2) 
#> Warning: Removed 1026 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/correlation ngsrelate lcmlkin-1.png" width="672" />


```r

ggplot(relate_results, aes(x = rab, y = NonNormalizedP0, color = dyad_sex, size = nSites, shape = dyad_group.x)) +
  
  scale_colour_viridis_d() +
  
  geom_point(alpha = 0.2) 
#> Warning: Removed 1026 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/correlation ngsrelate READ-1.png" width="672" />


```r

ggplot(relate_results, aes(x = pi_HAT, y = NonNormalizedP0, color = dyad_sex, size = nSites, shape = dyad_group.x)) +
  
  scale_colour_viridis_d() +
  
  geom_point(alpha = 0.2) 
#> Warning: Removed 1026 rows containing missing values (geom_point).
```

<img src="2_data_files/figure-html/correlation lcmlkin READ-1.png" width="672" />



For comparison of relatedness estimators check Yaka et al. 2021 Curr Biol.







---
