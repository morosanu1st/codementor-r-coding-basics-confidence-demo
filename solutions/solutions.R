# Worked solutions for exercises/exercises.R
df <- iris

# Q1
dim(df); str(df)

# Q2
aggregate(Sepal.Length ~ Species, data = df, FUN = function(x) c(mean = mean(x), sd = sd(x)))

# Q3
df$Petal.Ratio <- df$Petal.Length / df$Petal.Width
head(df)

# Q4
sum(df$Sepal.Length > 6)

# Q5
two <- droplevels(subset(df, Species %in% c("setosa", "versicolor")))
tt <- t.test(Sepal.Length ~ Species, data = two)
tt
cat(sprintf("Versicolor sepals were longer than setosa sepals, t(%.1f) = %.2f, p %s.\n",
            tt$parameter, abs(tt$statistic),
            ifelse(tt$p.value < .001, "< .001", sprintf("= %.3f", tt$p.value))))

# Q6
fit <- aov(Petal.Length ~ Species, data = df)
summary(fit)
TukeyHSD(fit)

# Q7
cor.test(df$Petal.Length, df$Petal.Width)

# Q8
m <- lm(Petal.Width ~ Petal.Length, data = df)
coef(m)["Petal.Length"]
summary(m)$r.squared

# Q9
boxplot(Sepal.Width ~ Species, data = df, main = "Sepal width by species",
        xlab = "Species", ylab = "Sepal width (cm)")

# Q10
summarise_column <- function(x) {
  c(mean = mean(x, na.rm = TRUE), median = median(x, na.rm = TRUE),
    sd = sd(x, na.rm = TRUE), min = min(x, na.rm = TRUE), max = max(x, na.rm = TRUE))
}
summarise_column(df$Sepal.Length)
