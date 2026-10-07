# Lesson 4: plots for your report (base R only) ----------------------------
df <- mtcars
df$transmission <- factor(df$am, levels = c(0, 1), labels = c("automatic", "manual"))

hist(df$mpg, breaks = 10, main = "Distribution of fuel efficiency",
     xlab = "Miles per gallon", col = "lightblue")

boxplot(mpg ~ transmission, data = df, main = "MPG by transmission",
        xlab = "Transmission", ylab = "Miles per gallon", col = c("grey80", "orange"))

plot(mpg ~ wt, data = df, pch = 19, main = "Heavier cars use more fuel",
     xlab = "Weight (1000 lbs)", ylab = "Miles per gallon")
abline(lm(mpg ~ wt, data = df), col = "red", lwd = 2)

# Save a figure to include in your assignment
png("mpg_vs_weight.png", width = 800, height = 600)
plot(mpg ~ wt, data = df, pch = 19, xlab = "Weight (1000 lbs)", ylab = "Miles per gallon")
abline(lm(mpg ~ wt, data = df), col = "red", lwd = 2)
dev.off()
