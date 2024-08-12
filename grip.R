#THE SPARK FOUNDATION - DATA SCIENCE & BUSINESS ANALYTICS INTERNSHIP
#GRIP TASK 1 : PREDICTION USING SUPERVISED ML WITH R
#Predict the percentage of an student based on the number of study hours
#This is a simple linear regression task of two variables, i.e; "Hours" and "Scores".
#We will predict the score if the student studies for 9.25 hours/day.


#importing Library function for Graphical Representation
library(ggplot2)

# Importing the Dataset
data <- read.csv("https://raw.githubusercontent.com/AdiPersonalWorks/Random/master/student_scores%20-%20student_scores.csv")
head(data)

# Summary of Data
summary(data)

# Assigning variable to Data
hour <- data$Hours
score <- data$Scores

# Declaring the Model
model <- lm(score ~ hour, data = data)
print(model)

# Plotting of model
ggplot(data = data, aes(x = Hours, y = Scores)) +
  geom_point() +
  labs(x = "Hours Studied", y = "Scores", title = "Hours vs Scores") +
  geom_smooth(method = "lm", col = "red")

#Comparing actual and Predicted scores
actual=score
hour=data.frame(hour)
predicted=predict(model,hour)
cbind(actual,predicted)

#Predicted score if the student study for 9.25 hrs/day
test=data.frame(hour=9.25)
predict(model,test)

#92.90985 is the  Predicted score if the student study for 9.25 hrs/day
