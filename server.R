library(shiny)
library(datasets)

carsdata <- mtcars
carsdata$am <- factor(carsdata$am, labels = c("Automatic", "Manual"))

colnames(carsdata)[2] <- "Cylinders"
colnames(carsdata)[9] <- "Transmission"
colnames(carsdata)[10] <- "Gears"
colnames(carsdata)[11] <- "Carburetors"

shinyServer(function(input, output) {

  formulaText <- reactive({
    paste("mpg ~", input$variable)
  })

  output$caption <- renderText({
    formulaText()
  })

  output$mpgPlot <- renderPlot({
    boxplot(as.formula(formulaText()),
            data = carsdata, col = "grey", horizontal = FALSE, main= "Cars Mileage Analysis",
            xlab = input$variable, ylab = "Miles Per Gallon", notch=FALSE)
  })

  output$Avg_Mileage <- renderTable({aggregate(as.formula(formulaText()), carsdata,mean)})

  output$Median_Mileage <- renderTable({aggregate(as.formula(formulaText()), carsdata,median)})

  output$Max_Mileage <- renderTable({aggregate(as.formula(formulaText()), carsdata, max)})

  output$SD_Mileage <- renderTable({aggregate(as.formula(formulaText()), carsdata, sd)})

})
