library(dplyr)
library(stringr)
library(testthat)

# http://r-pkgs.had.co.nz/tests.html

setwd("H:/R/testthat")


# expect_equal

# passing test
test_that("str_length is number of characters", {
        expect_equal(str_length("a"), expected = 1)
        expect_equal(str_length("ab"), expected = 2)
        expect_equal(str_length("abc"), expected = 3)
})

# failing test
test_that("str_length is number of characters", {
        expect_equal(str_length("a"), expected = 1)
        expect_equal(str_length("ab"), expected = 1)
        expect_equal(str_length("abc"), expected = 2)
})


###########################################


# factors
test_that("str_length of factor is length of level", {
        expect_equal(str_length(factor("a")), 1)
        expect_equal(str_length(factor("ab")), 2)
        expect_equal(str_length(factor("abc")), 3)
})


########################################


# NA values
test_that("str_length of missing is missing", {
        expect_equal(str_length(NA), NA_integer_)
        expect_equal(str_length(c(NA, 1)), c(NA, 1))
        expect_equal(str_length("NA"), 2)
})


#############################################


# expect_match for strings
string <- "Testing is fun!"

expect_match(string, regexp = "Testing") 

# Fails, match is case-sensitive
expect_match(string, regexp = "testing")

# Additional arguments are passed to grepl:
expect_match(string, regexp = "testing", ignore.case = TRUE)


#######################################################


# expect_output which matches text printed to console
a <- list(1:10, letters)
a
str(a)

expect_output(str(a), regexp = "List of 2")

# fixed = TRUE allows regex to be taken literally, which disables special characters
expect_output(str(a), regexp = "int [1:10]", fixed = TRUE)

expect_message(library(mgcv), regexp = "This is mgcv")


#####################################################


# expect_is to test class inheritance
model <- lm(mpg ~ wt, data = mtcars)
expect_is(model, class = "lm")
expect_is(model, class = "glm")


#######################################################


# expect_true and expect_false
expect_true(2 + 2 == 4)
expect_true(2 + 2 == 5)

expect_false(2 + 2 == 5)
expect_false(2 + 2 == 4)
