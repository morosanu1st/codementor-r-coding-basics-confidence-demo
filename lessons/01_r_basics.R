# Lesson 1: R basics -----------------------------------------------------
# Goal: feel comfortable with objects, vectors, indexing and functions.

# 1. Objects: give a value a name with <-
age <- 21
name <- "student"
passed <- TRUE
class(age); class(name); class(passed)

# 2. Vectors: most things in R are vectors
scores <- c(68, 74, 81, 59, 90)
length(scores)
mean(scores)
scores * 2            # operations apply to every element
scores > 70           # gives a logical vector
scores[scores > 70]   # use it to filter

# 3. Indexing starts at 1, not 0
scores[1]
scores[2:4]
scores[-1]            # everything except the first

# 4. Named vectors and lists
grades <- c(math = 81, stats = 74, r = 90)
grades["stats"]
student <- list(name = "A", scores = scores, passed = TRUE)
student$scores

# 5. Writing your own function
standardise <- function(x) {
  (x - mean(x)) / sd(x)
}
round(standardise(scores), 2)

# 6. Reading error messages (uncomment one at a time to see them)
# mean(score)          # Error: object 'score' not found -> check spelling
# "5" + 1              # Error: non-numeric argument -> convert with as.numeric("5")
# c(1, 2, "3")         # No error, but everything becomes character: check class()

# 7. Getting help
# ?mean                # opens the help page
# example(mean)        # runs the examples at the bottom of the help page
