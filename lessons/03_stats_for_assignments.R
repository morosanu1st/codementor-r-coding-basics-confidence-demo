# Lesson 3: the statistics that show up in most assignments ----------------
df <- mtcars
df$transmission <- factor(df$am, levels = c(0, 1), labels = c("automatic", "manual"))

# 1. Descriptive statistics
mean(df$mpg); median(df$mpg); sd(df$mpg); IQR(df$mpg)
quantile(df$mpg, c(0.25, 0.5, 0.75))

# 2. Difference in means between two groups: t-test
# Question: do manual cars have different fuel efficiency than automatic cars?
shapiro.test(df$mpg[df$transmission == "manual"])     # normality check per group
shapiro.test(df$mpg[df$transmission == "automatic"])
tt <- t.test(mpg ~ transmission, data = df)           # Welch t-test by default
tt
cat(sprintf(
  "Manual cars had higher mpg than automatic cars, t(%.1f) = %.2f, p = %.4f.\n",
  tt$parameter, abs(tt$statistic), tt$p.value
))

# 3. Association between two categorical variables: chi-squared
tab <- table(df$cyl, df$transmission)
tab
chisq.test(tab)            # warns when expected counts are small
fisher.test(tab)           # use this instead for small samples

# 4. Correlation
cor(df$mpg, df$wt)
cor.test(df$mpg, df$wt)

# 5. Linear regression
model <- lm(mpg ~ wt + hp, data = df)
summary(model)
confint(model)
# How to read it: each extra 1000 lbs of weight changes mpg by the wt coefficient,
# holding horsepower constant. R-squared = share of variation in mpg explained.

# 6. Check the model assumptions
par(mfrow = c(2, 2)); plot(model); par(mfrow = c(1, 1))

# 7. Comparing more than two groups: one-way ANOVA
tg <- ToothGrowth
tg$dose <- factor(tg$dose)
fit <- aov(len ~ dose, data = tg)
summary(fit)
TukeyHSD(fit)
