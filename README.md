# uit-bodo-ml-workshop
My notes and code for a workshop simple ML for students at UiT Bodø. I live
coded the workshop, but had to have some notes somewhere. The `tidyverse`,
`tidymodels` and `plumber` are just awesome pieces of software. 

# Workshop in brief (live-coding this part)

- Set up a workspace on [rstudio.cloud](http://rstudio.cloud)
- Download the [Pima Indians Diabetes Database dataset](https://www.kaggle.com/uciml/pima-indians-diabetes-database) 
  from Kaggle. You'll get something like [data/diabetes.csv](diabetes.csv). 
- Create some sort of model. Take a look at [analysis.R](analysis.R) for a
  logistic regression model, aka peak ML.
- Create a [plumber](https://www.rplumber.io/) API for your model, and run it!
  See [diabetes-prediction/diabetes-prediction.R](/diabetes-prediction/plumber.R)
