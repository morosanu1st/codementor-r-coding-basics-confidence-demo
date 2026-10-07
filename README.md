# R coding basics for university assignments: a confidence-building tutor demo

A small, runnable R course outline I use with students who have R-based statistics assignments and feel lost. Every script uses only base R and built-in datasets (`mtcars`, `iris`, `ToothGrowth`), so it runs on a fresh R / RStudio install with no packages.

## How I'd help

1. **First session: your assignment, not a textbook.** We open one of your real assignment questions and solve it together, line by line, so you see the full path from "load the data" to "write the answer".
2. **Build a reusable mental model.** Every assignment boils down to the same five steps: *load → inspect → clean → analyse → report*. The lessons below follow exactly that order.
3. **You type, I guide.** You write the code yourself during the session; I explain each error message so errors stop being scary.
4. **Short exercises between sessions** (see `exercises/`) with worked solutions, so confidence keeps building without me.

## Lessons

| File | What you learn |
|---|---|
| `lessons/01_r_basics.R` | Objects, vectors, data types, indexing, functions, reading error messages |
| `lessons/02_data_frames.R` | Loading CSVs, `str()`/`summary()`, selecting, filtering, new columns, missing values, grouping with `aggregate()` |
| `lessons/03_stats_for_assignments.R` | Descriptive stats, t-test, chi-squared, correlation, linear regression, and how to *report* each result in words |
| `lessons/04_plots.R` | Histograms, boxplots, scatter plots with a regression line, saving figures for your report |
| `exercises/exercises.R` | Ten practice questions in assignment style |
| `solutions/solutions.R` | Worked solutions with comments |

## Run it

```r
# In RStudio: open the folder as a project, then
source("lessons/01_r_basics.R", echo = TRUE)
```

Or from a terminal: `Rscript lessons/03_stats_for_assignments.R`.

## The assignment checklist

- Did I look at the data (`str`, `summary`, `head`) before analysing it?
- Did I handle missing values and wrong types (`as.numeric`, `factor`)?
- Does my test match the question (difference in means, association, relationship)?
- Did I check assumptions (normality, equal variance) or say why not?
- Did I report the result in a sentence: statistic, degrees of freedom, p-value, and what it means?

---
Tutor: Mihai Chindriș, available on Codementor for 1:1 and long-term R / statistics tutoring.
