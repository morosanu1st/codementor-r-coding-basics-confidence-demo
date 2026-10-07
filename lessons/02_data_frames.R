# Lesson 2: data frames, the shape of every assignment dataset ------------

# Built-in data so this runs anywhere. For your own file use:
# df <- read.csv("my_data.csv", stringsAsFactors = FALSE)
df <- mtcars
df$car <- rownames(mtcars)

# 1. Inspect before you analyse
head(df)
str(df)
summary(df)
dim(df)

# 2. Select columns and filter rows
df[, c("car", "mpg", "hp")]
df[df$mpg > 25, c("car", "mpg")]
subset(df, cyl == 4 & hp < 100, select = c(car, mpg, hp))

# 3. Create new columns
df$kpl <- df$mpg * 0.425144          # miles per gallon -> km per litre
df$transmission <- factor(df$am, levels = c(0, 1), labels = c("automatic", "manual"))
table(df$transmission)

# 4. Missing values
df_na <- df
df_na$mpg[c(2, 5)] <- NA
sum(is.na(df_na$mpg))
mean(df_na$mpg)                      # NA, because one value is missing
mean(df_na$mpg, na.rm = TRUE)        # ignore missing values
complete <- df_na[complete.cases(df_na), ]
nrow(complete)

# 5. Group summaries
aggregate(mpg ~ cyl, data = df, FUN = mean)
aggregate(cbind(mpg, hp) ~ transmission, data = df, FUN = median)
tapply(df$mpg, df$cyl, sd)

# 6. Sorting
head(df[order(-df$mpg), c("car", "mpg")], 5)
