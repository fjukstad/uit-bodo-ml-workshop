FROM rstudio/plumber

RUN R -e "install.packages('tidymodels')"

COPY . /app

WORKDIR /app/diabetes-prediction

CMD ["/app/diabetes-prediction/plumber.R"]
