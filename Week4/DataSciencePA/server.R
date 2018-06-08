library(shiny)
library(ggplot2)
library(caret)
library(randomForest)
library(e1071)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
   
  output$sepal.plot <- renderPlot({
    set.seed(2018-09-06)
    fit <- train(Species ~ Sepal.Length + Sepal.Width, method="rf", data=iris)
    
    inputx <- input$sepal.length
    inputy <- input$sepal.width
    
    newdf = data.frame(Sepal.Length = c(inputx), Sepal.Width = c(inputy))
    predictedVal <- predict(fit, newdata = newdf)
    
    colorValues <- c("setosa" = "salmon", "versicolor" = "green", "virginica" = "blue")
    p <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
        geom_point(data = iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species)) + 
        scale_colour_manual(values = colorValues)
    
    p <- p + geom_point(aes(x=inputx, y=inputy), colour=colorValues[predictedVal], shape = 8, size = 5, stroke = 2)
    
    p
    
  })
  
  output$petal.plot <- renderPlot({
      set.seed(2018-09-06)
      fit <- train(Species ~ Petal.Length + Petal.Width, method="rf", data=iris)
      
      inputx <- input$petal.length
      inputy <- input$petal.width
      
      newdf = data.frame(Petal.Length = c(inputx), Petal.Width = c(inputy))
      predictedVal <- predict(fit, newdata = newdf)
      
      colorValues <- c("setosa" = "salmon", "versicolor" = "green", "virginica" = "blue")
      p <- ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
          geom_point(data = iris, aes(x = Petal.Length, y = Petal.Width, colour = Species)) + 
          scale_colour_manual(values = colorValues)
      
      p <- p + geom_point(aes(x=inputx, y=inputy), colour=colorValues[predictedVal], shape = 8, size = 5, stroke = 2)
      
      p
      
  })
  
})
