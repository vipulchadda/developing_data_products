library(shiny)

# Define UI for application that predicts the species based on sepal size and petal size.
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predicting Iris species based on sepal size and petal size."),
  
  # Sidebar with a slider inputs for different sizes 
  sidebarLayout(
    sidebarPanel(
        wellPanel(
            h3("Sepal size"),
            div("The iris species will be predicted based on the Sepal length and width selected below"),
            sliderInput("sepal.length", "Sepal Length:",
                        min = 4, max = 8, value = 6, step = 0.2),
            sliderInput("sepal.width", "Sepal Width:",
                        min = 1.8, max = 4.6, value = 3.2, step = 0.2)
        ),
        wellPanel(
            h3("Petal size"),
            div("The iris species will be predicted based on the Petal length and width selected below"),
            sliderInput("petal.length", "Petal Length:",
                        min = 1, max = 7, value = 4, step = 0.2),
            sliderInput("petal.width", "Petal Width:",
                        min = 0, max = 3.2, value = 1.6, step = 0.2)
        )
       
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
        h3("Sepal size"),
        plotOutput("sepal.plot"),
        hr(),
        h3("Petal size"),
        plotOutput("petal.plot")
      
    )
  )
))
