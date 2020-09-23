library(plumber)
library(tidymodels)

# Within a docker container 
log_reg = readRDS("/app/models/model.Rds")

# Outside a container
# log_reg = readRDS("../models/model.Rds")

#* @filter cors
cors <- function(req, res) {
  # res$setHeader("test","testings")
  res$setHeader("Access-Control-Allow-Origin", "*")
  plumber::forward()
}


#* @apiTitle Bjørns Diabetes Prediction API
#* 
#* Tries to predict if person has diabetes or not.  
#* @param glucose Plasma glucose concentration.
#* @param bmi The body mass index (BMI).
#* @param diabetesPedigreeFunction diabetes history in relatives and the genetic relationship of those relatives to the patient
#* @preempt cors
#* @get /predict
function(res, glucose, bmi, diabetesPedigreeFunction) {

  input = data.frame(Glucose = as.numeric(glucose),
                                BMI = as.numeric(bmi),
                                DiabetesPedigreeFunction = as.numeric(diabetesPedigreeFunction))

  prediction = predict(log_reg, input)
  
  res$setHeader("Access-Control-Allow-Origin", "*")
  res$setHeader("testings","testings")

  return(as.numeric(as.character(prediction)))
}



