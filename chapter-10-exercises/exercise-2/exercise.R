# Exercise 2: working with data frames

# Create a vector of 100 employees ("Employee 1", "Employee 2", ... "Employee 100")
# Hint: use the `paste()` function and vector recycling to add a number to the word
# "Employee"
employees <- paste("Employee", 1:100)


# Create a vector of 100 random salaries for the year 2017
# Use the `runif()` function to pick random numbers between 40000 and 50000
salaries_2017 <- runif(100, 40000, 50000)

# Create a vector of 100 annual salary adjustments between -5000 and 10000.
# (A negative number represents a salary decrease due to corporate greed)
# Again use the `runif()` function to pick 100 random numbers in that range.
adjustments <- runif(100, -5000, 10000)

# Create a data frame `salaries` by combining the 3 vectors you just made
# Remember to set `stringsAsFactors=FALSE`!
salaries <- data.frame(employees, salaries_2017, adjustments, stringsAsFactors = FALSE)

# Add a column to the `salaries` data frame that represents each person's
# salary in 2018 (e.g., with the salary adjustment added in).
salaries$salary_2018 <- salaries$salaries_2017 + salaries$adjustments

# Add a column to the `salaries` data frame that has a value of `TRUE` if the 
# person got a raise (their salary went up)
salaries$got_raise <- salaries$adjustments > 0


### Retrieve values from your data frame to answer the following questions
### Note that you should get the value as specific as possible (e.g., a single
### cell rather than the whole row!)

# What was the 2018 salary of Employee 57
print(salaries[employees == "Employee 57", "salary_2018"])

# How many employees got a raise?
print(sum(salaries$got_raise))
nrow(salaries[salaries$got_raise == TRUE,])

# What was the dollar value of the highest raise?
biggest_raise <- max(salaries$adjustments)
print(max(salaries$adjustments))


# What was the "name" of the employee who received the highest raise?
print(salaries[salaries$adjustments == max(adjustments),])
salaries[salaries$adjustments == biggest_raise,]
salaries[salaries$adjustments == biggest_raise,"employees"]

# What was the largest decrease in salaries between the two years?
biggest_cut <- min(salaries$adjustments)


# What was the name of the employee who recieved largest decrease in salary?
salaries[salaries$adjustments == biggest_cut,"employees"]

# What was the average salary change?
mean(salaries$adjustments)

# For people who did not get a raise, how much money did they lose on average?
mean(salaries$adjustments[salaries$got_raise == FALSE])

## Consider: do the above averages match what you expected them to be based on 
## how you generated the salaries?

# Write a .csv file of your salary data to your working directory
write.csv(salaries, "salaries.csv")
