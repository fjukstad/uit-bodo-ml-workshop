library(tidymodels)
library(tidyverse)
library(ggcorrplot)

data = read_csv("data/diabetes.csv", 
                col_types = cols(Outcome=col_factor()))

# Overall, this data set consists of 768 observations of 9 variables: 8
# variables which will be used as model predictors (number of times pregnant,
# plasma glucose concentration, diastolic blood pressure (mm Hg), triceps skin
# fold thickness (in mm), 2-hr serum insulin measure, body mass index, a
# diabetes pedigree function, and age) and 1 outcome variable (whether or not
# the patient has diabetes).

dim(data)

summary(data)

    

ggplot(data, aes(x=Pregnancies, fill=Outcome)) + 
  geom_histogram(position="stack")

ggplot(data, aes(x=Pregnancies, fill=Outcome)) + 
  geom_histogram() + 
  facet_grid(Outcome ~ .)

ggplot(data, aes(x=BMI, fill=Outcome)) + 
  geom_histogram() + 
  facet_grid(Outcome ~ .)

ggplot(data, aes(x=BloodPressure, fill=Outcome)) + 
  geom_histogram() + 
  facet_grid(Outcome ~ .)


ggplot(data, aes(x=Age, fill=Outcome)) + 
  geom_histogram() + 
  facet_grid(Outcome ~ .)


ggplot(data, aes(x=Glucose, fill=Outcome)) + 
  geom_histogram() + 
  facet_grid(Outcome ~ .)

ggcorrplot(cor(data %>% select(-Outcome)), type="lower")

data_split = initial_split(data, strata="Outcome",p=0.8)

testing = testing(data_split)
training = training(data_split)

# random_forest_fit = 
#   rand_forest(mode="classification") %>% 
#   set_engine("randomForest") %>% # use randomForest pkg 
#   fit(Outcome ~ ., data=training)
# 
# predictions = random_forest_fit %>% 
#               predict(testing, type="class") %>% 
#               bind_cols(testing) %>% 
#               arrange(Outcome)
# 
# predictions %>% 
#   metrics(truth = Outcome, estimate=.pred_class)
# 
# conf_mat(predictions, truth=Outcome, estimate=.pred_class)


# Glucose: Plasma glucose concentration a 2 hours in an oral glucose tolerance test
# Diabetes Pedigree Function: diabetes history in relatives and the genetic relationship of those relatives to the patient

log_reg = logistic_reg() %>%
          set_engine("glm") %>% #engine is what package to use 
          set_mode("classification") %>%
          fit(Outcome ~ Glucose + BMI + DiabetesPedigreeFunction, data = training)

log_reg

predictions =  log_reg %>% 
                predict(testing, type="class") %>% 
                bind_cols(testing) %>% 
                arrange(Outcome)

predictions %>% 
  metrics(truth = Outcome, estimate=.pred_class)


conf_mat(predictions, truth=Outcome, estimate=.pred_class)

predict(log_reg, data.frame(Glucose=150, BMI=31, DiabetesPedigreeFunction=0.3), type="class")

saveRDS(log_reg,file="models/model.Rds")
