library(plumber)

log_reg = readRDS("../models/model.Rds")

#* @apiTitle Bjørns Diabetes Prediction API
#* 
#* Tries to predict if person has diabetes or not.  
#* @param glucose Plasma glucose concentration.
#* @param bmi The body mass index (BMI).
#* @param diabetesPedigreeFunction diabetes history in relatives and the genetic relationship of those relatives to the patient
#* @post /predict
function(glucose, bmi, diabetesPedigreeFunction) {
  input = data.frame(Glucose=as.numeric(glucose),
                                BMI = as.numeric(bmi),
                                DiabetesPedigreeFunction = as.numeric(diabetesPedigreeFunction))
  
  prediction = predict(log_reg, input)
  
  return(as.numeric(as.character(prediction)))
}
