library(plumber)

load("../model.Rda")

#* @apiTitle Bjørns Diabetes Prediction API
#* 
#* Tries to predict if person has diabetes or not.  
#* @param glucose The blood glucose
#* @param bmi The body mass index
#* @param diabetesPedigreeFunction 
#* @post /predict
function(glucose, bmi, diabetesPedigreeFunction) {
  input = data.frame(Glucose=as.numeric(glucose),
                                BMI = as.numeric(bmi),
                                DiabetesPedigreeFunction = as.numeric(diabetesPedigreeFunction))
  
  prediction = predict(log_reg, input)
  
  return(as.numeric(as.character(prediction)))
}
